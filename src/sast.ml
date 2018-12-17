open Ast

(*

What semant does:

  1. undeclared identifiers (get a list of globals and locals for each function, check to make sure they are all declared at some poiont
  2. correct number of arguments in function call
  3. correct types of explicitly declared variables
  4. return types in the right place
  5. duplicate formal arguments
*)

type sprogram = sstmt list * bind list

and sfunc_decl = {
  styp : typ;
  sfname : string;
  sformals : bind list;
  slocals : bind list;
  sbody : sstmt
}

and sexp =
  | SBinop of sexpr * operator * sexpr (* (left sexpr, op, right sexpr) *)
  | SLit of literal (* literal *)
  | SVar of string (* see above *)
  | SUnop of uop * sexpr (* (uop, sexpr ) *)
  | SCall of sexpr * sexpr list * sstmt (* SVar or SCall, list of args, SFunc) *)
  | SMethod of sexpr * string * sexpr list (* not implemented *)
  | SField of sexpr * string (* not implemented *)
  | SList of sexpr list * typ (* (list of expressions, inferred type) *)
  | SNoexpr (* no expression *)
  | SListAccess of sexpr * sexpr (* not implemented *)
  | SListSlice of sexpr * sexpr * sexpr (* not implemented *)

and sexpr = sexp * typ

and sstmt = (* this can be refactored using Blocks, but I haven't quite figured it out yet *)
  | SFunc of sfunc_decl (* (name, return type), list of formals, list of locals, body) *)
  | SBlock of sstmt list (* block found in function body or for/else/if/while loop *)
  | SExpr of sexpr (* see above *)
  | SIf of sexpr * sstmt * sstmt (* condition, if, else *)
  | SFor of bind * sexpr * sstmt (* (variable, list, body (block)) *)
  | SWhile of sexpr * sstmt (* (condition, body (block)) *)
  | SReturn of sexpr (* return statement *)
  | SClass of bind * sstmt (* not implemented *)
  | SAsn of bind list * sexpr (* x : int = sexpr, (Bind(x, int), sexpr) *)
  | SPrint of sexpr
  | STransform of string * typ * typ 
  | SNop

let concat_end delim = List.fold_left (fun a c -> a ^ delim ^ c) ""
let append_list v = List.map (fun c -> c ^ v)

let rec string_of_sexpr (e, t) = "(" ^ string_of_sexp e ^ ": " ^ string_of_typ t ^ ")"

and string_of_sbind = function
  | Bind(s, t) when t = Dyn -> s
  | Bind(s, t) -> s ^ ": " ^ string_of_typ t

and string_of_sexp = function
  | SBinop(e1, o, e2) -> string_of_sexpr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_sexpr e2
  | SLit(l) -> string_of_lit l
  | SVar(str) -> str
  | SUnop(o, e) -> string_of_uop o ^ string_of_sexpr e
  | SCall(e, el, s) -> string_of_sexpr e ^ "(" ^ String.concat ", " (List.map string_of_sexpr el) ^ "):\n" ^ string_of_sstmt 0 s
  | SMethod(obj, m, el) -> string_of_sexpr obj ^ "." ^ m ^ "(" ^ String.concat ", " (List.map string_of_sexpr el) ^ ")"
  | SField(obj, s) -> string_of_sexpr obj ^ "." ^ s
  | SList(el, t) -> string_of_typ t ^ " list : " ^ String.concat ", " (List.map string_of_sexpr el)
  | SListAccess(e1, e2) -> string_of_sexpr e1 ^ "[" ^ string_of_sexpr e2 ^ "]"
  | SListSlice(e1, e2, e3) -> string_of_sexpr e1 ^ "[" ^ string_of_sexpr e2 ^ ":" ^ string_of_sexpr e3 ^ "]"
  | SNoexpr -> ""

and string_of_sstmt depth = function
  | SFunc({ styp; sfname; sformals; slocals; sbody }) -> "def " ^ sfname ^ "(" ^ String.concat ", " (List.map string_of_sbind sformals) ^ ") -> " ^ (string_of_typ styp) ^ ": [" ^ String.concat ", " (List.map string_of_sbind slocals) ^ "]\n" ^ string_of_sstmt depth sbody
  | SBlock(sl) -> concat_end (String.make (2 * depth) ' ') (append_list "\n" (List.map (string_of_sstmt (depth + 1)) sl))
  | SExpr(e) -> string_of_sexpr e
  | SIf(e, s1, s2) ->  "if " ^ string_of_sexpr e ^ ":\n" ^ string_of_sstmt depth s1 ^ (String.make (2 * (depth - 1)) ' ') ^ "else:\n" ^ string_of_sstmt depth s2
  | SFor(b, e, s) -> "for " ^ string_of_sbind b ^ " in " ^ string_of_sexpr e ^ ":\n" ^ string_of_sstmt depth s
  | SWhile(e, s) -> "while " ^ string_of_sexpr e ^ ":\n" ^ string_of_sstmt depth s
  | SReturn(e) -> "return " ^ string_of_sexpr e
  | SClass(b, s) -> "class " ^ string_of_sbind b ^ ":\n" ^ string_of_sstmt depth s
  | SAsn(bl, e) -> String.concat ", " (List.map string_of_sbind bl) ^ " = "  ^ string_of_sexpr e
  | SPrint(e) -> "print (" ^ string_of_sexpr e ^ ")"
  | STransform(s, t1, t2) -> "transform " ^ s ^ ": " ^ string_of_typ t1 ^ " -> " ^ string_of_typ t2
  | SNop -> ""

and string_of_sprogram (sl, bl) = String.concat "\n" (List.map (string_of_sstmt 1) sl) ^ "\n\nGlobals: [" ^ String.concat " " (List.map string_of_sbind bl) ^ "]"

type flag = {
  noeval : bool;
  cond : bool;
  forloop : bool;
}
