open Ast

(* type sbind = SBind of string * typ * typ (* name, declared type, inferred type *) *)

type sexpr =
  | SBinop of sexpr * operator * sexpr
  | SLit of literal
  | SVar of bind
  | SUnop of uop * sexpr
  | SCall of string * sexpr list
  | SMethod of sexpr * string * sexpr list
  | SField of sexpr * string
  | SList of sexpr list * typ
  | SNoexpr 

type sstmt = (* this can be refactored using Blocks, but I haven't quite figured it out yet *)
  | SFunc of bind * bind list * sstmt
  | SBlock of sstmt list 
  | SExpr of sexpr
  | SIf of sexpr * sstmt * sstmt
  | SFor of bind * sexpr * sstmt
  | SWhile of sexpr * sstmt
  | SReturn of sexpr
  | SClass of string * sstmt
  | SAsn of bind list * sexpr
  | SNop

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