%{ 
	open Ast
%}

%token PLUS MINUS TIMES DIVIDE EXP ASN SEP EQ TAB COLON NOT EOF EOL
%token IF ELSE FOR WHILE COMMA DEF NEQ GT LT LEQ GEQ AND OR IN TRUE FALSE IS RETURN
%token INDENT DEDENT
%token LPAREN RPAREN
%token LBRACK RBRACK
%token <float> LITERAL
%token <string> VARIABLE

%nonassoc NOELSE
%nonassoc ELSE
%right ASN
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE
%left EXP
%right NOT NEG
%left SEP

%start tokenize
%type <token list> tokenize

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
  | EQ { [EQ] }
  | ASN { [ASN] }
  | SEP { [SEP] }
  | INDENT { [INDENT] }
  | DEDENT { [DEDENT] }
  | VARIABLE { [VARIABLE($1)] }
  | LITERAL { [LITERAL($1)] }
  | EOF { [EOF] }	
  | token token { $1 @ $2 }

program: stmt_list EOF { $1 }

stmt_list:
  | { [] }
  | stmt_list stmt { $2 :: $1 }

stmt:
  | expr SEP { Expr $1 }
  | stmt SEP { $1 }
  | DEF VARIABLE LPAREN formals_opt RPAREN COLON stmt_block { Func($2, $4, $7) }
  | RETURN expr SEP { Return $2 }
  | IF expr COLON stmt_block %prec NOELSE { If($2, Block($4), Block([])) }
  | IF expr COLON stmt_block ELSE COLON stmt_block { If($2, Block($4), Block($7)) }
  | FOR VARIABLE IN expr COLON stmt_block { For($2, $4, Block($6)) }
  | WHILE LPAREN expr RPAREN COLON stmt_block { While($3, Block($6)) }

stmt_block: 
  | INDENT SEP stmt_list DEDENT { List.rev $3 }

formals_opt: /* used for parsing argument lists in function declarations */
  | { [] }
  | formal_list { List.rev $1 }

formal_list: 
  | VARIABLE { [$1] }
  | formal_list COMMA VARIABLE { $3 :: $1 }

actuals_opt: /* used for parsing argument lists in function calls */
  | { [] }
  | actuals_list { List.rev $1 }

actuals_list:
  | expr { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }

expr:
| VARIABLE LPAREN actuals_opt RPAREN { Call($1, $3) }
| MINUS expr %prec NEG { Unop(Neg, $2) }
| NOT expr %prec NOT { Unop(Not, $2) }
| LPAREN expr RPAREN { $2 }
| LITERAL { Lit($1) }
| VARIABLE { Var($1) }
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