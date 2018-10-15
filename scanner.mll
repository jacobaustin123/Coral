{ 
	open Parser
	exception Eof

  let strip_quotes str =
  match String.length str with
  | 0 | 1 | 2 -> ""
  | len -> String.sub str 1 (len - 2)
}

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
  | '!' { NOT }
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
  | "is" { IS }
  | "None" { NONE }
  | '#' { comment lexbuf }
  | "\"\"\"" { multiline lexbuf }
  | '+' { PLUS }
  | '-' { MINUS } 
  | '*' { TIMES }
  | '/' { DIVIDE }
  | "**" { EXP }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | '{' { LBRACE }
  | '}' { RBRACE }
  | '[' { LBRACK }
  | ']' { RBRACK }
  | "==" { EQ }
  | '=' { ASN }  
  | ';' { SEP }
  | "int" { INT }
  | "float" { FLOAT }
  | "string" { STRING }
  | "bool" { BOOL }
  | ("global"|"await"|"import"|"from"|"as"|"nonlocal"|"async"|"yield"|"raise"|"except"|"finally"|"is"|"lambda"|"try"|"with") { raise (Failure("NotImplementedError: these Python 3.7 features are not currently being implemented in the Coral language." )) }

(* to do capture groups for string literal to extract everything but the quotes *)

  | stringliteral as id { STRING_LITERAL(strip_quotes id) } 
  | ("True"|"False") as id { if id = "True" then BOOL_LITERAL(true) else BOOL_LITERAL(false) }
  | cstylefloat as lit { FLOAT_LITERAL(float_of_string lit) } 
  | ['0'-'9']+ as id { INT_LITERAL(int_of_string id) }
  | letter+ as id { VARIABLE(id) }

  | eof { raise Eof }
  | _ as char { raise (Failure("SyntaxError: invalid character in identifier " ^ Char.escaped char)) }

and comment = parse
  | '\n' { EOL }
  | _ { comment lexbuf }

and multiline = parse
  | "\"\"\"" { SEP }
  | _ { multiline lexbuf }