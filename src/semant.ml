open Ast
open Sast


(* 

2. Check types of assignments (x : str[] = 5)
3. Make sure all variables and functions have been declared (includes getting a list of locals in each scope, somehow handle closures)
4. Duplicate names in function formals
5. Do full type inference
6. Do microC style semantic checking on the sections I can fully infer

sstmt:
  | SFunc of sfunc_decl
  | SBlock of stmt list 
  | SExpr of expr
  | SIf of expr * stmt * stmt
  | SFor of bind * expr * stmt
  | SWhile of expr * stmt
  | SReturn of expr
  | SClass of string * stmt
  | SAsn of bind list * expr

*)

(* 

could have a declared and maybedeclared list, as well as definitely typed and possibly typed. also need to have an explicitly typed list. expressions get translated into SAST versions if
all arguments and 

x = 3

if (condition):
	x : int = x

x = "hello"
*)


let stmt_to_string = function
  | Func(_, _, _) -> "FUNC"
  | Block(_) -> "BLOCK"
  | Expr(_) -> "EXPR"
  | If(_, _, _) -> "IF"
  | For(_, _, _) -> "FOR"
  | While(_, _) -> "WHILE"
  | Return(_) -> "RETURN"
  | Class(_, _) -> "CLASS"
  | Asn(_, _) -> "ASN"
  | Nop -> "NOP"

let expr_to_string = function
  | Binop(_, _, _) -> "BINOP"
  | Lit(_) -> "LIT"
  | Var(_) -> "VAR"
  | Unop(_, _) -> "UNOP"
  | Call(_, _) -> "CALL"
  | Method(_, _, _) -> "METHOD"
  | Field(_, _) -> "FIELD"
  | List(_) -> "LIST"

let type_to_array = function
  | Int -> IntArr
  | Bool -> BoolArr
  | String -> StringArr
  | Float -> FloatArr
  | Dyn -> Dyn

module StringMap = Map.Make(String)

let rec expr map = function
  | Lit(x) -> let typ = match x with | IntLit(x) -> Int | BoolLit(x) -> Bool | StringLit(x) -> String | FloatLit(x) -> Float in (typ, SLit(x)) (* convert lit to type, return (type, SLit(x)), check if defined in map *)
  | List(x) -> let rec aux typ out = function
    		| [] -> (type_to_array typ, SList(List.rev out, type_to_array typ))
  			| a :: rest -> let (t, e) = expr map a in if t = typ then aux typ (e :: out) rest else aux Dyn (e :: out) rest
  	      in (match x with
  	        | a :: rest -> let (t, e) = expr map a in aux t [e] rest
  	        | [] -> (Dyn, SList([], Dyn)) (* todo maybe do something with this special case *))
  | Var(Bind(x, t)) -> if StringMap.mem x map then let typ = StringMap.find x map in (typ, SVar(Bind(x, typ))) else raise (Failure ("NameError: name '" ^ x ^ "' is not defined"))
  | Binop(a, op, b) -> let (t1, e1) = expr map a in let (t2, e2) = expr map b in (match (t1, t2) with
    | (Dyn, Dyn) | (Dyn, _) | (_, Dyn) -> (Dyn, SBinop(e1, op, e2))
    | _ -> let same = t1 = t2 in (match op with
      | Add | Sub | Mul | Div when same && t1 = Int   -> (Int, SBinop(e1, op, e2))
      | Add | Sub | Mul | Div when same && t1 = Float -> (Float, SBinop(e1, op, e2))
      | Add | Sub | Mul | Div when same && t1 = Bool -> (Bool, SBinop(e1, op, e2))
      | Add when same && t1 = String -> (String, SBinop(e1, op, e2))
      | Sub | Mul | Div when t1 = String or t2 = String -> raise (Failure ("TypeError: unsupported operand type(s)"))

      | Add | Sub | Mul | Div when t1 = Int || t1 = Float || t1 = Bool && t2 = Int || t2 = Float || t2 = Bool -> (Float, SBinop(e1, op, e2))

      | Eq | Neq | Less | Leq | Greater | Geq -> (Bool, SBinop(e1, op, e2)) (* will have to fix later for strings *)
      | And | Or when same && t1 = Bool -> (Bool, SBinop(e1, op, e2)))) (* will have to fix this later *)
  
  | _ as temp -> print_endline (expr_to_string temp); (Dyn, SNoexpr)

let check_assign map typ = function (* t is float, t' is int, typ is int *)
  | Bind(n, t) when StringMap.mem n map ->
  		 let t' = StringMap.find n map in 
  			(match typ with
  		  	| Dyn -> (map, Bind(n, Dyn))
  		 	| _ -> (match t' with
  		 	 	  | Dyn -> (match t with 
  			  	      | Dyn -> (map, Bind(n, Dyn))
  			  	      | _ when t = typ -> let m' = StringMap.add n t map in (m', Bind(n, t))
  			  	      | _ -> raise (Failure ("TypeError: invalid type assigned to " ^ n)))
  			  	  | _ -> (match t with
  			  	  	  | Dyn when t' = typ -> (map, Bind(n, Dyn))
  			  	  	  | _ when t = typ -> let m' = StringMap.add n t map in (m', Bind(n, t))
  			  	  	  | _ -> raise (Failure ("TypeError: invalid type assigned to " ^ n)))
  			  	  | _ -> raise (Failure ("TypeError: invalid type assigned to " ^ n))))
  | Bind(n, t) when not (StringMap.mem n map) -> if t = typ then let m' = StringMap.add n t map in (m', Bind(n, t))
	  		else if t = Dyn then let m' = StringMap.add n Dyn map in (m', Bind(n, t))
	  		else raise (Failure ("TypeError: invalid type assigned to " ^ n))
  | _ -> raise (Failure ("TypeError: invalid types for assignment."))

let check_array map e b = let (typ, e') = expr map e in match typ with
  | IntArr -> check_assign map Int b
  | FloatArr -> check_assign map Float b
  | BoolArr -> check_assign map Bool b
  | StringArr -> check_assign map String b
  | Dyn -> (map, b)
  | _ -> raise (Failure ("TypeError: invalid types for assignment."))

let rec stmt map = function
  | Asn(binds, e) -> let (typ, e') = expr map e in let rec aux (m, out) = function
      | [] -> (m, List.rev out)
      | a :: t -> let (m, x) = check_assign map typ a in aux (m, x :: out) t in
    let (m, out) = aux (map, []) binds in (m, SAsn(out, e'))
  | Expr(e) -> let (t, e') = expr map e in (map, SExpr(e'))
  | Block(s) -> let (value, map') = check map [] s in (map', SBlock(value))
  | If(a, b, c) ->  let (typ, e') = expr map a in let (map', value) = stmt map b in let (map'', value') = stmt map' c in (map'', SIf(e', value, value'))
  | For(a, b, c) -> let (m, x) = check_array map b a in let (m', x') = stmt m c in let (typ, e') = expr m' b in (m', SFor(x, e', x'))
  | While(a, b) -> let (_, e) = expr map a in let (m', x') = stmt map b in (m', SWhile(e, x'))
  | Nop -> (map, SNop)
  | _ as temp -> print_endline (stmt_to_string temp); (map, SNop)

and check map out = function 
  | [] -> (List.rev out, map)
  | a :: t -> let (m', value) = stmt map a in check m' (value :: out) t
;;






