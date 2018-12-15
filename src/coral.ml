open Ast
open Sast
open Getopt (* package used to handle command line arguments *)
open Utilities
open Interpret

(* boolean flag used to handle debug flag from command line *)
let debug = ref 0

(* string containing path to input file *)
let fpath = ref ""

(* boolean flag used to check if program should be run by interpreter *)
let run = ref 0

(* function used to handle command line arguments *)
let specs =
[
  ( 'd', "debug", (incr debug), None);
  ( 'c', "check", None, ((atmost_once fpath (Error "ArgumentError: can only checked one file with -c flag."))));
  ( 'r', "run", (incr run), None);
]

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
    | a :: t -> if Stack.top stack = curr then aux curr t (a::out) stack (* do nothing, continue with next character *)
      else if Stack.top stack > curr then let _ = Stack.pop stack in aux curr (a :: t) (Parser.DEDENT :: out) stack (* if dedented, pop off the stack and add a DEDENT token *)
      else if curr = (Stack.top stack) + 1 then let _ = Stack.push curr stack in aux curr (a :: t) (Parser.INDENT :: out) stack (* if indented by one, push onto the stack and add an indent token *)
      else raise (Failure "SSyntaxError: invalid indentation detected!"); (* else raise an error *)
  in aux current tokens [] base
    

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
    let _ = if !debug = 1 then (Printf.printf "Lexer: ["; (List.iter (Printf.printf "%s ") (List.map print !formatted); print_endline "]\n")) in (* print debug messages *)

    let token lexbuf = (* hack I found online to convert lexbuf list to a map from lexbuf to Parser.token, needed for Ocamlyacc *)
    match !formatted with 
      | []     -> Parser.EOF 
      | h :: t -> formatted := t ; h in

    let program = Parser.program token (Lexing.from_string "") in
    (* let _ = if !debug = 1 then print_endline ("PROGRAM:\n" ^ (string_of_program program)) in (* print debug messages *) *)
    let (sast, smap') = (Semant.check smap [] [] { forloop = false; cond = false; noeval = false; } program) in (* temporarily here to check validity of SAST *)
    let _ = if !debug = 1 then print_endline ("Parser: \n\n" ^ (string_of_sprogram sast)) in (* print debug messages *)
    (* let (result, mymap) = main map 0.0 program in print_endline (string_of_float result); flush stdout; loop mymap smap' *)
    flush stdout; loop map smap'
  with
    | Not_found -> loop map smap
    | Parsing.Parse_error -> Printf.printf "SyntaxError: invalid syntax\n"; flush stdout; loop map smap
    | Failure explanation -> Printf.printf "%s\n" explanation; flush stdout; loop map smap
    | Runtime explanation -> Printf.printf "%s\n" explanation; flush stdout; loop map smap

(* this is the main function loop for the file parser. We lex the input from a given file,
convert it to a list of Parser.token, apply the appropriate indentation corrections,
dedent to the zero level as needed, and then compute the correct value *)

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
     with End_of_file -> close_in chan; Array.make (Stack.length stack - 1) Parser.DEDENT |> Array.to_list
    in let formatted = ref (read 0 base) in
    let _ = if !debug = 1 then (Printf.printf "Lexer: ["; (List.iter (Printf.printf "%s ") (List.map print !formatted); print_endline "]\n")) in (* print debug messages *)

    let token lexbuf = (* hack I found online to convert lexbuf list to a map from lexbuf to Parser.token, needed for Ocamlyacc *)
    match !formatted with 
      | []     -> Parser.EOF 
      | h :: t -> formatted := t ; h in

    let program = Parser.program token (Lexing.from_string "") in
    let (sast, smap') = (Semant.check smap [] [] { forloop = false; cond = false; noeval = false; } program) in (* temporarily here to check validity of SAST *)
    let _ = if !debug = 1 then print_endline ("Parser: \n\n" ^ (string_of_sprogram sast)) in (* print debug messages *)
    (* if run then let (result, mymap) = main map 0.0 program in print_endline (string_of_float result); *)
    flush stdout;
  with
    | Not_found -> Printf.printf "LexingError: Not Found!\n"; flush stdout
    | Parsing.Parse_error -> Printf.printf "ParseError: invalid syntax!\n"; flush stdout
    | Failure explanation -> Printf.printf "%s\n" explanation; flush stdout
;;

(* main function for the entire. parser the command line arguments, check and call
the appropriate compiler or interpreter command *)

let _ = 
  parse_cmdline specs print_endline; (* parse command line arguments *)
  let emptymap = StringMap.empty in 
  let semptymap = StringMap.empty in
  if String.length !fpath = 0 then 
    (Printf.printf "Welcome to the Coral programming language!\n\n"; flush stdout; 
    try loop emptymap semptymap with Scanner.Eof -> exit 0)
  else if (Sys.file_exists !fpath) 
    then if !run = 1 then file emptymap semptymap !fpath true 
    else file emptymap semptymap !fpath false
  else raise (Failure "CompilerError: invalid file passed to Coral compiler.")
;;
