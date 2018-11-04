type operator = Add | Sub | Mul | Div | Exp | If | Eq | Neq | Less | Leq | Greater | Geq | And | Or

type uop = Neg | Not

type literal = 
  | Int of int
  | Bool of bool
  | Float of float
  | String of string

type typ = | Int | Float | Bool | String | Dyn | IntArr | FloatArr | BoolArr | StringArr

type bind = Bind of string * typ

type expr =
  | Binop of expr * operator * expr
  | Lit of literal
  | Var of bind
  | Unop of uop * expr
  | Call of string * expr list
  | Method of expr * string * expr list
  | Field of expr * string
  | List of expr list

type stmt = (* this can be refactored using Blocks, but I haven't quite figured it out yet *)
  | Func of bind * bind list * stmt list
  | Block of stmt list 
  | Expr of expr
  | If of expr * stmt list * stmt list
  | For of bind * expr * stmt list
  | While of expr * stmt list
  | Return of expr
  | Class of string * stmt list
  | Asn of bind * expr
  | MultAsn of bind list * expr