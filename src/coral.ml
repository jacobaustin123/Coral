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

(* search_env_opt: search the given environment variable for valid search paths 
and search these for files of the form path/name, return channel if exists, None otherwise *)

let search_env_opt env name = 
  if not (Filename.is_relative name) 
    then if Sys.file_exists name 
      then Some name 
      else None
  else let env_string = Sys.getenv_opt env in
    match env_string with
      | None -> if Sys.file_exists name then Some name else None
      | Some x -> let paths = String.split_on_char ':' x in
          let curr = List.find_opt (fun path -> Sys.file_exists (Filename.concat path name)) paths in
          match curr with
            | None -> if Sys.file_exists name then Some name else None
            | Some path -> Some (Filename.concat path name)

(* get_ast: loads the ast from a given path if possible, lexing and
parsing the file found at that path *)

let get_ast path = 
  let chan = open_in path
  in let base = Stack.create() in let _ = Stack.push 0 base in

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

  let program = Parser.program token (Lexing.from_string "") in program

let ast_from_path fname = 
  let path = search_env_opt "PATH" fname in
  let name = match path with
    | None -> raise (Failure ("FileNotFoundError: unable to open file " ^ fname)) 
    | Some x -> x
  in get_ast name

let fix_extension file = match Filename.check_suffix file ".cl" with
  | true -> file
  | false -> file ^ ".cl"

let replace_import li =
  let rec aux out = function
    | [] -> List.rev out
    | Import(name) :: t -> 
        let program = ast_from_path (fix_extension name) in
        aux ((List.rev program) @ out) t
    | Func(a, b, s1) :: t -> let updated = aux [] (from_block s1) in aux (Func(a, b, Block(updated)) :: out) t
    | Block(s1) :: t -> let updated = aux [] s1 in aux (Block(updated) :: out) t
    | If(a, s1, s2) :: t -> let u1 = aux [] (from_block s1) in let u2 = aux [] (from_block s2) in aux (If(a, Block(u1), Block(u2)) :: out) t
    | For(a, b, s1) :: t -> let updated = aux [] (from_block s1) in aux (For(a, b, Block(updated)) :: out) t
    | While(a, s1) :: t -> let updated = aux [] (from_block s1) in aux (While(a, Block(updated)) :: out) t
    | a :: t -> aux (a :: out) t 
  in aux [] li

let process_output_to_list = fun command -> 
  let chan = Unix.open_process_in command in
  let res = ref ([] : string list) in
  let rec process_otl_aux () =  
    let e = input_line chan in
    res := e::!res;
    process_otl_aux() in
  try process_otl_aux ()
  with End_of_file ->
    let stat = Unix.close_process_in chan in (List.rev !res,stat)

let cmd_to_list command =
  let (l, _) = process_output_to_list command in l

let rec strip_stmt = function
  | Type(x) | Print(x) -> Nop
  | If(a, b, c) -> If(a, strip_stmt b, strip_stmt c)
  | While(a, b) -> While(a, strip_stmt b)
  | For(a, b, c) -> For(a, b, strip_stmt c)
  | Block(x) -> Block(strip_print x)
  | _ as x -> x

and strip_print ast = List.rev (List.fold_left (fun acc x -> (strip_stmt x) :: acc) [] ast)

(* this is the main function loop for the interpreter. We lex the input from stdin,
convert it to a list of Parser.token, apply the appropriate indentation corrections,
check to make sure we are at 0 indentation level, print more dots otherwise, and then
compute the correct value and repeat *)

let rec from_console map smap past run = 
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

    let program = 
      if run then (Parser.program token (Lexing.from_string ""))
      else (Parser.program token (Lexing.from_string "")) in

    let program_with_imports = replace_import program in

    let (sast, smap') = (Semant.check smap [] [] { forloop = false; cond = false; noeval = false; } program_with_imports) in (* temporarily here to check validity of SAST *)

    if run then
      (let m = Codegen.translate sast in
      Llvm_analysis.assert_valid_module m;
      let oc = open_out "source.ll" in
      (* (Llvm.string_of_llmodule m); *)
      (* Printf.printf "%s\n" (Llvm.string_of_llmodule m); *)
      Printf.fprintf oc "%s\n" (Llvm.string_of_llmodule m); close_out oc;
      let output = cmd_to_list "./inter.sh source.ll" in
      List.iter print_endline output; flush stdout; from_console map smap program_with_imports run)

    else let _ = if !debug = 1 then print_endline ("Parser: \n\n" ^ (string_of_sprogram sast)) in (* print debug messages *)
      flush stdout; from_console map smap' [] false

    (* let m = Codegen.translate sast in *)
    (* Llvm_analysis.assert_valid_module m; *)
    (* print_string (Llvm.string_of_llmodule m) *)
    (* let (result, mymap) = main map 0.0 program *)
    (* flush stdout; loop map smap' *)

  with
    | Not_found -> Printf.printf "NotFoundError: unknown lexing error\n"; from_console map smap past run
    | Parsing.Parse_error -> Printf.printf "SyntaxError: invalid syntax\n"; flush stdout; from_console map smap past run
    | Failure explanation -> Printf.printf "%s\n" explanation; flush stdout; from_console map smap past run
    | Runtime explanation -> Printf.printf "%s\n" explanation; flush stdout; from_console map smap past run

(* this is the main function loop for the file parser. We lex the input from a given file,
convert it to a list of Parser.token, apply the appropriate indentation corrections,
dedent to the zero level as needed, and then compute the correct value *)

let rec from_file map smap fname run = (* todo combine with loop *)
  try
    let program = Sys.chdir (Filename.dirname fname); ast_from_path (Filename.basename fname) in
    let program_with_imports = replace_import program in
    let (sast, smap') = (Semant.check smap [] [] { forloop = false; cond = false; noeval = false; } program_with_imports) in (* temporarily here to check validity of SAST *)
    let _ = if !debug = 1 then print_endline ("Parser: \n\n" ^ (string_of_sprogram sast)); flush stdout; in (* print debug messages *)
    
    if run then 
      let m = Codegen.translate sast in
      Llvm_analysis.assert_valid_module m;
      print_string (Llvm.string_of_llmodule m);
  with
    | Not_found -> Printf.printf "NotFoundError: possibly caused by lexer!\n"; flush stdout
    | Parsing.Parse_error -> Printf.printf "ParseError: invalid syntax!\n"; flush stdout
    | Failure explanation -> Printf.printf "%s\n" explanation; flush stdout

(* main loop *)
let _ =
  parse_cmdline specs print_endline; (* parse command line arguments *)
  (* if !debug = 1 && !run = 1 then raise (Failure "CompilerError: cannot run file and view debug information at the same time. Use either -d or -r flags.") *)
  let emptymap = StringMap.empty in 
  let semptymap = StringMap.empty in
  if String.length !fpath = 0 then 
    (Printf.printf "Welcome to the Coral programming language!\n\n"; flush stdout; 
    try from_console emptymap semptymap [] ( !run = 1) with Scanner.Eof -> exit 0)
  else if !run = 1 then from_file emptymap semptymap !fpath true 
  else from_file emptymap semptymap !fpath false
