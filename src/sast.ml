open Ast

(*

What semant does:

  1. undeclared identifiers (get a list of globals and locals for each function, check to make sure they are all declared at some poiont
  2. correct number of arguments in function call
  3. correct types of explicitly declared variables
  4. return types in the right place
  5. duplicate formal arguments
*)

type sprogram = sstmt list * sbind list

and sbind =
  | WeakBind of string * typ (* Not known to be declared, typ can be dynamic *)
  | StrongBind of string * typ (* Known to be declared, typ can be dynamic *)

and sexpr =
  | SBinop of sexpr * operator * sexpr
  | SLit of literal
  | SVar of sbind
  | SUnop of uop * sexpr
  | SCall of sbind * sexpr list * sstmt (* sstmt is type-checked version of function (SFunc for the types passed to that call) *)
  | SMethod of sexpr * string * sexpr list
  | SField of sexpr * string
  | SList of sexpr list * typ
  | SNoexpr 

and sstmt = (* this can be refactored using Blocks, but I haven't quite figured it out yet *)
  | SFunc of sbind * sbind list * sbind list * sstmt (* string list is list of locals *)
  | SFuncDecl of bind * bind list * stmt
  | SBlock of sstmt list 
  | SExpr of sexpr
  | SIf of sexpr * sstmt * sstmt
  | SFor of sbind * sexpr * sstmt
  | SWhile of sexpr * sstmt
  | SReturn of sexpr
  | SClass of sbind * sstmt
  | SAsn of sbind list * sexpr
  | SNop

let rec string_of_sbind = function
  | WeakBind(s, t) -> s ^ ": (weak) " ^ string_of_typ t
  | StrongBind(s, t) -> s ^ ": (strong) " ^ string_of_typ t

and string_of_sexpr = function
  | SBinop(e1, o, e2) -> string_of_sexpr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_sexpr e2
  | SLit(l) -> string_of_lit l
  | SVar(b) -> string_of_sbind b
  | SUnop(o, e) -> string_of_uop o ^ string_of_sexpr e
  | SCall(f, el, s) -> string_of_sbind f ^ "(" ^ String.concat ", " (List.map string_of_sexpr el) ^ "):\n" ^ string_of_sstmt s
  | SMethod(obj, m, el) -> string_of_sexpr obj ^ "." ^ m ^ "(" ^ String.concat ", " (List.map string_of_sexpr el) ^ ")"
  | SField(obj, s) -> string_of_sexpr obj ^ "." ^ s
  | SList(el, t) -> string_of_typ t ^ " list : " ^ String.concat ", " (List.map string_of_sexpr el)
  | SNoexpr -> ""

and string_of_sstmt = function
  | SFunc(b, bl1, bl2, s) -> "def " ^ string_of_sbind b ^ "(" ^ String.concat ", " (List.map string_of_sbind bl1) ^ ")\n" ^ string_of_sstmt s
  | SBlock(sl) -> String.concat "\n" (List.map string_of_sstmt sl) ^ "\n"
  | SExpr(e) -> string_of_sexpr e
  | SIf(e, s1, s2) ->  "if " ^ string_of_sexpr e ^ ":\n" ^ string_of_sstmt s1 ^ "else:\n" ^ string_of_sstmt s2
  | SFor(b, e, s) -> "for" ^ string_of_sbind b ^ " in " ^ string_of_sexpr e ^ ":\n" ^ string_of_sstmt s
  | SWhile(e, s) -> "while " ^ string_of_sexpr e ^ ":\n" ^ string_of_sstmt s
  | SReturn(e) -> "return " ^ string_of_sexpr e ^ "\n"
  | SClass(b, s) -> "class " ^ ((function | StrongBind(s, t) -> s | WeakBind(s, t) -> s) b ^ ":\n" ^ string_of_sstmt s)
  | SAsn(bl, e) -> String.concat ", " (List.map string_of_sbind bl) ^ " = "  ^ string_of_sexpr e
  | SFuncDecl(b, bl, s) -> "def " ^ string_of_bind b ^ "(" ^ String.concat ", " (List.map string_of_bind bl) ^ ")\n" ^ string_of_stmt s
  | SNop -> ""

and string_of_sprogram (sl, bl) = String.concat "" (List.map string_of_sstmt sl) ^ "\n\n" ^ String.concat "" (List.map string_of_sbind bl)