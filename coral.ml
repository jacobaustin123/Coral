open Ast

module StringMap = Map.Make(String);; (* map from string -> expr *)

let float_of_bool b = if b then 1.0 else 0.0
;;

let rec eval_expr map = function
  | Lit(x) -> (x, map)
  | Var(x) -> (try let v = (StringMap.find x map) in eval_expr map v with Not_found -> Printf.printf "NameError: name '%s' is not defined!\n" x; flush stdout; raise Not_found)
  | Asn(n, v) -> let (v1, m1) = eval_expr map v in let m2 = (StringMap.add n (Lit(v1)) m1) in (v1, m2)
  | Unop(op, v) -> let (v1, m1) = eval_expr map v in
      (match op with
        | Neg -> (-.v1, m1)
        | Not -> if v1 = 0.0 then (1.0, m1) else (0.0, m1))
  | Call(name, args) -> raise (Failure "NotImplementedError: Functions have not yet been implemented");
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
  | If -> if v1 = 1.0 then (v2, m2) else (0.0, m2) (* this doesn't work *)
;;

let rec main map value = function 
  | [] -> (value, map)
  | a :: t -> let (v1, m1) = eval_stmt map a in main m1 v1 t

and eval_stmt map = function
  | Func(a, b, c) -> raise (Failure "NotImplementedError: Functions have not yet been implemented");       (*string * string list * stmt list*)
  | Block(a) -> main map 0.0 a                                                                                 (* stmt list *)
  | Expr(a) -> eval_expr map a                                                                                  (* expr *)          
  | If(a, b, c) -> raise (Failure "NotImplementedError: If statements have not yet been implemented");     (* expr * stmt * stmt *)
  | For(a, b, c) -> raise (Failure "NotImplementedError: For loops have not yet been implemented");        (* string * expr * expr *)
  | While(a, b) -> raise (Failure "NotImplementedError: While loops have not yet been implemented");       (* expr * stmt *)
  | Return(a) ->  raise (Failure "NotImplementedError: Return statements have not yet been implemented");  (* expr *)
;;

let explode s =
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
  exp (String.length s - 1) []
;;

let impode s = String.concat "" (List.map (String.make 1) s)

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
  | Parser.SEP -> "SEP"
  | Parser.EOF -> "EOF"
  | Parser.EOL -> "EOL"
  | Parser.INDENT -> "INDENT"
  | Parser.DEDENT -> "DEDENT"
  | Parser.VARIABLE(x) -> "VARIABLE" (*Printf.sprintf "Var(%s)" x *)
  | Parser.LITERAL(x) -> "LITERAL" (*Printf.sprintf "Lit(%f)" x *)
  | _ -> "I'm too lazy"
;;

let remove_double_semicolons = function
  | [] -> []
  | x :: t -> 
      let rec aux nums = function
        | [] -> nums
        | a :: t -> if a = List.nth nums 0 && a = Parser.SEP then aux nums t
       else aux (a :: nums) t in
      List.rev (aux [x] t)
;;

let indent tokens base current =
    let rec aux curr s out stack = match s with
    | [] -> (curr, stack, List.rev out)
    | Parser.TAB :: t -> aux (curr + 1) t out stack;
    | Parser.COLON :: t -> (Stack.push (curr + 1) stack; aux curr t (Parser.INDENT :: (Parser.COLON :: out)) stack)
    | Parser.EOL :: t -> aux 0 t (Parser.SEP :: out) stack 
    | a :: t -> (* Printf.printf "indent level: %d (%s)\n" curr (print a); *) if Stack.top stack = curr then aux curr t (a::out) stack (* do nothing, continue with next character *)
      else if Stack.top stack > curr then let _ = Stack.pop stack in aux curr (a :: t) (Parser.DEDENT :: out) stack (* if dedented, pop off the stack and add a DEDENT token *)
      else if curr = (Stack.top stack) + 1 then let _ = Stack.push curr stack in aux curr (a :: t) (Parser.INDENT :: out) stack (* if indented by one, push onto the stack and add an indent token *)
      else raise (Failure "SyntaxError: invalid indentation detected"); (* else raise an error *)
  in let (a, b, c) = aux current tokens [] base in
  (a, b, remove_double_semicolons c)
;;

(* let rec empty stack tokens = if Stack.top stack = 0 then tokens else (Stack.pop stack; empty stack (Parser.DEDENT :: tokens)) in (* empty stack after function has returned *)
  let out = List.rev (empty base ttemp) in (* reverse the list *)
  let _ = List.iter (Printf.printf "%s ") (List.map print out) in
  (* let _ = List.iter print_endline (List.map print tokens) in *)
  out *)



let rec loop map = 
  try 
    Printf.printf ">>> "; flush stdout;
    let base = Stack.create() in let _ = Stack.push 0 base in

    let rec read current stack =
        let lexbuf = (Lexing.from_channel stdin) in
        let temp = (Parser.tokenize Scanner.token) lexbuf in 
        let (curr, stack, formatted) = indent temp stack current in 
        (* let _ = List.iter (Printf.printf "%s ") (List.map print formatted) in *)
        if Stack.top stack = 0 then formatted else
        (Printf.printf "... "; flush stdout;
        formatted @ (read curr stack))

    in let formatted = ref (read 0 base) in
    let _ = List.iter (Printf.printf "%s ") (List.map print !formatted) in

    let token lexbuf = 
    match !formatted with 
      | []     -> Parser.EOF 
      | h :: t -> formatted := t ; h in

    let program = Parser.program token (Lexing.from_string "") in
    let (result, mymap) = main map 0.0 program
    in print_endline (string_of_float result); flush stdout; loop mymap
  with
    | Not_found -> loop map
    | Stdlib.Parsing.Parse_error -> Printf.printf "ParseError: invalid syntax\n"; flush stdout; loop map
    | Failure explanation -> Printf.printf "SyntaxError: invalid syntax (%s)\n" explanation; flush stdout; loop map
;;

let _ =
	Printf.printf "Welcome to my simple OCaml calculator!\n\n"; flush stdout;
  try
    let emptymap = StringMap.empty in loop emptymap
  with 
    | Scanner.Eof -> exit 0
;;
