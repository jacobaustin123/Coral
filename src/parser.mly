%{ 
	open Ast
%}

%token NOELSE ASN EQ NEQ LT GT LEQ GEQ PLUS MINUS TIMES DIVIDE EXP NOT NEG SEP AND OR
%token TAB COLON EOF EOL IF ELSE FOR WHILE COMMA DEF IN TRUE FALSE IS RETURN NONE DOT
%token BOOL INT FLOAT STRING
%token CLASS 
%token INDENT DEDENT
%token LPAREN RPAREN
%token LBRACK RBRACK
%token LBRACE RBRACE
%token <string> VARIABLE

%token <float> FLOAT_LITERAL
%token <string> STRING_LITERAL
%token <int> INT_LITERAL
%token <bool> BOOL_LITERAL

%nonassoc NOELSE
%nonassoc ELSE
%right ASN
%left DOT
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE
%right EXP
%right NOT NEG
%left SEP

/* this is done to eliminate shift/reduce conflicts in the first lexing stage. 
none of these tokens need precedence declarations. */

%left RPAREN RBRACK RBRACE
%right LPAREN LBRACK LBRACE
%nonassoc TAB COLON EOF EOL IF FOR WHILE COMMA DEF IN TRUE FALSE IS RETURN INDENT DEDENT VARIABLE BOOL INT FLOAT STRING
%nonassoc CLASS NONE FLOAT_LITERAL INT_LITERAL STRING_LITERAL BOOL_LITERAL
%nonassoc RECURSE

%start tokenize
%type <token list> tokenize /* used to handle indentation */

%start program
%type <Ast.stmt list> program

%%

tokenize: /* used by the parser to read the input into the indentation function */
  | token EOL { $1 @ [EOL] }
  | EOL { SEP :: [EOL] }

token: /* used by the parser to read the input into the indentation function. generated from scanner.mll with an awk script */
  | COLON { [COLON] }
  | TAB { [TAB] }
  | RETURN { [RETURN] }
  | NOT { [NOT] }
  | IF { [IF] }
  | ELSE { [ELSE] }
  | FOR { [FOR] }
  | WHILE { [WHILE] }
  | DEF { [DEF] }
  | COMMA { [COMMA] }
  | NEQ { [NEQ] }
  | LT { [LT] }
  | GT { [GT] }
  | LEQ { [LEQ] }
  | GEQ { [GEQ] }
  | AND { [AND] }
  | OR { [OR] }
  | IN { [IN] }
  | TRUE { [TRUE] }
  | FALSE { [FALSE] }
  | IS { [IS] }
  | PLUS { [PLUS] }
  | MINUS { [MINUS] }
  | TIMES { [TIMES] }
  | DIVIDE { [DIVIDE] }
  | EXP { [EXP] }
  | LPAREN { [LPAREN] }
  | RPAREN { [RPAREN] }
  | LBRACK { [LBRACK] }
  | RBRACK { [RBRACK] }
  | LBRACE { [LBRACE] }
  | RBRACE { [RBRACE] }
  | EQ { [EQ] }
  | ASN { [ASN] }
  | SEP { [SEP] }
  | BOOL { [BOOL] }
  | INT { [INT] }
  | FLOAT { [FLOAT] }
  | STRING { [STRING] }
  | INDENT { [INDENT] }
  | DEDENT { [DEDENT] }
  | VARIABLE { [VARIABLE($1)] }
  | FLOAT_LITERAL { [FLOAT_LITERAL($1)] }
  | INT_LITERAL { [INT_LITERAL($1)] }
  | BOOL_LITERAL { [BOOL_LITERAL($1)] }
  | STRING_LITERAL { [STRING_LITERAL($1)] }
  | EOF { [EOF] }
  | CLASS { [CLASS] }
  | NONE { [NONE] }
  | DOT { [DOT] }
  | token token %prec RECURSE { $1 @ $2 }

/* this code is found in coral.ml, and is used to convert tabs to INDENT and DEDENT tokens.

let indent tokens base current =
    let rec aux curr s out stack = match s with
    | [] -> (curr, stack, List.rev out)
    | Parser.TAB :: t -> aux (curr + 1) t out stack;
    | Parser.COLON :: t -> (Stack.push (curr + 1) stack; aux curr t (Parser.INDENT :: (Parser.COLON :: out)) stack)
    | Parser.EOL :: t -> aux 0 t (Parser.SEP :: out) stack 
    | a :: t -> (* Printf.printf "indent level: %d (%s)\n" curr (print a); *) if Stack.top stack = curr then aux curr t (a::out) stack (* do nothing, continue with next character *)
      else if Stack.top stack > curr then let _ = Stack.pop stack in aux curr (a :: t) (Parser.DEDENT :: out) stack (* if dedented, pop off the stack and add a DEDENT token *)
      else if curr = (Stack.top stack) + 1 then let _ = Stack.push curr stack in aux curr (a :: t) (Parser.INDENT :: out) stack (* if indented by one, push onto the stack and add an indent token *)
      else raise (Failure "SyntaxError: invalid indentation detected!"); (* else raise an error *)
  in let (a, b, c) = aux current tokens [] base in
  (a, b, remove_double_semicolons c)
;;

*/

program: stmt_list EOF { $1 } /* the main program function */

stmt_list: /* lists of statements in a function body. modified from Micro C */
  | { [] }
  | stmt_list stmt { $2 :: $1 }

stmt:
  | expr SEP { Expr $1 }
  | stmt SEP { $1 }
  | CLASS VARIABLE COLON stmt_block { Class($2, $4) }
  | DEF VARIABLE LPAREN formals_opt RPAREN COLON stmt_block { Func($2, $4, $7) }
  | RETURN expr SEP { Return $2 }
  | IF expr COLON stmt_block %prec NOELSE { If($2, $4, []) }
  | IF expr COLON stmt_block ELSE COLON stmt_block { If($2, $4, $7) } /* to do figure out (Block) */
  | FOR VARIABLE IN expr COLON stmt_block { For($2, $4, $6) }
  | WHILE expr COLON stmt_block { While($2, $4) }

stmt_block: 
  | INDENT SEP stmt_list DEDENT { List.rev $3 }

formals_opt: /* used for parsing argument lists in function declarations */
  | { [] }
  | formal_list { List.rev $1 }

formal_list: 
  | VARIABLE { [$1] }
  | formal_list COMMA VARIABLE { $3 :: $1 }

actuals_opt: /* used for parsing argument lists in function calls and normal [1, 2, 3, 4] lists */
  | { [] }
  | actuals_list { List.rev $1 }

actuals_list:
  | expr { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }

expr:
| VARIABLE LPAREN actuals_opt RPAREN { Call($1, $3) }
| expr DOT VARIABLE LPAREN actuals_opt RPAREN { Method($1, $3, $5) }
| expr DOT VARIABLE { Field($1, $3) }
| MINUS expr %prec NEG { Unop(Neg, $2) }
| NOT expr %prec NOT { Unop(Not, $2) }
| LPAREN expr RPAREN { $2 }
| FLOAT_LITERAL { Lit(Float($1)) }
| BOOL_LITERAL { Lit(Bool($1)) }
| INT_LITERAL { Lit(Int($1)) }
| STRING_LITERAL { Lit(String($1)) }
| VARIABLE { Var($1) }
| LBRACK actuals_opt RBRACK { List($2) }
| VARIABLE ASN expr { Asn($1, $3) }
| expr EQ expr { Binop($1, Eq, $3) }
| expr NEQ expr { Binop($1, Neq, $3) }
| expr LT expr { Binop($1, Less, $3) }
| expr GT expr { Binop($1, Greater, $3) }
| expr LEQ expr { Binop($1, Leq, $3) }
| expr GEQ expr { Binop($1, Geq, $3) }
| expr AND expr { Binop($1, And, $3) }
| expr OR expr { Binop($1, Or, $3) }
| expr PLUS expr { Binop($1, Add, $3) }
| expr MINUS expr { Binop($1, Sub, $3) }
| expr TIMES expr { Binop($1, Mul, $3) }
| expr DIVIDE expr { Binop($1, Div, $3) }
| expr EXP expr { Binop($1, Exp, $3) }
;