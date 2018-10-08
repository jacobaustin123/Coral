{ 
	open Parser
	exception Eof
}

let letter = ['a'-'z''A'-'Z']
let number = ['0'-'9']+('.')?['0'-'9']*

rule token = parse
  | [' ' '\r'] { token lexbuf }
  | ':' { COLON }
  | '\t' { TAB }
  | '\n' { EOL }
  | '!' { NOT }
  | "if" { IF }
  | "else" { ELSE }
  | "elif" { raise (Failure("NotImplementedError: elif is not implemented." )) }
  | "assert" { raise (Failure("NotImplementedError: assert is not implemented." )) }
  | "pass" { raise (Failure("NotImplementedError: pass is not yet implemented." )) }
  | "continue" { raise (Failure("NotImplementedError: continue is not yet implemented." )) }
  | "break" { raise (Failure("NotImplementedError: break is not yet implemented." )) }
  | "class" { raise (Failure("NotImplementedError: classes are not yet implemented." )) }
  | "for" { FOR }
  | "while" { WHILE }
  | "def" { DEF }
  | ',' { COMMA }
  | "!=" { NEQ }
  | '<' { LT }
  | '>' { GT }
  | "<=" { LEQ }
  | ">=" { GEQ }
  | "and" { AND }
  | "or" { OR }
  | "in" { IN }
  | "return" { RETURN }
  | "True" { TRUE }
  | "False" { FALSE }
  | "is" { IS }
  | "None" { NONE }
  | "\"\"\"" { TRIPLE }
  | '#' { comment lexbuf }
  | '+' { PLUS }
  | '-' { MINUS } 
  | '*' { TIMES }
  | '/' { DIVIDE }
  | "**" { EXP }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | '{' { LBRACK }
  | '}' { RBRACK }
  | "==" { EQ }
  | '=' { ASN }  
  | ';' { SEP }
  | "int" { INT }
  | "float" { FLOAT }
  | "string" { STRING }
  | "bool" { BOOL }
  | ("global"|"await"|"import"|"from"|"as"|"nonlocal"|"async"|"yield"|"raise"|"except"|"finally"|"is"|"lambda"|"try"|"with") { raise (Failure("NotImplementedError: these Python 3.7 features are not currently being implemented in the Coral language." )) }
  | letter+ as id { VARIABLE(id) }
  | number as lit { LITERAL(float_of_string lit) }
  | eof { raise Eof }
  | _ as char { raise (Failure("SyntaxError: invalid character in identifier " ^ Char.escaped char)) }

and comment = parse
  | '\n' { EOL }
  | _ { comment lexbuf }