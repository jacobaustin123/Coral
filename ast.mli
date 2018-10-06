type operator = Add | Sub | Mul | Div | Exp | If | Eq | Neq | Less | Leq | Greater | Geq | And | Or

type uop = Neg | Not

type expr =
  | Binop of expr * operator * expr
  | Lit of float
  | Asn of string * expr
  | Var of string
  | Unop of uop * expr
  | Call of string * expr list

type stmt = 
  | Func of string * string list * stmt list
  | Block of stmt list 
  | Expr of expr
  | If of expr * stmt * stmt
  | For of string * expr * stmt
  | While of expr * stmt 
  | Return of expr
