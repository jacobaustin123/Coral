type operator = Add | Sub | Mul | Div | Exp | If | Eq | Neq | Less | Leq | Greater | Geq | And | Or

type uop = Neg | Not

type literal = 
  | Int of int
  | Bool of bool
  | Float of float
  | String of string

type expr =
  | Binop of expr * operator * expr
  | Lit of literal
  | Asn of string * expr
  | Var of string
  | Unop of uop * expr
  | Call of string * expr list
  | List of expr list

type stmt = (* this can be refactored using Blocks, but I haven't quite figured it out yet *)
  | Func of string * string list * stmt list
  | Block of stmt list 
  | Expr of expr
  | If of expr * stmt list * stmt list
  | For of string * expr * stmt list
  | While of expr * stmt list
  | Return of expr
  | Class of string * stmt list