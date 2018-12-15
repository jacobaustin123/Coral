open Ast
open Sast

(* converts stmt to string for error handling *)
let stmt_to_string = function
  | Func(_, _, _) -> "func"
  | Block(_) -> "block"
  | Expr(_) -> "expr"
  | If(_, _, _) -> "if"
  | For(_, _, _) -> "for"
  | While(_, _) -> "while"
  | Return(_) -> "return"
  | Class(_, _) -> "class"
  | Asn(_, _) -> "asn"
  | Type(_) -> "type"
  | Print(_) -> "print"
  | Nop -> "nop"

(* converts expr to string for error handling *)
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

(* converts type to string for error handling *)
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

(* converts unop to string for error handling *)
let unop_to_string = function
  | Neg -> "-"
  | Not -> "not"

(* converts binop to string for error handling *)
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

(* converts type to corresponding array type for array handling *)
let type_to_array = function
  | Int -> IntArr
  | Bool -> BoolArr
  | String -> StringArr
  | Float -> FloatArr
  | _ as x -> x

let array_to_type = function
  | IntArr -> Int
  | BoolArr -> Bool
  | FloatArr -> Float
  | StringArr -> String
  | _ as x -> x

(* checks if a given type is an array type *)
let is_arr = function
  | StringArr | BoolArr | IntArr | FloatArr -> true
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

(* compares the TypeMap (string, typ list) objects used as map keys *)

(* merge function used to compare and combine two maps for type inference. handles scoping and undefined objects *)

let compare_types a b = if a = b then a else Dyn
let compare_decl a b = if a = b then a else false
let compare_data a b = if a = b then a else None

module TypeMap = Map.Make(struct type t = stmt * typ list let compare = Pervasives.compare end);;

(* map with string keys, used for variable lookup *)

module StringMap = Map.Make(String)

let merge m1 m2 = StringMap.merge (fun key v1 v2 -> match v1, v2 with (* merge two lists while keeping type inference intact *)
    | Some (a, b, c), Some (d, e, f) -> Some (compare_types a d, compare_types b e, compare_data c f)
    | Some (a, b, c), None -> Some(Dyn, Dyn, c)
    | None, Some(a, b, c) -> Some(Dyn, Dyn, c)
    | None, None -> None
  ) m1 m2

(* check if two maps are equal *)

let equals m1 m2 = (StringMap.equal (fun x y -> (compare x y) = 0) m1 m2) (* check if two maps are equal *)

(* map with list keys, used for recursive functions *)

