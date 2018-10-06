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
  | letter+ as id { VARIABLE(id) }
  | number as lit { LITERAL(float_of_string lit) }
  | eof { raise Eof }
  | _ as char { raise (Failure("SyntaxError: invalid character in identifier " ^ Char.escaped char)) }


and comment = parse
  | '\n' { EOL }
  | _ { comment lexbuf }