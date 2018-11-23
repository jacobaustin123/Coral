  open Ast
open Sast
open Getopt (* package used to handle command line arguments *)

module StringMap = Map.Make(String);; (* map from string -> expr *)


(* boolean flag used to handle debug flag from command line *)
let debug = ref 0
;;

(* string containing path to input file *)
let fpath = ref ""
;;

(* boolean flag used to check if program should be run by interpreter *)
let run = ref 0

(* function used to handle command line arguments *)
let specs =
[
  ( 'd', "debug", (incr debug), None);
  ( 'c', "check", None, ((atmost_once fpath (Error "ArgumentError: can only checked one file with -c flag."))));
  ( 'r', "run", (incr run), None);
]
;;

(* converts floats to bools, so we can hack in support for if statements. 1.0 is true, etc. *)
let float_of_bool b = if b then 1.0 else 0.0 
;;

(* combine two lists, used to match the argument names and their values *)
let rec zip lst1 lst2 = match lst1,lst2 with 
  | [], [] -> []
  | [],_::_-> raise (Failure "TypeError: invalid arguments passed to function!")
  | _::_, []-> raise (Failure "TypeError: invalid arguments passed to function!")
  | (x::xs),(y::ys) -> (x, y) :: (zip xs ys)

(* expr -> (float, map), used to evaluate expressions *)
let rec eval_expr map = function 
  | Lit(x) -> (match x with 
     | FloatLit(y) -> (y, map)
     | IntLit(y) -> (float_of_int y, map)
     | BoolLit(y) -> (float_of_bool y, map)
     | StringLit(_) -> raise (Failure "NotImplementedError: Strings have not yet been implemented!");
   )
  | List(x) -> (raise (Failure "NotImplementedError: Lists have not yet been implemented!"); )
  | Var(Bind(x, _)) -> (try let Expr(v) = (StringMap.find x map) in eval_expr map v with Not_found -> Printf.printf "NameError: name '%s' is not defined!\n" x; flush stdout; raise Not_found)
  | Unop(op, v) -> let (v1, m1) = eval_expr map v in
      (match op with
        | Neg -> (-.v1, m1)
        | Not -> if v1 = 0.0 then (1.0, m1) else (0.0, m1))
  | Call(name, args) -> (try let Func(_, a, ex) = StringMap.find name map in 
                            let zipped = zip a args in let m1 = List.fold_left add_to_map map zipped in 
                            let (v2, _) = eval_stmt m1 ex in (v2, map) with 
                            Not_found -> Printf.printf "NameError: name '%s' is not defined!\n" name; flush stdout; raise Not_found) (* raise (Failure "NotImplementedError: Functions have not yet been implemented"); *)
  | Method(_, _, _) -> raise (Failure "NotImplementedError: Methods have not yet been implemented!");
  | Field(_, _) -> raise (Failure "NotImplementedError: Fields have not yet been implemented!");
  | Binop(e1, op, e2) ->

let (v1, m1) = eval_expr map e1 in let (v2, m2) = eval_expr m1 e2 in
match op with
  | Add -> (v1 +. v2, m2)
  | Sub -> (v1 -. v2, m2)
  | Mul -> (v1 *. v2, m2)
  | Div -> (v1 /. v2, m2)
  | Exp -> (v1 ** v2, m2)
  | Greater -> (float_of_bool (v1 > v2), m2)
  | Less -> (float_of_bool (v1 < v2), m2)
  | Geq -> (float_of_bool (v1 >= v2), m2)
  | Leq -> (float_of_bool (v1 <= v2), m2)
  | Neq -> (float_of_bool (v1 <> v2), m2)
  | And -> (float_of_bool (v1 <> 0.0 && v2 <> 0.0), m2)
  | Or -> (float_of_bool (v1 <> 0.0|| v2 <> 0.0), m2)
  | Eq -> (float_of_bool (v1 = v2), m2)

(* helper function used to add a list of function arguments to the map of local variables *)
and add_to_map map = function 
  | (Bind(a, t), b) -> let (v1, m1) = eval_expr map b in let m2 = (StringMap.add a (Expr (Lit (FloatLit(v1)))) m1) in m2

(* takes a statement and evaluates it, returning a float and a map, used to evaluate all expressions *)
and eval_stmt map = function 
  | Block(a) -> main map 0.0 a                                     
  | Func(Bind(a, t), b, c) -> let m1 = (StringMap.add a (Func(Bind(a, t), b, c)) map) in (0.0, m1) (* raise (Failure "NotImplementedError: Functions have not yet been implemented");        *)(*string * string list * stmt list*)                                         (* stmt list *)
  | Class(a, b) -> raise (Failure "NotImplementedError: Classes have not yet been implemented!"); 
  | Expr(a) -> let (x, m1) = eval_expr map a in (x, m1)                                                                              (* expr *)          
  | If(a, b, c) -> let (x, m1) = eval_expr map a in if x = 1.0 then eval_stmt m1 b else eval_stmt m1 c (* raise (Failure "NotImplementedError: If statements have not yet been implemented"); *)     (* expr * stmt * stmt *)
  | For(Bind(a, t), b, c) -> raise (Failure "NotImplementedError: For loops have not yet been implemented!");        (* string * expr * expr *)
  | While(a, b) -> let rec recurse map = let (x, m1) = eval_expr map a in if x = 1.0 then let (x1, m2) = eval_stmt m1  b in recurse m2 else (0.0, map) in recurse map                                          (*raise (Failure "NotImplementedError: While loops have not yet been implemented"); *)      (* expr * stmt *)
  | Return(a) ->  eval_expr map a;       (* expr *)
  | Asn(names, v) -> let (v1, m1) = eval_expr map v in let m2 = List.fold_left (fun m (Bind(name, _)) -> StringMap.add name (Expr(Lit(FloatLit(v1)))) m) m1 names in (v1, m2)
  | TypeInfo(_) -> (0.0, map)
  | Nop -> (0.0, map)
(* takes a stmt list, iterates through the list and evaluates it in order *)
and main map value = function 
  | [] -> (value, map)
  | a :: t -> let (v1, m1) = eval_stmt map a in main m1 v1 t
;;

(* converts a string to a list of chars *)
let explode s = 
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
  exp (String.length s - 1) []
;;

(* does the reverse, i.e. converts a list of chars to a string *)
let impode s = String.concat "" (List.map (String.make 1) s) 

(* utility function used for printing parsed tokens. can be replaced by menhir mostly. not exhaustive *)
let print = function 
  | Parser.COLON -> "COLON"
  | Parser.TAB -> "TAB"
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
  | Parser.INTARR -> "INTARR"
  | Parser.FLOATARR -> "FLOATARR"
  | Parser.STRINGARR -> "STRINGARR"
  | Parser.BOOLARR -> "BOOLARR"
  | Parser.NOP -> "NOP"
  | _ -> "I'm too lazy"
;;

(* used to hackily fix a big where multiple semicolons cause issues. there may be a more elegant way *)
(* let rec remove_double_semicolons = function 
  | [] -> []
  | Parser.SEP :: t -> (remove_double_semicolons t)
  | x :: t -> 
      let rec aux nums = function
        | [] -> nums
        | a :: t -> if a = List.nth nums 0 && a = Parser.SEP then aux nums t
       else aux (a :: nums) t in
      List.rev (aux [x] t)
;; *)


(* this is a complicated function. it takes the lexed buffer, runs it through the tokenize parser in order to 
extract a list of tokens. once this list has been extracted, we iterate over it to check if the indentations 
are correct, and to insert Parser.INDENT and Parser.DEDENT tokens as desired. We also sanitize it using the 
above methods *)

let indent tokens base current =
    let rec aux curr s out stack = match s with
    | [] -> (curr, stack, List.rev out)
    | Parser.TAB :: t -> aux (curr + 1) t out stack;
    | Parser.COLON :: (Parser.EOL :: t) -> (Stack.push (curr + 1) stack; aux curr (Parser.EOL :: t) (Parser.INDENT :: (Parser.COLON :: out)) stack)
    | Parser.EOL :: t -> aux 0 t (Parser.SEP :: out) stack 
    | a :: t -> (* Printf.printf "indent level: %d (%s)\n" curr (print a); *) if Stack.top stack = curr then aux curr t (a::out) stack (* do nothing, continue with next character *)
      else if Stack.top stack > curr then let _ = Stack.pop stack in aux curr (a :: t) (Parser.DEDENT :: out) stack (* if dedented, pop off the stack and add a DEDENT token *)
      else if curr = (Stack.top stack) + 1 then let _ = Stack.push curr stack in aux curr (a :: t) (Parser.INDENT :: out) stack (* if indented by one, push onto the stack and add an indent token *)
      else raise (Failure "SyntaxError: invalid indentation detected!"); (* else raise an error *)
  in aux current tokens [] base
;;

(* this is the main function loop for the interpreter. We lex the input from stdin,
convert it to a list of Parser.token, apply the appropriate indentation corrections,
check to make sure we are at 0 indentation level, print more dots otherwise, and then
compute the correct value and repeat *)
let rec loop map smap = 
  try 
    Printf.printf ">>> "; flush stdout;
    let base = Stack.create() in let _ = Stack.push 0 base in

    let rec read current stack = (* logic of the interpreter *)
        let lexbuf = (Lexing.from_channel stdin) in
        let temp = (Parser.tokenize Scanner.token) lexbuf in (* char buffer to token list *)
        let (curr, stack, formatted) = indent temp stack current in 
        (* let _ = List.iter (Printf.printf "%s ") (List.map print formatted) in *)
        if Stack.top stack = 0 then formatted else
        (Printf.printf "... "; flush stdout;
        formatted @ (read curr stack))

    in let formatted = ref (read 0 base) in
    let _ = if !debug = 1 then (List.iter (Printf.printf "%s ") (List.map print !formatted); print_endline "") in (* print debug messages *)

    let token lexbuf = (* hack I found online to convert lexbuf list to a map from lexbuf to Parser.token, needed for Ocamlyacc *)
    match !formatted with 
      | []     -> Parser.EOF 
      | h :: t -> formatted := t ; h in

    let program = Parser.program token (Lexing.from_string "") in
    let _ = if !debug = 1 then print_endline ("PROGRAM:\n" ^ (string_of_program program)) in (* print debug messages *)
    let (sast, smap') = (Semant.check smap [] [] program) in (* temporarily here to check validity of SAST *)
    let _ = if !debug = 1 then print_endline ("SPROGRAM:\n" ^ (string_of_sprogram sast)) in (* print debug messages *)
    (* let (result, mymap) = main map 0.0 program in print_endline (string_of_float result);  *)
    flush stdout; loop map smap'
  with
    | Not_found -> loop map smap
    | Parsing.Parse_error -> Printf.printf "SyntaxError: invalid syntax\n"; flush stdout; loop map smap
    | Failure explanation -> Printf.printf "%s\n" explanation; flush stdout; loop map smap
;;

let rec file map smap fname run = (* todo combine with loop *)
  try
    let chan = open_in fname in
    let base = Stack.create() in let _ = Stack.push 0 base in

    let rec read current stack = (* logic of the interpreter *)
      try let line = (input_line chan) ^ "\n" in (* add newline for parser, gets stripped by input_line *)
       let lexbuf = (Lexing.from_string line) in
       let temp = (Parser.tokenize Scanner.token) lexbuf in (* char buffer to token list *)
       let (curr, stack, formatted) = indent temp stack current in
       formatted @ (read curr stack)
     with End_of_file -> close_in chan; []
    in let formatted = ref (read 0 base) in
    let _ = if !debug = 1 then (List.iter (Printf.printf "%s ") (List.map print !formatted); print_endline "") in (* print debug messages *)

    let token lexbuf = (* hack I found online to convert lexbuf list to a map from lexbuf to Parser.token, needed for Ocamlyacc *)
    match !formatted with 
      | []     -> Parser.EOF 
      | h :: t -> formatted := t ; h in

    let program = Parser.program token (Lexing.from_string "") in
    let (sast, smap') = (Semant.check smap [] [] program) in (* temporarily here to check validity of SAST *)
    if run then let (result, mymap) = main map 0.0 program in print_endline (string_of_float result); flush stdout;
  with
    | Not_found -> loop map smap
    | Parsing.Parse_error -> Printf.printf "ParseError: invalid syntax!\n"; flush stdout
    | Failure explanation -> Printf.printf "%s\n" explanation; flush stdout
;;

(* main loop of the interpreter *)
let _ = 
  parse_cmdline specs print_endline; (* parse command line arguments *)
  let emptymap = StringMap.empty in let semptymap = StringMap.empty in
  if String.length !fpath = 0 then 
      (Printf.printf "Welcome to the Coral programming language!\n\n"; flush stdout; 
      try loop emptymap semptymap with Scanner.Eof -> exit 0)
  else if (Sys.file_exists !fpath) then if !run = 1 then file emptymap semptymap !fpath true else file emptymap semptymap !fpath false
  else raise (Failure "CompilerError: invalid file passed to Coral compiler.")
;;
