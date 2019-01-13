open Ast
open Sast

(* Runtime: exception type used for the interpreter. KeyboardInterrupt: used to handle ctrl-c *)
exception Runtime of string
exception KeyboardInterrupt

let debug str = (* Printf.eprintf "%s\n" str; *) ()

(* float_of_bool: converts floats to bools, so we can hack in support for if statements. 1.0 is true, etc. *)
let float_of_bool b = if b then 1.0 else 0.0 

(* zip: combine two lists, used to match the argument names and their values *)
let rec zip lst1 lst2 = match lst1,lst2 with 
  | [], [] -> []
  | [],_::_-> raise (Runtime "TypeError: invalid arguments passed to function!")
  | _::_, []-> raise (Runtime "TypeError: invalid arguments passed to function!")
  | (x::xs),(y::ys) -> (x, y) :: (zip xs ys)

(* explode: converts a string to a list of chars *)
let explode s = 
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
  exp (String.length s - 1) []
;;

(* implode: does the reverse of explode, i.e. converts a list of chars to a string *)
let implode s = String.concat "" (List.map (String.make 1) s) 

(* print: utility function used for printing parsed tokens. can be replaced by menhir mostly. not exhaustive *)
let print = function 
  | Parser.COLON(_) -> "COLON"
  | Parser.TAB(_) -> "TAB"
  | Parser.SPACE(_) -> "SPACE"
  | Parser.NOT(_) -> "NOT"
  | Parser.IF(_) -> "IF"
  | Parser.ELSE(_) -> "ELSE"
  | Parser.FOR(_) -> "FOR"
  | Parser.WHILE(_) -> "WHILE"
  | Parser.DEF(_) -> "DEF"
  | Parser.COMMA(_) -> "COMMA"
  | Parser.NEQ(_) -> "NEQ"
  | Parser.LT(_) -> "LT"
  | Parser.GT(_) -> "GT"
  | Parser.LEQ(_) -> "LEQ"
  | Parser.GEQ(_) -> "GEQ"
  | Parser.AND(_) -> "AND"
  | Parser.OR(_) -> "OR"
  | Parser.IN(_) -> "IN"
  | Parser.TRUE(_) -> "TRUE"
  | Parser.FALSE(_) -> "FALSE"
  | Parser.IS(_) -> "IS"
  | Parser.PLUS(_) -> "PLUS"
  | Parser.MINUS(_) -> "MINUS"
  | Parser.TIMES(_) -> "TIMES"
  | Parser.DIVIDE(_) -> "DIVIDE"
  | Parser.EXP(_) -> "EXP"
  | Parser.RETURN(_) -> "RETURN"
  | Parser.LPAREN(_) -> "LPAREN"
  | Parser.RPAREN(_) -> "RPAREN"
  | Parser.LBRACK(_) -> "LBRACK"
  | Parser.RBRACK(_) -> "RBRACK"
  | Parser.EQ(_) -> "EQ"
  | Parser.ASN(_) -> "ASN"
  | Parser.SEP(_) -> "SEP"
  | Parser.EOF(_) -> "EOF"
  | Parser.EOL(_) -> "EOL"
  | Parser.DOT(_) -> "DOT"
  | Parser.INDENT(_) -> "INDENT"
  | Parser.DEDENT(_) -> "DEDENT"
  | Parser.VARIABLE(_, _) -> "VARIABLE" (*Printf.sprintf "Var(%s)" x *)
  | Parser.STRING_LITERAL(x,_) -> Printf.sprintf "STRING_LITERAL(%s)" x
  | Parser.FLOAT_LITERAL(_,_) -> "FLOAT_LITERAL" (*Printf.sprintf "Lit(%f)" x *)
  | Parser.BOOL_LITERAL(_,_) -> "BOOL_ITERAL" (*Printf.sprintf "Lit(%f)" x *)
  | Parser.INT_LITERAL(_,_) -> "INT_LITERAL" (*Printf.sprintf "Lit(%f)" x *)
  | Parser.INT(_) -> "INT"
  | Parser.BOOL(_) -> "BOOL"
  | Parser.FLOAT(_) -> "FLOAT"
  | Parser.STRING(_) -> "STRING"
  | Parser.ARR(_) -> "ARR"
  | Parser.NOP(_) -> "NOP"
  | Parser.TYPE(_) -> "TYPE"
  | Parser.PLUSEQ(_) -> "PLUSEQ"
  | Parser.MINUSEQ(_) -> "MINUSEQ"
  | Parser.TIMESEQ(_) -> "TIMESEQ"
  | Parser.DIVIDEEQ(_) -> "DIVIDEEQ"
  | Parser.EXPEQ(_) -> "EXPEQ"
  | Parser.PRINT(_) -> "PRINT"
  | Parser.IMPORT(_) -> "IMPORT"
  | Parser.RANGE(_) -> "RANGE"
  | Parser.NOELSE(_) -> "NOELSE"
  | Parser.NEG(_) -> "NEG"
  | Parser.ARROW(_) -> "ARROW"
  | Parser.FUNC(_) -> "FUNC"
  | Parser.NONE(_) -> "NONE"
  | Parser.CEND(_) -> "CEND"
  | Parser.LBRACE(_) -> "LBRACE"
  | Parser.RBRACE(_) -> "RBRACE"

(* stmt_to_string converts stmt to string for error handling *)
let stmt_to_string = function
  | Func(_, _, _) -> "func"
  | Block(_) -> "block"
  | Expr(_) -> "expr"
  | If(_, _, _) -> "if"
  | For(_, _, _) -> "for"
  | Range(_, _, _) -> "range"
  | While(_, _) -> "while"
  | Return(_) -> "return"
  | Asn(_, _) -> "asn"
  | Type(_) -> "type"
  | Print(_) -> "print"
  | Import(_) -> "import"
  | Nop -> "nop"

(* expr_to_string: converts expr to string for error handling *)
let expr_to_string = function
  | Binop(_, _, _) -> "binop"
  | Lit(_) -> "lit"
  | Var(_) -> "var"
  | Unop(_, _) -> "unop"
  | Call(_, _) -> "call"
  | List(_) -> "list"
  | ListAccess(_, _) -> "list access"
  | ListSlice(_, _, _) -> "list slice"

(* type_to_string converts type to string for error handling *)
let type_to_string = function
  | Dyn -> "dyn"
  | Int -> "int"
  | Float -> "float"
  | Bool -> "bool"
  | String -> "string"
  | Arr -> "list"
  | FuncType -> "func"
  | Null -> "null"

(* unop_to_string: converts unop to string for error handling *)
let unop_to_string = function
  | Neg -> "-"
  | Not -> "not"

(* binop_to_string converts binop to string for error handling *)
let binop_to_string = function
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
  | ListAccess -> "[]"

(* is_bind checks if something is a bind *)
let is_var = function
  | Var(_) -> true
  | _ -> false

(* is_arr checks if a given type is an array type. Strings are currently treated as arrays *)
let is_arr = function
  | Arr -> true
  | String -> true
  | _ -> false

(* splits a list of sbinds into a list of strings and a list of types, uses for TypeMap/recursion *)
let split_sbind x = 
  let rec aux a1 a2 = function
    | [] -> (List.rev a1, List.rev a2)
    | a :: t -> match a with
      | Bind(s) -> aux (s.name :: a1) (s.typ :: a2) t
      | _ -> raise (Failure "unknown failure in argument matching")
  in aux [] [] x
;;

(* compare two lists for use in maps with list keys *)
let comp x y =  match List.length x, List.length y with
  | a, b when a < b -> -1
  | a, b when a > b -> 1
  | a, b when a = b -> let rec aux = function
    | [], [] -> 0
    | x :: t, y :: q when x = y -> aux (t, q)
    | x :: t, y :: q when x <> y -> compare x y
    | _ -> raise (Failure "unknown failure in argument matching")
  in aux (x, y)
  | _ -> raise (Failure "unknown failure in argument matching")
;;

(* merge function used to compare and combine two maps for type inference. handles scoping and undefined objects *)
let compare_types a b = if a = b then a else Dyn (* if a = b && a = FuncType then Dyn else *)
let compare_decl a b = if a = b then a else false
let compare_data a b = if a = b then a else None

(* map with SFunc and argument type list used to check recursive calls *)
module TypeMap = Map.Make(struct type t = stmt * typ list let compare = Pervasives.compare end)

(* map with string keys, used for variable lookup *)
module StringMap = Map.Make(String)

let empty_pos = {line_n = 0; char_n = 0;}

let stmt_of_rawstmt t = {value = t; pos = empty_pos; }

let bind_of_rawbind name typ = Bind({name = name; typ = typ; pos = empty_pos; })

let rec1 = ref [] (* these are used to extract Transform objects for use in codegen from merge *)
let rec2 = ref []

let binds = ref []
let possible_globals = ref []

(* transform: merge function used to reconcile the global lookup map after a conditional branch.
extracts objects with transformed type for use in codegen. 

rec1 and rec2 are the STransforms that need to be added to the if and else branch, respectively. 
binds is a list of dynamic binds that need to be added to the list of locals or globals*)

let transform m1 m2 = rec1 := []; rec2 := []; binds := []; 
  let map = StringMap.merge (fun key v1 v2 -> (match v1, v2 with (* merge two lists while keeping type inference intact *)
    | Some (a, b, c), Some (d, e, f) -> 
        let t = compare_types b e in
        let () = if b <> t then (rec1 := (STransform(key, b, Dyn) :: !rec1)); binds := ((bind_of_rawbind key Dyn) :: !binds) in
        let () = if e <> t then (rec2 := (STransform(key, e, Dyn) :: !rec2)); binds := ((bind_of_rawbind key Dyn) :: !binds) in
        Some (compare_types a d, compare_types b e, compare_data c f)

    | Some (a, b, c), None -> let () = if b <> Dyn then (rec1 := (STransform(key, b, Dyn) :: !rec1)); binds := ((bind_of_rawbind key Dyn) :: !binds) in Some(Dyn, Dyn, None)
    | None, Some(a, b, c) -> let () = if b <> Dyn then (rec2 := (STransform(key, b, Dyn) :: !rec2)); binds := ((bind_of_rawbind key Dyn) :: !binds) in Some(Dyn, Dyn, None)
    | None, None -> None
  )) m1 m2 in 
  (map,  SBlock(!rec1), SBlock(!rec2), !binds)

(* from_block: used to extract the slist from an SBlock in codegen *)
let from_block block = match block with
  | Block(x) -> x
  | _ -> raise (Failure ("SCriticalFailure: unexpected type encountered internally in branch evaluation"))

(* from_sblock: used to extract the slist from an SBlock in codegen *)
let from_sblock block = match block with
  | SBlock(x) -> x
  | _ -> raise (Failure ("SCriticalFailure: unexpected type encountered internally in branch evaluation"))


(* check if two maps are equal *)
let equals m1 m2 = (StringMap.equal (fun x y -> (compare x y) = 0) m1 m2) (* check if two maps are equal *)

(* flag passed around semant holding information about the current environment *)
type flag = {
  stack : bool TypeMap.t;
  noeval : bool; (* in a SFunc doing a generic analysis *)
  cond : bool; (* in a conditional branch? *)
  forloop : bool; (* in a for loop? *)
}

(* make a list of binds all dynamic *)
let make_dynamic bindlist = List.map (fun (Bind b) -> Bind {b with typ = Dyn}) bindlist

(* convert a lookup table to a list of binds with the name and inferred type. used to handle
calling weakly defined functions. when this occurs, we don't know what types globals will be,
so we have to assume they are dynamic and convert them to dynamic types *)

let globals_to_list globals = 
  let current = StringMap.bindings globals in
  let bindings = List.map (fun (name, (_, typ, _)) -> Bind({name = name; typ = typ; pos = empty_pos;})) current in
  bindings

let make_transforms globals = 
  possible_globals := (make_dynamic globals) @ !possible_globals;
  let entry = List.map (fun (Bind b) -> STransform(b.name, b.typ, Dyn)) globals in
  let exit = List.map (fun (Bind b) -> STransform(b.name, Dyn, b.typ)) globals in
  SStage(SBlock(entry), SNop, SBlock(exit))