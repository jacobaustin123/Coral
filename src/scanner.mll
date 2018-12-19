{ 
	open Parser
	exception Eof

  let strip_quotes str =
  match String.length str with
  | 0 | 1 | 2 -> ""
  | len -> String.sub str 1 (len - 2)
}

(* a simple lexer implemented in ocamllex for lexing a Coral/Python program, with a few minor limitations.
several Python features have not yet been implemented and will throw errors in the lexing stage if 
encountered. Coral generally follows the K&R C model for floats and string literals *)

let letter = ['a'-'z''A'-'Z''_''0'-'9']
let number = ['0'-'9']+('.')?['0'-'9']*
let stringliteral = ('"'[^'"''\\']*('\\'_[^'"''\\']*)*'"')
let digit = ['0'-'9']
let exp = ('e'|'E')('+'|'-')?['0'-'9']+
let cstylefloat = ('.'['0'-'9']+exp?|['0'-'9']+('.'['0'-'9']*exp?|exp))

rule token = parse
  | [' ' '\r'] { token lexbuf }
  | ':' { COLON }
  | '\t' { TAB }
  | '\n' { EOL }
  | "not" { NOT }
  | "if" { IF }
  | "else" { ELSE }
  | "elif" { raise (Failure("NotImplementedError: elif has not been implemented!" )) }
  | "assert" { raise (Failure("NotImplementedError: assert has not been implemented!" )) }
  | "pass" { raise (Failure("NotImplementedError: pass has not been implemented!" )) }
  | "continue" { raise (Failure("NotImplementedError: continue has not been implemented!" )) }
  | "break" { raise (Failure("NotImplementedError: break has not been implemented!" )) }
  | "class" { CLASS }
  | "for" { FOR }
  | "while" { WHILE }
  | "def" { DEF }
  | "int" { INT }
  | "float" { FLOAT }
  | "str" { STRING }
  | "bool" { BOOL }
  | "func" { FUNC }
  | "int[]" { INTARR }
  | "float[]" { FLOATARR }
  | "str[]" { STRINGARR }
  | "bool[]" { BOOLARR }
  | ',' { COMMA }
  | '.' { DOT }
  | "!=" { NEQ }
  | '<' { LT }
  | '>' { GT }
  | "<=" { LEQ }
  | ">=" { GEQ }
  | "and" { AND }
  | "or" { OR }
  | "in" { IN }
  | "return" { RETURN }
  | "range" { RANGE }
  | "is" { IS }
  | "None" { NONE }
  | "range" { RANGE }
  | '#' { comment lexbuf }
  | '+' { PLUS }
  | '-' { MINUS } 
  | '*' { TIMES }
  | '/' { DIVIDE }
  | "**" { EXP }
  | "+=" { PLUSEQ }
  | "-=" { MINUSEQ }
  | "*=" { TIMESEQ }
  | "/=" { DIVIDEEQ}
  | "**=" { EXPEQ }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | '{' { LBRACE }
  | '}' { RBRACE }
  | '[' { LBRACK }
  | ']' { RBRACK }
  | "==" { EQ }
  | '=' { ASN }  
  | ';' { SEP }
  | "->" { ARROW }
  | "type" { TYPE }
  | "print" { PRINT }
  | "import" { IMPORT }
  | ("global"|"await"|"from"|"as"|"nonlocal"|"async"|"yield"|"raise"|"except"|"finally"|"is"|"lambda"|"try"|"with") { raise (Failure("NotImplementedError: these Python 3.7 features are not currently being implemented in the Coral language." )) }
  | stringliteral as id { STRING_LITERAL(strip_quotes id) } 
  | ("True"|"False") as id { if id = "True" then BOOL_LITERAL(true) else BOOL_LITERAL(false) }
  | cstylefloat as lit { FLOAT_LITERAL(float_of_string lit) } 
  | ['0'-'9']+ as id { INT_LITERAL(int_of_string id) }
  | (['a'-'z''A'-'Z''_']letter*) as id { VARIABLE(id) }
  | eof { raise Eof }
  | _ as char { raise (Failure("SyntaxError: invalid character in identifier " ^ Char.escaped char)) }

and comment = parse
  | '\n' { CEND }
  | _ { comment lexbuf }

(* 

  | "\"\"\"" { multiline lexbuf }

and multiline = parse

  | "\"\"\"" { EOL }
  | _ { multiline lexbuf }

*)