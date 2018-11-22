type operator = Add | Sub | Mul | Div | Exp | Eq | Neq | Less | Leq | Greater | Geq | And | Or

type uop = Neg | Not

type literal = 
  | IntLit of int
  | BoolLit of bool
  | FloatLit of float
  | StringLit of string

type typ = | Int | Float | Bool | String | Dyn | IntArr | FloatArr | BoolArr | StringArr | FuncType | Null

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

type stmt =
  | Func of bind * bind list * stmt
  | Block of stmt list
  | Expr of expr
  | If of expr * stmt * stmt
  | For of bind * expr * stmt
  | While of expr * stmt
  | Return of expr
  | Class of string * stmt
  | Asn of bind list * expr
  | TypeInfo of expr
  | Print of expr
  | Nop