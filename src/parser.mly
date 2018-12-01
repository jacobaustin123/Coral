%{ 
	open Ast
%}

%token NOELSE ASN EQ NEQ LT GT LEQ GEQ PLUS MINUS TIMES DIVIDE EXP NOT NEG SEP AND OR ARROW NOP TYPE
%token TAB COLON EOF EOL IF ELSE FOR WHILE COMMA DEF IN TRUE FALSE IS RETURN NONE DOT
%token BOOL INT FLOAT STRING BOOLARR INTARR FLOATARR STRINGARR
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

/* this is done to eliminate shift/reduce conflicts in the first lexing stage. 
none of these tokens need precedence declarations. be careful about this if rules won't reduce */

%nonassoc LOW
%nonassoc HIGH 

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

%nonassoc LPAREN LBRACK LBRACE
%nonassoc RPAREN RBRACK RBRACE

%start tokenize
%type <token list> tokenize /* used to handle indentation */

%start program
%type <Ast.stmt list> program

%%

tokenize: /* used by the parser to read the input into the indentation function */
  | token EOL { $1 @ [EOL] }
  | EOL { NOP :: [EOL] }

token: /* used by the parser to read the input into the indentation function. generated from scanner.mll with an awk script */
  | COLON %prec LOW { [COLON] }
  | TAB %prec LOW { [TAB] }
  | ARROW %prec LOW { [ARROW] }
  | RETURN %prec LOW { [RETURN] }
  | NOT %prec LOW { [NOT] }
  | IF %prec LOW { [IF] }
  | ELSE %prec LOW { [ELSE] }
  | FOR %prec LOW { [FOR] }
  | WHILE %prec LOW { [WHILE] }
  | DEF %prec LOW { [DEF] }
  | COMMA { [COMMA] }
  | NEQ %prec LOW { [NEQ] }
  | LT %prec LOW { [LT] }
  | GT %prec LOW { [GT] }
  | LEQ %prec LOW { [LEQ] }
  | GEQ %prec LOW { [GEQ] }
  | AND %prec LOW { [AND] }
  | OR %prec LOW { [OR] }
  | IN %prec LOW { [IN] }
  | TRUE %prec LOW { [TRUE] }
  | FALSE %prec LOW { [FALSE] }
  | IS %prec LOW { [IS] }
  | PLUS %prec LOW { [PLUS] }
  | MINUS %prec LOW { [MINUS] }
  | TIMES %prec LOW { [TIMES] }
  | DIVIDE %prec LOW { [DIVIDE] }
  | EXP %prec LOW { [EXP] }
  | LPAREN %prec LOW { [LPAREN] }
  | RPAREN %prec LOW { [RPAREN] }
  | LBRACK %prec LOW { [LBRACK] }
  | RBRACK %prec LOW { [RBRACK] }
  | LBRACE %prec LOW { [LBRACE] }
  | RBRACE %prec LOW { [RBRACE] }
  | EQ %prec LOW { [EQ] }
  | ASN %prec LOW { [ASN] }
  | SEP %prec LOW { [SEP] }
  | BOOL %prec LOW { [BOOL] }
  | INT %prec LOW { [INT] }
  | FLOAT %prec LOW { [FLOAT] }
  | STRING %prec LOW { [STRING] }
  | INTARR %prec LOW { [INTARR] }
  | FLOATARR %prec LOW { [FLOATARR] }
  | STRINGARR %prec LOW { [STRINGARR] }
  | BOOLARR %prec LOW { [BOOLARR] }
  | INDENT %prec LOW { [INDENT] }
  | DEDENT %prec LOW { [DEDENT] }
  | VARIABLE %prec LOW { [VARIABLE($1)] }
  | FLOAT_LITERAL %prec LOW { [FLOAT_LITERAL($1)] }
  | INT_LITERAL %prec LOW { [INT_LITERAL($1)] }
  | BOOL_LITERAL %prec LOW { [BOOL_LITERAL($1)] }
  | STRING_LITERAL %prec LOW { [STRING_LITERAL($1)] }
  | EOF %prec LOW { [EOF] }
  | CLASS %prec LOW { [CLASS] }
  | NONE %prec LOW { [NONE] }
  | DOT %prec LOW { [DOT] }
  | TYPE %prec LOW { [TYPE] }
  | token token %prec HIGH { $1 @ $2 }

program: stmt_list EOF { List.rev $1 } /* the main program function */

stmt_list: /* lists of statements in a function body. modified from Micro C */
  | { [] }
  | stmt_list stmt { $2 :: $1 }

stmt:
  | expr SEP { Expr $1 }
  | stmt SEP { $1 }
  | CLASS VARIABLE COLON stmt_block { Class($2, $4) }
  | DEF VARIABLE LPAREN formals_opt RPAREN COLON stmt_block { Func(Bind($2, Dyn), $4, $7) }
  | DEF VARIABLE LPAREN formals_opt RPAREN ARROW typ COLON stmt_block { Func(Bind($2, $7), $4, $9) }
  | RETURN expr SEP { Return $2 }
  | IF expr COLON stmt_block %prec NOELSE { If($2, $4, Block([])) }
  | IF expr COLON stmt_block ELSE COLON stmt_block { If($2, $4, $7) } /* to do figure out (Block) */
  | FOR bind_opt IN expr COLON stmt_block { For($2, $4, $6) }
  | WHILE expr COLON stmt_block { While($2, $4) }
  | formal_asn_list ASN expr { Asn(List.rev $1, $3) }
  | TYPE LPAREN expr RPAREN { TypeInfo($3) }
  | NOP { Nop }

formal_asn_list:
  | bind_opt { [Var $1] }
  | list_access { [$1] }
  | formal_asn_list ASN bind_opt { Var $3 :: $1 }

bind_opt:
  | VARIABLE { Bind($1, Dyn) }
  | VARIABLE COLON typ { Bind($1, $3) }

list_access:
  | expr LBRACK expr RBRACK { ListAccess($1, $3) }
  | expr LBRACK expr COLON expr RBRACK { ListSlice($1, $3, $5) }

stmt_block: 
  | INDENT SEP stmt_list DEDENT { Block(List.rev $3) }

formals_opt: /* used for parsing argument lists in function declarations */
  | { [] }
  | formal_list { List.rev $1 }

formal_list: 
  | bind_opt { [$1] }
  | formal_list COMMA bind_opt { $3 :: $1 }

actuals_opt: /* used for parsing argument lists in function calls and normal [1, 2, 3, 4] lists */
  | { [] }
  | actuals_list { List.rev $1 }

actuals_list:
  | expr { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }

typ:
  | FLOAT { Float }
  | INT { Int }
  | BOOL { Bool }
  | STRING { String }
  | FLOATARR { FloatArr }
  | INTARR { IntArr }
  | BOOLARR { BoolArr }
  | STRINGARR { StringArr }

expr:
| list_access { $1 }
| VARIABLE { Var(Bind($1, Dyn)) }
| expr LPAREN actuals_opt RPAREN { Call($1, $3) }
| expr DOT VARIABLE LPAREN actuals_opt RPAREN %prec HIGH { Method($1, $3, $5) }
| expr DOT VARIABLE %prec LOW { Field($1, $3) }
| MINUS expr %prec NEG { Unop(Neg, $2) }
| NOT expr %prec NOT { Unop(Not, $2) }
| LPAREN expr RPAREN { $2 }
| FLOAT_LITERAL { Lit(FloatLit($1)) }
| BOOL_LITERAL { Lit(BoolLit($1)) }
| INT_LITERAL { Lit(IntLit($1)) }
| STRING_LITERAL { Lit(StringLit($1)) }
| LBRACK actuals_opt RBRACK { List($2) }
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