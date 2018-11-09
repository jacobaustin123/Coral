open Ast

(* for each variable, StringMap should store typ, inferred typ, bool *)

(*

  1. undeclared identifiers (get a list of globals and locals for each function, check to make sure they are all declared at some poiont
  2. correct number of arguments in function call
  3. correct types of explicitly declared variables
  4. return types in the right place
  5. duplicate formal arguments

To do:
  1. might be time to convert to/add a file-based compiler. Currently Python does exactly the same thing as the interpreter, looking line by line. So extracting all the locals doesn't work. 
  2. 
*)

type sbind = 
  | WeakBind of string * typ (* Not known to be declared, typ can be dynamic *) 
  | StrongBind of string * typ (* Known to be declared, typ can be dynamic *)

type sexpr =
  | SBinop of sexpr * operator * sexpr
  | SLit of literal
  | SVar of sbind
  | SUnop of uop * sexpr
  | SCall of sbind * sexpr list * sstmt (* sstmt is type-checked version of function *)
  | SMethod of sexpr * string * sexpr list
  | SField of sexpr * string
  | SList of sexpr list * typ
  | SNoexpr 

and sstmt = (* this can be refactored using Blocks, but I haven't quite figured it out yet *)
  | SFunc of sbind * sbind list * sstmt
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

