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
  | Parser.COLON -> "COLON"
  | Parser.TAB -> "TAB"
  | Parser.SPACE -> "SPACE"
  | Parser.NOT -> "NOT"
  | Parser.IF -> "IF"
  | Parser.ELSE -> "ELSE"
  | Parser.FOR -> "FOR"
  | Parser.WHILE -> "WHILE"
  | Parser.DEF -> "DEF"
  | Parser.COMMA -> "COMMA"
  | Parser.NEQ -> "NEQ"
  | Parser.LT -> "LT"
  | Parser.GT -> "GT"
  | Parser.LEQ -> "LEQ"
  | Parser.GEQ -> "GEQ"
  | Parser.AND -> "AND"
  | Parser.OR -> "OR"
  | Parser.IN -> "IN"
  | Parser.TRUE -> "TRUE"
  | Parser.FALSE -> "FALSE"
  | Parser.IS -> "IS"
  | Parser.PLUS -> "PLUS"
  | Parser.MINUS -> "MINUS"
  | Parser.TIMES -> "TIMES"
  | Parser.DIVIDE -> "DIVIDE"
  | Parser.EXP -> "EXP"
  | Parser.RETURN -> "RETURN"
  | Parser.LPAREN -> "LPAREN"
  | Parser.RPAREN -> "RPAREN"
  | Parser.LBRACK -> "LBRACK"
  | Parser.RBRACK -> "RBRACK"
  | Parser.EQ -> "EQ"
  | Parser.ASN -> "ASN"
  | Parser.CLASS -> "CLASS"
  | Parser.SEP -> "SEP"
  | Parser.EOF -> "EOF"
  | Parser.EOL -> "EOL"
  | Parser.DOT -> "DOT"
  | Parser.INDENT -> "INDENT"
  | Parser.DEDENT -> "DEDENT"
  | Parser.VARIABLE(_) -> "VARIABLE" (*Printf.sprintf "Var(%s)" x *)
  | Parser.STRING_LITERAL(x) -> Printf.sprintf "STRING_LITERAL(%s)" x
  | Parser.FLOAT_LITERAL(_) -> "FLOAT_LITERAL" (*Printf.sprintf "Lit(%f)" x *)
  | Parser.BOOL_LITERAL(_) -> "BOOL_ITERAL" (*Printf.sprintf "Lit(%f)" x *)
  | Parser.INT_LITERAL(_) -> "INT_LITERAL" (*Printf.sprintf "Lit(%f)" x *)
  | Parser.INT -> "INT"
  | Parser.BOOL -> "BOOL"
  | Parser.FLOAT -> "FLOAT"
  | Parser.STRING -> "STRING"
  | Parser.ARR -> "ARR"
  | Parser.NOP -> "NOP"
  | Parser.TYPE -> "TYPE"
  | Parser.PLUSEQ -> "PLUSEQ"
  | Parser.MINUSEQ -> "MINUSEQ"
  | Parser.TIMESEQ -> "TIMESEQ"
  | Parser.DIVIDEEQ -> "DIVIDEEQ"
  | Parser.EXPEQ -> "EXPEQ"
  | Parser.PRINT -> "PRINT"
  | Parser.IMPORT -> "IMPORT"
  | Parser.RANGE -> "RANGE"
  | Parser.NOELSE -> "NOELSE"
  | Parser.NEG -> "NEG"
  | Parser.ARROW -> "ARROW"
  | Parser.FUNC -> "FUNC"
  | Parser.NONE -> "NONE"
  | Parser.CEND -> "CEND"
  | Parser.LBRACE -> "LBRACE"
  | Parser.RBRACE -> "RBRACE"
  | Parser.PASS -> "PASS"
  | Parser.BREAK -> "BREAK"
  | Parser.CONTINUE -> "CONTINUE"

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
  | Class(_, _) -> "class"
  | Asn(_, _) -> "asn"
  | Type(_) -> "type"
  | Print(_) -> "print"
  | Import(_) -> "import"
  | Nop -> "nop"
  | Break -> "break"
  | Continue -> "continue"

(* expr_to_string: converts expr to string for error handling *)
let expr_to_string = function
  | Binop(_, _, _) -> "binop"
  | Lit(_) -> "lit"
  | Var(_) -> "var"
  | Unop(_, _) -> "unop"
  | Call(_, _) -> "call"
  | Method(_, _, _) -> "method"
  | Field(_, _) -> "field"
  | List(_) -> "list"
  | ListAccess(_, _) -> "list access"
  | ListSlice(_, _, _) -> "list slice"
  | Cast(a, b) -> "cast"

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
  | Object -> "object"

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
      | Bind(c, d) -> aux (c :: a1) (d :: a2) t
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

let print_map m = debug "Printing the current type inference map:\n"; StringMap.iter (fun key value -> let (a, b, c) = value in debug (key ^ " with explicit type: " ^ string_of_typ a ^ " and infered type: " ^ string_of_typ b ^ " and data is None: " ^ string_of_bool (c == None))) m

let rec1 = ref [] (* these are used to extract Transform objects for use in codegen from merge *)
let rec2 = ref []

let binds = ref []
let possible_globals = ref []

(* transform: merge function used to reconcile the global lookup map after a conditional branch.
extracts objects with transformed type for use in codegen. 

rec1 and rec2 are the STransforms that need to be added to the if and else branch, respectively. 
binds is a list of dynamic binds that need to be added to the list of locals or globals*)

let transform m1 m2 = rec1 := []; rec2 := []; binds := []; 
  let map = StringMap.merge (fun key v1 v2 -> match v1, v2 with (* merge two lists while keeping type inference intact *)
    | Some (a, b, c), Some (d, e, f) -> 
        let t = compare_types b e in
        let () = if b <> t then (rec1 := ((STransform(key, b, Dyn) :: !rec1)); binds := ((Bind(key, Dyn) :: !binds))) in
        let () = if e <> t then (rec2 := ((STransform(key, e, Dyn)) :: !rec2); binds := ((Bind(key, Dyn) :: !binds))) in
        Some (compare_types a d, compare_types b e, compare_data c f)

    | Some (a, b, c), None -> let () = if b <> Dyn then (rec1 := (STransform(key, b, Dyn) :: !rec1); binds := (Bind(key, Dyn) :: !binds)) in Some(Dyn, Dyn, None)
    | None, Some(a, b, c) -> let () = if b <> Dyn then (rec2 := (STransform(key, b, Dyn) :: !rec2); binds := (Bind(key, Dyn) :: !binds)) in Some(Dyn, Dyn, None)
    | None, None -> None
  ) m1 m2 in 
  (map, SBlock(!rec1), SBlock(!rec2), !binds)

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
  func : bool;
  inclass : bool;
  locals: (Ast.typ * Ast.typ * Ast.stmt option) StringMap.t;
  globals: (Ast.typ * Ast.typ * Ast.stmt option) StringMap.t;
}

type state_component = 
  | S_func (* enter function and set globals to locals *)
  | S_noeval of (Ast.typ * Ast.typ * Ast.stmt option) StringMap.t (* entering function to generate dynamic function *)
  | S_forloop of (Ast.typ * Ast.typ * Ast.stmt option) StringMap.t (* entering a for loop with new locals map *)
  | S_cond (* entering conditional branch *)
  | S_setmaps of ((Ast.typ * Ast.typ * Ast.stmt option) StringMap.t * (Ast.typ * Ast.typ * Ast.stmt option) StringMap.t) (* just set the locals and globals *)
  | S_class

let change_state the_state = function
  | S_func -> if the_state.func then the_state else { the_state with globals = the_state.locals; }
  | S_noeval(locals) -> { the_state with noeval = true; forloop = false; cond = false; stack = TypeMap.empty; locals = locals; func = true; globals = StringMap.empty; }
  | S_cond -> { the_state with cond = true; }
  | S_forloop(locals) -> {the_state with cond = true; forloop = true; locals = locals; }
  | S_setmaps(locals, globals) -> {the_state with locals = locals; globals = globals; }
  | S_class -> {the_state with inclass = true; }

(* make a list of binds all dynamic *)
let make_dynamic bindlist = List.map (fun (Bind(name, typ)) -> Bind(name, Dyn)) bindlist

(* convert a lookup table to a list of binds with the name and inferred type. used to handle
calling weakly defined functions. when this occurs, we don't know what types globals will be,
so we have to assume they are dynamic and convert them to dynamic types *)

let globals_to_list globals = 
  let current = StringMap.bindings globals in
  let bindings = List.map (fun (name, (_, typ, _)) -> Bind(name, typ)) current in
  bindings

let make_transforms globals = 
  (* List.iter (fun (Bind(name, typ)) -> print_endline (name ^ " " ^ string_of_typ typ)) globals;  *)
  possible_globals := (make_dynamic globals) @ !possible_globals;
  let entry = List.map (fun (Bind(name, typ)) -> STransform(name, typ, Dyn)) globals in
  let exit = List.map (fun (Bind(name, typ)) -> STransform(name, Dyn, typ)) globals in
  (* List.iter (fun (STransform(a, b, c)) -> print_endline ("GLOBALS: " ^ a ^ " " ^ string_of_typ b ^ " " ^ string_of_typ c)) entry; *)
  SStage(SBlock(entry), SNop, SBlock(exit))