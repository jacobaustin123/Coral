type literal = 
  | Int of int
  | Bool of bool
  | Float of float
  | String of string

type typ = | Int | Float | Bool | String | Dyn | IntArr | FloatArr | BoolArr | StringArr

type bind = Bind of string * typ

type sexpr =
  | SBinop of expr * operator * expr
  | SLit of literal
  | SVar of bind
  | SUnop of uop * expr
  | SCall of string * expr list
  | SMethod of expr * string * expr list
  | SField of expr * string
  | SList of expr list

type sstmt = (* this can be refactored using Blocks, but I haven't quite figured it out yet *)
  | SFunc of sfunc_decl
  | SBlock of stmt list 
  | SExpr of expr
  | SIf of expr * stmt list * stmt list
  | SFor of bind * expr * stmt list
  | SWhile of expr * stmt list
  | SReturn of expr
  | SClass of string * stmt list
  | SAsn of bind * expr
  | SMultAsn of bind list * expr

type sfunc_decl = {
    styp : typ;
    sfname : string;
    sformals : bind list;
    slocals : bind list;
    sbody : sstmt list;
  }

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