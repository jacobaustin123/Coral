%{ 
	open Ast

  let make_expr rawexpr pos = { value = rawexpr; pos = pos; }
  let make_stmt rawstmt pos = { value = rawstmt; pos = pos; }
%}

/* A simple LR parser in OcamlYacc implementing a minimal Python syntax with some
limitations on exceptions, generators, importing modules, and some other features.

The first parsing target, tokenize, is a helper marser used to simply parse the
lexing stream into a list that can be used to extract indentation/tabs for the
Python-style indentation based parsing scheme. The second is the full parser. 

Note: if any token is added here, it must also be added in the token target below 
and in the print utility in utilities.ml */

%token <Ast.position> NOELSE ASN EQ NEQ LT GT LEQ GEQ PLUS MINUS TIMES DIVIDE PLUSEQ MINUSEQ TIMESEQ DIVIDEEQ EXPEQ
%token <Ast.position> EXP NOT NEG SEP AND OR ARROW NOP TYPE PRINT FUNC
%token <Ast.position> TAB SPACE COLON EOF EOL IF ELSE FOR WHILE COMMA DEF IN TRUE FALSE IS RETURN NONE DOT
%token <Ast.position> BOOL INT FLOAT STRING ARR
%token <Ast.position> IMPORT CEND RANGE
%token <Ast.position> INDENT DEDENT
%token <Ast.position> LPAREN RPAREN
%token <Ast.position> LBRACK RBRACK
%token <Ast.position> LBRACE RBRACE
%token <string * Ast.position> VARIABLE

%token <float * Ast.position> FLOAT_LITERAL
%token <string * Ast.position> STRING_LITERAL
%token <int * Ast.position> INT_LITERAL
%token <bool * Ast.position> BOOL_LITERAL

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
  | EOL { NOP :: [EOL] }

/* seq: an auxillary target used to handle shift reduce errors in tokenize */

seq:
  | token { [$1] }
  | token seq { $1 :: $2 }

token:
  | COLON { COLON($1) }
  | TAB { TAB($1) }
  | SPACE { SPACE($1) }
  | ARROW { ARROW($1) }
  | RETURN { RETURN($1) }
  | NOT { NOT($1) }
  | IF { IF($1) }
  | ELSE { ELSE($1) }
  | FOR { FOR($1) }
  | WHILE { WHILE($1) }
  | DEF { DEF($1) }
  | COMMA { COMMA($1) }
  | NEQ { NEQ($1) }
  | LT { LT($1) }
  | GT { GT($1) }
  | LEQ { LEQ($1) }
  | GEQ { GEQ($1) }
  | AND { AND($1) }
  | OR { OR($1) }
  | IN { IN($1) }
  | TRUE { TRUE($1) }
  | FALSE { FALSE($1) }
  | IS { IS($1) }
  | PLUS { PLUS($1) }
  | MINUS { MINUS($1) }
  | TIMES { TIMES($1) }
  | DIVIDE { DIVIDE($1) }
  | EXP { EXP($1) }
  | PLUSEQ { PLUSEQ($1) }
  | MINUSEQ { MINUSEQ($1) }
  | TIMESEQ { TIMESEQ($1) }
  | DIVIDEEQ { DIVIDEEQ($1) }
  | EXPEQ { EXPEQ($1) }
  | LPAREN { LPAREN($1) }
  | RPAREN { RPAREN($1) }
  | LBRACK { LBRACK($1) }
  | RBRACK { RBRACK($1) }
  | LBRACE { LBRACE($1) }
  | RBRACE { RBRACE($1) }
  | EQ { EQ($1) }
  | ASN { ASN($1) }
  | SEP { SEP($1) }
  | BOOL { BOOL($1) }
  | INT { INT($1) }
  | FLOAT { FLOAT($1) }
  | FUNC { FUNC($1) }
  | ARR { ARR($1) }
  | STRING { STRING($1) }
  | INDENT { INDENT($1) }
  | DEDENT { DEDENT($1) }
  | VARIABLE { VARIABLE($1) }
  | FLOAT_LITERAL { FLOAT_LITERAL($1) }
  | INT_LITERAL { INT_LITERAL($1) }
  | BOOL_LITERAL { BOOL_LITERAL($1) }
  | STRING_LITERAL { STRING_LITERAL($1) }
  | EOF { EOF($1) }
  | NONE { NONE($1) }
  | DOT { DOT($1) }
  | TYPE { TYPE($1) }
  | PRINT { PRINT($1) }
  | IMPORT { IMPORT($1) }
  | RANGE { RANGE($1) }

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
c) an import statement
d) a class with a name and block of statements
e) a function with optional typed arguments
f) a function with explicit return type
g) a return statement
h) an if statement
i) an if statement with an else block
j) a for loop
k) a range loop
l) a while loop
m) a list of assignments
n-r) compound assignment expressions (purely syntactic sugar)
s) a "type" statement (prints the type of a variable)
t) hard-coded print statements
u) no operation statements

Other statements can be added by defining the appropriate syntax, and adding a new class of statements
to the ast.ml stmt type.
*/

stmt:
  | expr SEP { make_expr (Expr $1.value) $1.pos }
  | stmt SEP { $1 }
  | IMPORT VARIABLE SEP { make_stmt (Import $2.value) $1 }
  | DEF VARIABLE LPAREN formals_opt RPAREN COLON SEP stmt_block { let bind = Bind({name = $2.value; typ = Dyn; pos = $2;}) in make_stmt (Func(bind, $4, $8)) $1 }
  | DEF VARIABLE LPAREN formals_opt RPAREN ARROW typ COLON SEP stmt_block { let bind = Bind({name = $2.value; typ = $7; pos = $2;}) in make_stmt (Func(bind, $4, $7), $4, $10) $1 }
  | RETURN expr SEP { make_stmt (Return $2) $1 }
  | IF expr COLON SEP stmt_block %prec NOELSE { let else = (make_stmt Block([]) $1) in make_stmt (If($2, $5, else)) $1 }
  | IF expr COLON SEP stmt_block ELSE COLON SEP stmt_block { make_stmt (If($2, $5, $9)) $1 } /* to do figure out (Block) */
  | FOR bind_opt IN expr COLON SEP stmt_block { make_stmt (For($2, $4, $7)) $1 }
  | FOR bind_opt IN RANGE LPAREN expr RPAREN COLON SEP stmt_block { make_stmt (Range($2, $6, $1)) $1 }
  | WHILE expr COLON SEP stmt_block { make_stmt (While($2, $5)) $1 }
  | formal_asn_list ASN expr { make_stmt (Asn(List.rev $1, $3)) $2 }
  | lvalue PLUSEQ expr { let binop = make_stmt (Binop($1, Add, $3)) $1.pos in (make_stmt (Asn([$1], binop))) $2 }
  | lvalue MINUSEQ expr { let binop = make_stmt (Binop($1, Sub, $3)) $1.pos in (make_stmt (Asn([$1], binop))) $2 }
  | lvalue TIMESEQ expr { let binop = make_stmt (Binop($1, Mul, $3)) $1.pos in (make_stmt (Asn([$1], binop))) $2 }
  | lvalue DIVIDEEQ expr { let binop = make_stmt (Binop($1, Div, $3)) $1.pos in (make_stmt (Asn([$1], binop))) $2 }
  | lvalue DIVIDEEQ expr { let binop = make_stmt (Binop($1, Exp, $3)) $1.pos in (make_stmt (Asn([$1], binop))) $2 }
  | TYPE LPAREN expr RPAREN { make_stmt (Type($3.value)) $1 }
  | PRINT LPAREN expr RPAREN { make_stmt (Print($3.value)) $1 }
  | NOP { make_stmt Nop $1 }

formal_asn_list:
  | lvalue { [$1] }
  | formal_asn_list ASN lvalue { $3 :: $1 }

/* An lvalue is anything that can occur on the left-hand side of an assignment.
Currently Coral only supports assignments to variables or to list index/access
expressions. Further additions could include list slices, methods, and fields */

lvalue:
  | bind_opt { make_expr (Var $1.value) $1.pos }
  | list_access { $1 }

/* bind_opt: optional type target, for variables of the form x or x : type */

bind_opt:
  | VARIABLE { let (pos, name) = $1 in Bind({name = name; typ = Dyn; pos = name; }) }
  | VARIABLE COLON typ { let (pos, name) = $1 in Bind({name = name; typ = $3; pos = pos; }) }

/* list_access: list access of the form name[expr] or name[expr : expr]. 
this permits invalid access and needs to be checked in semant and at runtime. */

list_access:
  | expr LBRACK expr RBRACK { make_stmt (ListAccess($1, $3)) $1.pos }
  | expr LBRACK expr COLON expr RBRACK { make_stmt (ListSlice($1, $3, $5)) $1.pos }

/* stmt_block: a statement block contained within a function, class, loop, or conditional.
delimited by an indent and dedent block introduced by the indentation parser in coral.ml */

stmt_block: 
  | INDENT stmt_list DEDENT { make_stmt (Block(List.rev $2.value)) $1 }

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
  | ARR { Arr }
  | FUNC { FuncType }

/* expr: these are all possible expressions allowed in the Coral language. each
expression corresponds to an expr object in the ast.ml file. Expressions are anything
that return a value, i.e. can be assigned to a variable. These include lists, list access
and list slice, methods and fields, function calls, binary and unary operations, and literals. */

expr:
| list_access { $1 }
| VARIABLE { let (pos, name) = $1 in make_expr (Var(Bind(name, Dyn))) pos }
| expr LPAREN actuals_opt RPAREN { make_expr (Call($1, $3)) $1.pos }
| MINUS expr %prec NEG { make_expr (Unop(Neg, $2)) $1 }
| NOT expr %prec NOT { make_expr (Unop(Not, $2)) $1 }
| LPAREN expr RPAREN { $2 }
| FLOAT_LITERAL { let (pos, val) = $1 in make_expr (Lit(FloatLit(val))) pos }
| BOOL_LITERAL { let (pos, val) = $1 in make_expr (Lit(BoolLit(val))) pos }
| INT_LITERAL { let (pos, val) = $1 in make_expr (Lit(IntLit(val))) pos }
| STRING_LITERAL { let (pos, val) = $1 in make_expr (Lit(StringLit(val))) pos }
| LBRACK actuals_opt RBRACK { make_expr (List($2)) $1 }
| expr EQ expr { make_expr (Binop($1, Eq, $3)) $1.pos }
| expr NEQ expr { make_expr (Binop($1, Neq, $3)) $1.pos }
| expr LT expr { make_expr (Binop($1, Less, $3)) $1.pos }
| expr GT expr { make_expr (Binop($1, Greater, $3)) $1.pos }
| expr LEQ expr { make_expr (Binop($1, Leq, $3)) $1.pos }
| expr GEQ expr { make_expr (Binop($1, Geq, $3)) $1.pos }
| expr AND expr { make_expr (Binop($1, And, $3)) $1.pos }
| expr OR expr { make_expr (Binop($1, Or, $3)) $1.pos }
| expr PLUS expr { make_expr (Binop($1, Add, $3)) $1.pos }
| expr MINUS expr { make_expr (Binop($1, Sub, $3)) $1.pos }
| expr TIMES expr { make_expr (Binop($1, Mul, $3)) $1.pos }
| expr DIVIDE expr { make_expr (Binop($1, Div, $3)) $1.pos }
| expr EXP expr { make_expr (Binop($1, Exp, $3)) $1.pos }
;
