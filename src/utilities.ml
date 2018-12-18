open Ast
open Sast

(* Runtime: exception type used for the interpreter *)
exception Runtime of string

(* float_of_bool: converts floats to bools, so we can hack in support for if statements. 1.0 is true, etc. *)
let float_of_bool b = if b then 1.0 else 0.0 

(* zip: combine two lists, used to match the argument names and their values *)
let rec zip lst1 lst2 = match lst1,lst2 with 
  | [], [] -> []
  | [],_::_-> raise (Runtime "TypeError: invalid arguments passed to function!")
  | _::_, []-> raise (Runtime "TypeError: invalid arguments passed to function!")
  | (x::xs),(y::ys) -> (x, y) :: (zip xs ys)

(* explode: converts a string to a list of chars *)
let explode s = 
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
  exp (String.length s - 1) []
;;

(* implode: does the reverse of explode, i.e. converts a list of chars to a string *)
let implode s = String.concat "" (List.map (String.make 1) s) 

(* print: utility function used for printing parsed tokens. can be replaced by menhir mostly. not exhaustive *)
let print = function 
  | Parser.COLON -> "COLON"
  | Parser.TAB -> "TAB"
  | Parser.NOT -> "NOT"
  | Parser.IF -> "IF"
  | Parser.ELSE -> "ELSE"
  | Parser.FOR -> "FOR"
  | Parser.WHILE -> "WHILE"
  | Parser.DEF -> "DEF"
  | Parser.COMMA -> "COMMA"
  | Parser.NEQ -> "NEQ"
  | Parser.LT -> "LT"
  | Parser.GT -> "GT"
  | Parser.LEQ -> "LEQ"
  | Parser.GEQ -> "GEQ"
  | Parser.AND -> "AND"
  | Parser.OR -> "OR"
  | Parser.IN -> "IN"
  | Parser.TRUE -> "TRUE"
  | Parser.FALSE -> "FALSE"
  | Parser.IS -> "IS"
  | Parser.PLUS -> "PLUS"
  | Parser.MINUS -> "MINUS"
  | Parser.TIMES -> "TIMES"
  | Parser.DIVIDE -> "DIVIDE"
  | Parser.EXP -> "EXP"
  | Parser.RETURN -> "RETURN"
  | Parser.LPAREN -> "LPAREN"
  | Parser.RPAREN -> "RPAREN"
  | Parser.LBRACK -> "LBRACK"
  | Parser.RBRACK -> "RBRACK"
  | Parser.EQ -> "EQ"
  | Parser.ASN -> "ASN"
  | Parser.CLASS -> "CLASS"
  | Parser.SEP -> "SEP"
  | Parser.EOF -> "EOF"
  | Parser.EOL -> "EOL"
  | Parser.DOT -> "DOT"
  | Parser.INDENT -> "INDENT"
  | Parser.DEDENT -> "DEDENT"
  | Parser.VARIABLE(_) -> "VARIABLE" (*Printf.sprintf "Var(%s)" x *)
  | Parser.STRING_LITERAL(x) -> Printf.sprintf "STRING_LITERAL(%s)" x
  | Parser.FLOAT_LITERAL(_) -> "FLOAT_LITERAL" (*Printf.sprintf "Lit(%f)" x *)
  | Parser.BOOL_LITERAL(_) -> "BOOL_ITERAL" (*Printf.sprintf "Lit(%f)" x *)
  | Parser.INT_LITERAL(_) -> "INT_LITERAL" (*Printf.sprintf "Lit(%f)" x *)
  | Parser.INT -> "INT"
  | Parser.BOOL -> "BOOL"
  | Parser.FLOAT -> "FLOAT"
  | Parser.STRING -> "STRING"
  | Parser.INTARR -> "INTARR"
  | Parser.FLOATARR -> "FLOATARR"
  | Parser.STRINGARR -> "STRINGARR"
  | Parser.BOOLARR -> "BOOLARR"
  | Parser.NOP -> "NOP"
  | Parser.TYPE -> "TYPE"
  | Parser.PLUSEQ -> "PLUSEQ"
  | Parser.MINUSEQ -> "MINUSEQ"
  | Parser.TIMESEQ -> "TIMESEQ"
  | Parser.DIVIDEEQ -> "DIVIDEEQ"
  | Parser.EXPEQ -> "EXPEQ"
  | Parser.PRINT -> "PRINT"
  | Parser.IMPORT -> "IMPORT"
  | Parser.RANGE -> "RANGE"
  | _ -> "Token not supported by print utility"
;;

(* stmt_to_string converts stmt to string for error handling *)
let stmt_to_string = function
  | Func(_, _, _) -> "func"
  | Block(_) -> "block"
  | Expr(_) -> "expr"
  | If(_, _, _) -> "if"
  | For(_, _, _) -> "for"
  | Range(_, _, _) -> "range"
  | While(_, _) -> "while"
  | Return(_) -> "return"
  | Class(_, _) -> "class"
  | Asn(_, _) -> "asn"
  | Type(_) -> "type"
  | Print(_) -> "print"
  | Import(_) -> "import"
  | Nop -> "nop"

(* expr_to_string: converts expr to string for error handling *)
let expr_to_string = function
  | Binop(_, _, _) -> "binop"
  | Lit(_) -> "lit"
  | Var(_) -> "var"
  | Unop(_, _) -> "unop"
  | Call(_, _) -> "call"
  | Method(_, _, _) -> "method"
  | Field(_, _) -> "field"
  | List(_) -> "list"
  | ListAccess(_, _) -> "list access"
  | ListSlice(_, _, _) -> "list slice"

(* type_to_string converts type to string for error handling *)
let type_to_string = function
  | Dyn -> "dyn"
  | Int -> "int"
  | Float -> "float"
  | Bool -> "bool"
  | String -> "string"
  | IntArr -> "int list"
  | FloatArr -> "float list"
  | BoolArr -> "bool list"
  | StringArr -> "string list"
  | FuncType -> "func"
  | Null -> "null"

(* unop_to_string: converts unop to string for error handling *)
let unop_to_string = function
  | Neg -> "-"
  | Not -> "not"

(* binop_to_string converts binop to string for error handling *)
let binop_to_string = function
  | Add -> "+"
  | Sub -> "-"
  | Mul -> "*"
  | Div -> "/"
  | Exp -> "**"
  | Eq -> "=="
  | Neq -> "!="
  | Less -> "<"
  | Leq -> "<="
  | Greater -> ">"
  | Geq -> ">="
  | And -> "and"
  | Or -> "or"
  | ListAccess -> "at index"

(* type_to_array converts type to corresponding array type for array handling *)
let type_to_array = function
  | Int -> IntArr
  | Bool -> BoolArr
  | String -> StringArr
  | Float -> FloatArr
  | _ as x -> x

(* array_to_type converts array types to their corresponding non-array types *)
let array_to_type = function
  | IntArr -> Int
  | BoolArr -> Bool
  | FloatArr -> Float
  | StringArr -> String
  | _ as x -> x

(* is_arr checks if a given type is an array type. Strings are currently treated as arrays *)
let is_arr = function
  | StringArr | BoolArr | IntArr | FloatArr -> true
  | String -> true
  | _ -> false

(* splits a list of sbinds into a list of strings and a list of types, uses for TypeMap/recursion *)
let split_sbind x = 
  let rec aux a1 a2 = function
    | [] -> (List.rev a1, List.rev a2)
    | a :: t -> match a with
      | Bind(c, d) -> aux (c :: a1) (d :: a2) t
      | _ -> raise (Failure "unknown failure in argument matching")
  in aux [] [] x
;;

(* compare two lists for use in maps with list keys *)
let comp x y =  match List.length x, List.length y with
  | a, b when a < b -> -1
  | a, b when a > b -> 1
  | a, b when a = b -> let rec aux = function
    | [], [] -> 0
    | x :: t, y :: q when x = y -> aux (t, q)
    | x :: t, y :: q when x <> y -> compare x y
    | _ -> raise (Failure "unknown failure in argument matching")
  in aux (x, y)
  | _ -> raise (Failure "unknown failure in argument matching")
;;

(* merge function used to compare and combine two maps for type inference. handles scoping and undefined objects *)
let compare_types a b = if a = b then a else Dyn
let compare_decl a b = if a = b then a else false
let compare_data a b = if a = b then a else None

(* map with SFunc and argument type list used to check recursive calls *)
module TypeMap = Map.Make(struct type t = stmt * typ list let compare = Pervasives.compare end);;

(* map with string keys, used for variable lookup *)
module StringMap = Map.Make(String)

(* merge: merge function used to reconcile the global lookup map after a conditional branch. *)
let merge m1 m2 = StringMap.merge (fun key v1 v2 -> match v1, v2 with (* merge two lists while keeping type inference intact *)
    | Some (a, b, c), Some (d, e, f) -> Some (compare_types a d, compare_types b e, compare_data c f)
    | Some (a, b, c), None -> Some(Dyn, Dyn, c)
    | None, Some(a, b, c) -> Some(Dyn, Dyn, c)
    | None, None -> None
  ) m1 m2

let rec1 = ref [] (* these are used to extract Transform objects for use in codegen from merge *)
let rec2 = ref []

let binds = ref []

(* transform: merge function used to reconcile the global lookup map after a conditional branch.
extracts objects with transformed type for use in codegen. *)

let transform m1 m2 = rec1 := []; rec2 := []; binds := []; StringMap.merge (fun key v1 v2 -> match v1, v2 with (* merge two lists while keeping type inference intact *)
    | Some (a, b, c), Some (d, e, f) -> 
        let t = compare_types b e in
        let () = if b <> t then (rec1 := ((STransform(key, b, Dyn) :: !rec1)); binds := ((Bind(key, Dyn) :: !binds))) in
        let () = if e <> t then (rec2 := ((STransform(key, e, Dyn)) :: !rec2); binds := ((Bind(key, Dyn) :: !binds))) in
        Some (compare_types a d, compare_types b e, compare_data c f)

    | Some (a, b, c), None -> let () = if b <> Dyn then (rec1 := (STransform(key, b, Dyn) :: !rec1); binds := (Bind(key, Dyn) :: !binds)) in Some(Dyn, Dyn, c)
    | None, Some(a, b, c) -> let () = if b <> Dyn then (rec2 := (STransform(key, b, Dyn) :: !rec2); binds := (Bind(key, Dyn) :: !binds)) in Some(Dyn, Dyn, c)
    | None, None -> None
  ) m1 m2

(* from_block: used to extract the slist from an SBlock in codegen *)
let from_block block = match block with
  | Block(x) -> x
  | _ -> raise (Failure ("SCriticalFailure: unexpected type encountered internally in branch evaluation"))

(* from_sblock: used to extract the slist from an SBlock in codegen *)
let from_sblock block = match block with
  | SBlock(x) -> x
  | _ -> raise (Failure ("SCriticalFailure: unexpected type encountered internally in branch evaluation"))


(* check if two maps are equal *)
let equals m1 m2 = (StringMap.equal (fun x y -> (compare x y) = 0) m1 m2) (* check if two maps are equal *)

