
(* The Abstract Syntax Tree (AST) for the Coral Programming Language *)

(* This AST supports many of the features of modern Python, with the exception of 
exceptions, and some built-in data-structures supported by Python. See the SAST
for more detailed explanations of these types.

ListAccess is included as a binary operation for simplicity during code generation. 
Import and Type statements are handled in semant and do not make it to the code 
generation stage *)

type operator = Add | Sub | Mul | Div | Exp | Eq | Neq | Less | Leq | Greater | Geq | And | Or | ListAccess

type uop = Neg | Not

type literal =
  | IntLit of int
  | BoolLit of bool
  | FloatLit of float
  | StringLit of string

type typ = Int | Float | Bool | String | Dyn | Arr | Object | FuncType | Null

type bind = Bind of string * typ

type expr =
  | Binop of expr * operator * expr
  | Lit of literal
  | Var of bind
  | Unop of uop * expr
  | Call of expr * expr list
  | Method of expr * string * expr list
  | Field of expr * string
  | List of expr list
  | ListAccess of expr * expr (* expr, entry *)
  | ListSlice of expr * expr * expr (* expr, left, right *)
  | Cast of typ * expr (* type casting *)

type stmt =
  | Func of bind * bind list * stmt
  | Block of stmt list
  | Expr of expr
  | If of expr * stmt * stmt
  | For of bind * expr * stmt
  | Range of bind * expr * stmt
  | While of expr * stmt
  | Return of expr
  | Class of string * stmt
  | Asn of expr list * expr
  | Type of expr
  | Print of expr
  | Import of string
  | Continue
  | Break
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
  | ListAccess -> "at index"

let rec string_of_uop = function
  | Neg -> "-"
  | Not -> "not"

let rec string_of_lit = function
  | IntLit(i) -> string_of_int i
  | BoolLit(b) -> string_of_bool b
  | FloatLit(f) -> string_of_float f
  | StringLit(s) -> "\"" ^ s ^ "\""

let rec string_of_typ = function
  | Int -> "int"
  | Float -> "float"
  | Bool -> "bool"
  | String -> "std::string"
  | Dyn -> "dyn"
  | Arr -> "std::vector"
  | FuncType -> "func"
  | Object -> "object"
  | Null -> "null"

let rec string_of_bind = function
  | Bind(s, t) -> s ^ ": " ^ string_of_typ t

let rec string_of_expr = function
  | Binop(e1, o, e2) -> string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Lit(l) -> string_of_lit l
  | Var(b) -> string_of_bind b
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | Call(e, el) -> string_of_expr e ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Method(obj, m, el) -> string_of_expr obj ^ "." ^ m ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Field(obj, s) -> string_of_expr obj ^ "." ^ s
  | List(el) -> String.concat ", " (List.map string_of_expr el)
  | ListAccess(e1, e2) -> string_of_expr e1 ^ "[" ^ string_of_expr e2 ^ "]"
  | ListSlice(e1, e2, e3) -> string_of_expr e1 ^ "[" ^ string_of_expr e2 ^ ":" ^ string_of_expr e3 ^ "]"
  | Cast(a, b) -> string_of_typ a ^ "(" ^ string_of_expr b ^ ")"

let rec string_of_stmt = function
  | Func(b, bl, s) -> "def " ^ string_of_bind b ^ "(" ^ String.concat ", " (List.map string_of_bind bl) ^ ")\n" ^ string_of_stmt s
  | Block(sl) -> String.concat "\n" (List.map string_of_stmt sl) ^ "\n"
  | Expr(e) -> string_of_expr e
  | If(e, s1, s2) ->  "if " ^ string_of_expr e ^ ":\n" ^ string_of_stmt s1 ^ "else:\n" ^ string_of_stmt s2
  | For(b, e, s) -> "for " ^ string_of_bind b ^ " in " ^ string_of_expr e ^ ":\n" ^ string_of_stmt s
  | Range(b, e, s) -> "for " ^ string_of_bind b ^ " in range (" ^ string_of_expr e ^ "):\n" ^ string_of_stmt s
  | While(e, s) -> "while " ^ string_of_expr e ^ ":\n" ^ string_of_stmt s
  | Return(e) -> "return " ^ string_of_expr e ^ "\n"
  | Class(str, s) -> "class " ^ str ^ ":\n" ^ string_of_stmt s
  | Asn(el, e) -> String.concat ", " (List.map string_of_expr el) ^ " = "  ^ string_of_expr e
  | Type(e) -> string_of_expr e
  | Print(e) -> string_of_expr e
  | Import(e) -> "import " ^ e
  | Nop -> ""
  | Continue -> "continue"
  | Break -> "break"

and string_of_program l = String.concat "" (List.map string_of_stmt l) ^ "\n\n"

