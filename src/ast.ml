type operator = Add | Sub | Mul | Div | Exp | Eq | Neq | Less | Leq | Greater | Geq | And | Or

type uop = Neg | Not

type literal =
  | IntLit of int
  | BoolLit of bool
  | FloatLit of float
  | StringLit of string

type typ = Int | Float | Bool | String | Dyn | IntArr | FloatArr | BoolArr | StringArr | FuncType | Null

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
  | ListAccess of expr * expr

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
  | Nop

let rec string_of_op = function
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

let rec string_of_uop = function
  | Neg -> "-"
  | Not -> "not"

let rec string_of_lit = function
  | IntLit(i) -> string_of_int i
  | BoolLit(b) -> string_of_bool b
  | FloatLit(f) -> string_of_float f
  | StringLit(s) -> s

let rec string_of_typ = function
  | Int -> "int"
  | Float -> "float"
  | Bool -> "bool"
  | String -> "str"
  | Dyn -> "dyn"
  | IntArr -> "int[]"
  | FloatArr -> "float[]"
  | BoolArr -> "bool[]"
  | StringArr -> "str[]"
  | FuncType -> "funct"
  | Null -> "null"

let rec string_of_bind = function
    | Bind(s, t) -> s ^ ": " ^ string_of_typ t

let rec string_of_expr = function
  | Binop(e1, o, e2) -> string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Lit(l) -> string_of_lit l
  | Var(b) -> string_of_bind b
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | Call(f, el) -> f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Method(obj, m, el) -> string_of_expr obj ^ "." ^ m ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Field(obj, s) -> string_of_expr obj ^ "." ^ s
  | List(el) -> String.concat ", " (List.map string_of_expr el)

let rec string_of_stmt = function
  | Func(b, bl, s) -> "def " ^ string_of_bind b ^ "(" ^ String.concat ", " (List.map string_of_bind bl) ^ ")\n" ^ string_of_stmt s
  | Block(sl) -> String.concat "\n" (List.map string_of_stmt sl) ^ "\n"
  | Expr(e) -> string_of_expr e
  | If(e, s1, s2) ->  "if " ^ string_of_expr e ^ ":\n" ^ string_of_stmt s1 ^ "else:\n" ^ string_of_stmt s2
  | For(b, e, s) -> "for " ^ string_of_bind b ^ " in " ^ string_of_expr e ^ ":\n" ^ string_of_stmt s
  | While(e, s) -> "while " ^ string_of_expr e ^ ":\n" ^ string_of_stmt s
  | Return(e) -> "return " ^ string_of_expr e ^ "\n"
  | Class(str, s) -> "class " ^ str ^ ":\n" ^ string_of_stmt s
  | Asn(bl, e) -> String.concat ", " (List.map string_of_bind bl) ^ " = "  ^ string_of_expr e
  | TypeInfo(e) -> string_of_expr e
  | Nop -> ""

and string_of_program l = String.concat "" (List.map string_of_stmt l) ^ "\n\n"

