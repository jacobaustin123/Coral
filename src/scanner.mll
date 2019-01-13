{ 
	open Parser
	exception Eof

  let strip_quotes str =
  match String.length str with
  | 0 | 1 | 2 -> ""
  | len -> String.sub str 1 (len - 2)

  let getpos line lexbuf = { line_n = line; char_n = Lexing.lexeme_start lexbuf; }

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

rule token line = parse
  | ['\r'] { token lexbuf }
  | ':' { COLON (get_pos line lexbuf) }
  | '\t' { TAB (get_pos line lexbuf) }
  | ' ' { SPACE (get_pos line lexbuf) }
  | '\n' { EOL (get_pos line lexbuf) }
  | "not" { NOT (get_pos line lexbuf) }
  | "if" { IF (get_pos line lexbuf) }
  | "else" { ELSE (get_pos line lexbuf) }
  | "elif" { raise (Failure("NotImplementedError: elif has not been implemented!" )) }
  | "assert" { raise (Failure("NotImplementedError: assert has not been implemented!" )) }
  | "pass" { raise (Failure("NotImplementedError: pass has not been implemented!" )) }
  | "continue" { raise (Failure("NotImplementedError: continue has not been implemented!" )) }
  | "break" { raise (Failure("NotImplementedError: break has not been implemented!" )) }
  | "for" { FOR (get_pos line lexbuf) }
  | "while" { WHILE (get_pos line lexbuf) }
  | "def" { DEF (get_pos line lexbuf) }
  | "int" { INT (get_pos line lexbuf) }
  | "float" { FLOAT (get_pos line lexbuf) }
  | "str" { STRING (get_pos line lexbuf) }
  | "bool" { BOOL (get_pos line lexbuf) }
  | "func" { FUNC (get_pos line lexbuf) }
  | "list" { ARR (get_pos line lexbuf) }
  | ',' { COMMA (get_pos line lexbuf) }
  | '.' { DOT (get_pos line lexbuf) }
  | "!=" { NEQ (get_pos line lexbuf) }
  | '<' { LT (get_pos line lexbuf) }
  | '>' { GT (get_pos line lexbuf) }
  | "<=" { LEQ (get_pos line lexbuf) }
  | ">=" { GEQ (get_pos line lexbuf) }
  | "and" { AND (get_pos line lexbuf) }
  | "or" { OR (get_pos line lexbuf) }
  | "in" { IN (get_pos line lexbuf) }
  | "return" { RETURN (get_pos line lexbuf) }
  | "range" { RANGE (get_pos line lexbuf) }
  | "is" { IS (get_pos line lexbuf) }
  | "None" { NONE (get_pos line lexbuf) }
  | "range" { RANGE (get_pos line lexbuf) }
  | '#' { comment lexbuf (get_pos line lexbuf) }
  | '+' { PLUS (get_pos line lexbuf) }
  | '-' { MINUS (get_pos line lexbuf) } 
  | '*' { TIMES (get_pos line lexbuf) }
  | '/' { DIVIDE (get_pos line lexbuf) }
  | "**" { EXP (get_pos line lexbuf) }
  | "+=" { PLUSEQ (get_pos line lexbuf) }
  | "-=" { MINUSEQ (get_pos line lexbuf) }
  | "*=" { TIMESEQ (get_pos line lexbuf) }
  | "/=" { DIVIDEEQ (get_pos line lexbuf) }
  | "**=" { EXPEQ (get_pos line lexbuf) }
  | '(' { LPAREN (get_pos line lexbuf) }
  | ')' { RPAREN (get_pos line lexbuf) }
  | '{' { LBRACE (get_pos line lexbuf) }
  | '}' { RBRACE (get_pos line lexbuf) }
  | '[' { LBRACK (get_pos line lexbuf) }
  | ']' { RBRACK (get_pos line lexbuf) }
  | "==" { EQ (get_pos line lexbuf) }
  | '=' { ASN (get_pos line lexbuf) }  
  | ';' { SEP (get_pos line lexbuf) }
  | "->" { ARROW (get_pos line lexbuf) }
  | "type" { TYPE (get_pos line lexbuf) }
  | "print" { PRINT (get_pos line lexbuf) }
  | "import" { IMPORT (get_pos line lexbuf) }
  | ("global"|"await"|"from"|"as"|"nonlocal"|"async"|"yield"|"raise"|"except"|"finally"|"is"|"lambda"|"try"|"with") { raise (Failure("NotImplementedError: these Python 3.7 features are not currently being implemented in the Coral language." )) }
  | stringliteral as id { STRING_LITERAL (get_pos line lexbuf, strip_quotes id) } 
  | ("True"|"False") as id { if id = "True" then BOOL_LITERAL(get_pos line lexbuf, true) else BOOL_LITERAL(get_pos line lexbuf, false) }
  | cstylefloat as lit { FLOAT_LITERAL(get_pos line lexbuf, float_of_string lit) } 
  | ['0'-'9']+ as id { INT_LITERAL(get_pos line lexbuf, int_of_string id) }
  | (['a'-'z''A'-'Z''_']letter*) as id { VARIABLE(get_pos line lexbuf, id) }
  | eof { raise Eof }
  | _ as char { raise (Failure("SyntaxError: invalid character in identifier " ^ Char.escaped char)) }

and comment = parse
  | '\n' { EOL (get_pos line lexbuf) }
  | _ { comment lexbuf }