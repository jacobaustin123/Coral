(* open Ast
open Sast
open Getopt (* package used to handle command line arguments *)
open Utilities

(* Interpret defined a minimal interpreter for a very small subset of our language. This
interpreter is capable of handling floating point types and a subset of the allowed expressions
and statements *) 

(* expr -> (float, map), used to evaluate expressions *)
let rec eval_expr map = function 
  | Lit(x) -> (match x with 
     | FloatLit(y) -> (y, map)
     | IntLit(y) -> (float_of_int y, map)
     | BoolLit(y) -> (float_of_bool y, map)
     | StringLit(_) -> raise (Runtime "NotImplementedError: Strings have not yet been implemented!");
   )

  | List(x) -> (raise (Runtime "NotImplementedError: Lists have not yet been implemented!"); )
  | Var(Bind(x, _)) -> 
    (try 
       let Expr(v) = (StringMap.find x map) in 
       eval_expr map v 
      with Not_found -> Printf.printf "NameError: name '%s' is not defined!\n" x; flush stdout; raise Not_found
    )
  | Unop(op, v) -> 
    let (v1, m1) = eval_expr map v in
    (match op with
      | Neg -> (-.v1, m1)
      | Not -> if v1 = 0.0 then (1.0, m1) else (0.0, m1)
    )
  | Call(x, args) -> match x with
    | Var(Bind(name, typ)) -> 
      (try let Func(_, a, ex) = StringMap.find name map in 
        let zipped = zip a args in 
        let m1 = List.fold_left add_to_map map zipped in 
        let (v2, _) = eval_stmt m1 ex in (v2, map) 
      with 
        Not_found -> Printf.printf "NameError: name '%s' is not defined!\n" name; flush stdout; raise Not_found
      )
    | _ -> raise (Runtime "NotImplementedError: Anonymous functions have not been implemented!");

  | Method(_, _, _) -> raise (Runtime "NotImplementedError: Methods have not yet been implemented!");
  | Field(_, _) -> raise (Runtime "NotImplementedError: Fields have not yet been implemented!");
  
  | Binop(e1, op, e2) ->
    let (v1, m1) = eval_expr map e1 in 
    let (v2, m2) = eval_expr m1 e2 in
    (match op with
      | Add -> (v1 +. v2, m2)
      | Sub -> (v1 -. v2, m2)
      | Mul -> (v1 *. v2, m2)
      | Div -> (v1 /. v2, m2)
      | Exp -> (v1 ** v2, m2)
      | Greater -> (float_of_bool (v1 > v2), m2)
      | Less -> (float_of_bool (v1 < v2), m2)
      | Geq -> (float_of_bool (v1 >= v2), m2)
      | Leq -> (float_of_bool (v1 <= v2), m2)
      | Neq -> (float_of_bool (v1 <> v2), m2)
      | And -> (float_of_bool (v1 <> 0.0 && v2 <> 0.0), m2)
      | Or -> (float_of_bool (v1 <> 0.0|| v2 <> 0.0), m2)
      | Eq -> (float_of_bool (v1 = v2), m2)
    )
  | _ -> raise (Runtime "NotImplementedError: This expression has not yet been implemented!");

(* helper function used to add a list of function arguments to the map of local variables *)
and add_to_map map = function 
  | (Bind(a, t), b) -> 
    let (v1, m1) = eval_expr map b in 
    let m2 = (StringMap.add a (Expr (Lit (FloatLit(v1)))) m1) in m2

(* takes a statement and evaluates it, returning a float and a map, used to evaluate all expressions *)
and eval_stmt map = function 
  | Block(a) -> main map 0.0 a                                     
  | Func(Bind(a, t), b, c) -> let m1 = (StringMap.add a (Func(Bind(a, t), b, c)) map) in (0.0, m1) 
  | Class(a, b) -> raise (Runtime "NotImplementedError: Classes have not yet been implemented!"); 
  | Expr(a) -> let (x, m1) = eval_expr map a in (x, m1)
  | If(a, b, c) -> let (x, m1) = eval_expr map a in if x = 1.0 then eval_stmt m1 b else eval_stmt m1 c
  | For(Bind(a, t), b, c) -> raise (Runtime "NotImplementedError: For loops have not yet been implemented!");
  | While(a, b) -> let rec recurse map = let (x, m1) = eval_expr map a in if x = 1.0 then let (x1, m2) = eval_stmt m1  b in recurse m2 else (0.0, map) in recurse map
  | Return(a) ->  eval_expr map a;       (* expr *)
  | Asn(names, v) -> let (v1, m1) = eval_expr map v in let m2 = List.fold_left (fun m (Var(Bind(name, _))) -> StringMap.add name (Expr(Lit(FloatLit(v1)))) m) m1 names in (v1, m2)
  | Type(_) -> (0.0, map)
  | Print(_) -> (0.0, map)
  | Nop -> (0.0, map)

(* takes a stmt list, iterates through the list and evaluates it in order *)
and main map value = function 
  | [] -> (value, map)
  | a :: t -> let (v1, m1) = eval_stmt map a in main m1 v1 t *)