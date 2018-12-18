%{ 
	open Ast
%}

/* A simple LR parser in OcamlYacc implementing a minimal Python syntax with some
limitations on exceptions, generators, importing modules, and some other features.

The first parsing target, tokenize, is a helper marser used to simply parse the
lexing stream into a list that can be used to extract indentation/tabs for the
Python-style indentation based parsing scheme. The second is the full parser */

%token NOELSE ASN EQ NEQ LT GT LEQ GEQ PLUS MINUS TIMES DIVIDE PLUSEQ MINUSEQ TIMESEQ DIVIDEEQ EXPEQ
%token EXP NOT NEG SEP AND OR ARROW NOP TYPE PRINT FUNC
%token TAB COLON EOF EOL IF ELSE FOR WHILE COMMA DEF IN TRUE FALSE IS RETURN NONE DOT
%token BOOL INT FLOAT STRING BOOLARR INTARR FLOATARR STRINGARR
%token CLASS IMPORT CEND RANGE
%token INDENT DEDENT
%token LPAREN RPAREN
%token LBRACK RBRACK
%token LBRACE RBRACE
%token <string> VARIABLE

%token <float> FLOAT_LITERAL
%token <string> STRING_LITERAL
%token <int> INT_LITERAL
%token <bool> BOOL_LITERAL

%nonassoc NOFIELD /* handles shift-reduce error for fields and methods in classes */
%nonassoc FIELD

%nonassoc NOELSE /* handles shift-reduce error for else and noelse clauses */
%nonassoc ELSE

%right ASN PLUSEQ MINUSEQ DIVIDEEQ TIMESEQ
%left DOT
%left OR
%left AND 
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE
%right EXP EXPEQ
%right NOT NEG
%left SEP

%nonassoc LPAREN LBRACK LBRACE
%nonassoc RPAREN RBRACK RBRACE

/* this tokenize target is simply used to take the input lexbuf stream and produce
a list of Parser.tokens for use by the indentation method in Coral.ml */

%start tokenize
%type <token list> tokenize 


/* this program target is the main target used to parse the entire program */

%start program
%type <Ast.stmt list> program

%%

tokenize:
  | seq EOL { $1 @ [EOL] }
  | seq CEND { $1 @ [EOL] }
  | CEND { CEND :: [EOL] }
  | EOL { NOP :: [EOL] }

/* seq: an auxillary target used to handle shift reduce errors in tokenize */

seq:
  | token { [$1] }
  | token seq { $1 :: $2 }

token:
  | COLON { COLON }
  | TAB { TAB }
  | ARROW { ARROW }
  | RETURN { RETURN }
  | NOT { NOT }
  | IF { IF }
  | ELSE { ELSE }
  | FOR { FOR }
  | WHILE { WHILE }
  | DEF { DEF }
  | COMMA { COMMA }
  | NEQ { NEQ }
  | LT { LT }
  | GT { GT }
  | LEQ { LEQ }
  | GEQ { GEQ }
  | AND { AND }
  | OR { OR }
  | IN { IN }
  | TRUE { TRUE }
  | FALSE { FALSE }
  | IS { IS }
  | PLUS { PLUS }
  | MINUS { MINUS }
  | TIMES { TIMES }
  | DIVIDE { DIVIDE }
  | EXP { EXP }
  | PLUSEQ { PLUSEQ }
  | MINUSEQ { MINUSEQ }
  | TIMESEQ { TIMESEQ }
  | DIVIDEEQ { DIVIDEEQ }
  | EXPEQ { EXPEQ }
  | LPAREN { LPAREN }
  | RPAREN { RPAREN }
  | LBRACK { LBRACK }
  | RBRACK { RBRACK }
  | LBRACE { LBRACE }
  | RBRACE { RBRACE }
  | EQ { EQ }
  | ASN { ASN }
  | SEP { SEP }
  | BOOL { BOOL }
  | INT { INT }
  | FLOAT { FLOAT }
  | FUNC { FUNC }
  | STRING { STRING }
  | INTARR { INTARR }
  | FLOATARR { FLOATARR }
  | STRINGARR { STRINGARR }
  | BOOLARR { BOOLARR }
  | INDENT { INDENT }
  | DEDENT { DEDENT }
  | VARIABLE { VARIABLE($1) }
  | FLOAT_LITERAL { FLOAT_LITERAL($1) }
  | INT_LITERAL { INT_LITERAL($1) }
  | BOOL_LITERAL { BOOL_LITERAL($1) }
  | STRING_LITERAL { STRING_LITERAL($1) }
  | EOF { EOF }
  | CLASS { CLASS }
  | NONE { NONE }
  | DOT { DOT }
  | TYPE { TYPE }
  | PRINT { PRINT }
  | IMPORT { IMPORT }
  | RANGE { RANGE }

/* program: the main program parser target. read a list of statements until EOF is reached.
constructed backwards per the usual OCaml functional list syntax. */

program: stmt_list EOF { List.rev $1 }

/* stmt_list: a list of statements in the global scope or a function body. modified from Micro C. */

stmt_list:
  | { [] }
  | stmt_list stmt { $2 :: $1 }

/* stmt: this defines all possible statements in the Coral language. Those possible statements are:

a) an expression
b) another statement (in case of unusual behavior in the parser
c) a class with a name and block of statements
d) a function with optional typed arguments
e) a function with explicit return type
f) a for loop
g) a while loop
e) a list of names or other valid lvalue expressions. will be expanded as more lvalues are supported
f) hard-coded type statements
g) hard-coded print statements
h) no operation statements

Other statements can be added by defining the appropriate syntax, and adding a new class of statements
to the ast.ml stmt type.
*/

stmt:
  | expr SEP { Expr $1 }
  | stmt SEP { $1 }
  | IMPORT VARIABLE SEP { Import($2) }
  | CLASS VARIABLE COLON stmt_block { Class($2, $4) }
  | DEF VARIABLE LPAREN formals_opt RPAREN COLON stmt_block { Func(Bind($2, Dyn), $4, $7) }
  | DEF VARIABLE LPAREN formals_opt RPAREN ARROW typ COLON stmt_block { Func(Bind($2, $7), $4, $9) }
  | RETURN expr SEP { Return $2 }
  | IF expr COLON stmt_block %prec NOELSE { If($2, $4, Block([])) }
  | IF expr COLON stmt_block ELSE COLON stmt_block { If($2, $4, $7) } /* to do figure out (Block) */
  | FOR bind_opt IN expr COLON stmt_block { For($2, $4, $6) }
  | FOR bind_opt IN RANGE LPAREN expr RPAREN COLON stmt_block { Range($2, $6, $9) }
  | WHILE expr COLON stmt_block { While($2, $4) }
  | formal_asn_list ASN expr { Asn(List.rev $1, $3) }
  | lvalue PLUSEQ expr { Asn([$1], Binop($1, Add, $3)) }
  | lvalue MINUSEQ expr { Asn([$1], Binop($1, Sub, $3)) }
  | lvalue TIMESEQ expr { Asn([$1], Binop($1, Mul, $3)) }
  | lvalue DIVIDEEQ expr { Asn([$1], Binop($1, Div, $3)) }
  | lvalue EXPEQ expr { Asn([$1], Binop($1, Exp, $3)) }
  | TYPE LPAREN expr RPAREN { Type($3) }
  | PRINT LPAREN expr RPAREN { Print($3) }
  | NOP { Nop }

formal_asn_list:
  | lvalue { [$1] }
  | formal_asn_list ASN lvalue { $3 :: $1 }

lvalue:
  | bind_opt { Var $1 }
  | list_access { $1 }

/* inplace_op:
  | lvalue PLUSEQ expr { Asn([$1], Binop($1, Add, $3)) }
  | lvalue MINUSEQ expr { Asn([$1], Binop($1, Sub, $3)) }
  | lvalue TIMESEQ expr { Asn([$1], Binop($1, Mul, $3)) }
  | lvalue DIVIDEEQ expr { Asn([$1], Binop($1, Div, $3)) }
  | lvalue EXPEQ expr { Asn([$1], Binop($1, Exp, $3)) } */

/* bind_opt: optional type target, for variables of the form x or x : type */

bind_opt:
  | VARIABLE { Bind($1, Dyn) }
  | VARIABLE COLON typ { Bind($1, $3) }

/* list_access: list access of the form name[expr] or name[expr : expr]. 
this permits invalid access and needs to be checked in semant and at runtime. */

list_access:
  | expr LBRACK expr RBRACK { ListAccess($1, $3) }
  | expr LBRACK expr COLON expr RBRACK { ListSlice($1, $3, $5) }

/* stmt_block: a statement block contained within a function, class, loop, or conditional.
delimited by an indent and dedent block introduced by the indentation parser in coral.ml */

stmt_block: 
  | INDENT SEP stmt_list DEDENT { Block(List.rev $3) }

/* formals_opt: an optional formal name in a function declaration */

formals_opt:
  | { [] }
  | formal_list { List.rev $1 }

/* formal_list: a list of optional formal names in a function declaration */

formal_list: 
  | bind_opt { [$1] }
  | formal_list COMMA bind_opt { $3 :: $1 }

/* actuals_opt: an optional expression in a function call */

actuals_opt: 
  | { [] }
  | actuals_list { List.rev $1 }

/* actuals_list: an optional list of expressions in a function call */

actuals_list:
  | expr { [$1] }
  | actuals_list COMMA expr { $3 :: $1 }

/* typ: the possible type attributes that can be attached to an optionally typed variable. */

typ:
  | FLOAT { Float }
  | INT { Int }
  | BOOL { Bool }
  | STRING { String }
  | FLOATARR { FloatArr }
  | INTARR { IntArr }
  | BOOLARR { BoolArr }
  | STRINGARR { StringArr }
  | FUNC { FuncType }

/* expr: these are all possible expressions allowed in the Coral language. each
expression corresponds to an expr object in the ast.ml file. Expressions are anything
that return a value, i.e. can be assigned to a variable. These include lists, list access
and list slice, methods and fields, function calls, binary and unary operations, and literals. */

expr:
| list_access { $1 }
| VARIABLE { Var(Bind($1, Dyn)) }
| expr LPAREN actuals_opt RPAREN { Call($1, $3) }
| expr DOT VARIABLE LPAREN actuals_opt RPAREN { Method($1, $3, $5) }
| expr DOT VARIABLE %prec FIELD { Field($1, $3) }
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