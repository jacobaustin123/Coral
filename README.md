# Coral
The Coral programming language: a dynamically typed, Python-like language with powerful optional typing for improved scalability and performance.

## Usage

To build the language, clone the repository and run 

```ocamlbuild coral.native```

This will generate an executable called coral.native which acts as an interpreter for our language. 

## Debugging

For debugging, it can be useful to use menhir. Menhir is a tool which extends ocamlyacc, and can be installed by running ```opam install menhir```. With menhir install, you can simply run 

```menhir --interpret --interpret-show-cst ~/.../parser.mly```

to open a debugging interpreter which allows you to test the parser. For instance, after running this command, you can type

```menhir
program: DEF VARIABLE LPAREN VARIABLE RPAREN COLON INDENT SEP RETURN VARIABLE SEP DEDENT SEP
```

to see if it accepts that sequence of parser tokens.

## Status

The lexer and parser are both partially complete. The lexer should be totally complete, baring changes which need to be made due to parser changes. The parser works in its current state, but it throws a variety of errors which need to be resolved. No effort has been made on that front so far. In particular, according to menhir,

```
File "/.../.../Coral/parser.mly", line 15, characters 0-9:
Warning: the precedence level assigned to ELSE is never useful.
File "/Users/JAustin/Desktop/Coral/parser.mly", line 14, characters 0-9:
Warning: the precedence level assigned to NOELSE is never useful.
File "/Users/JAustin/Desktop/Coral/parser.mly", line 25, characters 0-5:
Warning: the precedence level assigned to SEP is never useful.
File "/Users/JAustin/Desktop/Coral/parser.mly", line 95, characters 35-41:
Warning: this %prec declaration is never useful.
Warning: one state has shift/reduce conflicts.
Warning: 42 shift/reduce conflicts were arbitrarily resolved.
```
Furthermore, there is currently no support for non-float literals. That needs to be implemented along with the var : type tags. I have already added INT, FLOAT, STRING, and BOOL to the lexer, and these will simply need to be added to the parser in the expr method. I'm going to wait a few days before adding them, but it should be a simple matter of creating a Var type which can take one of those 4 types, or creating a general type which has a field to specify its type. We can talk about the best way to approach this. 

I have also not exhaustively tested the parser for validity. The indentation system in particular may have issues I have not discovered so far. The tester should try and come up with a systematic way of testig these things. Otherwise, everything looks good.

## Structure

The source code for our language is currently split into four files. 

### 1. ast.mli

ast.mli describes the primary types used in the intermediate AST representations. These include the "stmt" type, which encompasses function declarations, expressions, for and while loops, if statements, and return statements. It also describes the "uop" (unary operation) and "operator" (binary operator) types.

### 2. scanner.mli

scanner.mli is an ocamllex file which describes the symbols used by our language. It is just a single parse statement capturing all of our keywords using regex and parsing them into Parser.token types. This also supports single line comments.

### 3. parser.mly

parser.mly is an ocamlyacc file which describes the CFG structure of our language. Tokens are defined at the top, along with operator precedence. Some of these are not fully implemented, and validation with menhir may throw errors. The _tokenize_ entry point is used by coral.ml to extract all of the lexed tokens from lexbuf for indentation preprocessing. The _program_ entry point is the main entry point used for parsing the language, and calls several submethods.

### 4. coral.ml

coral.ml is an interpreter for our language, reading inputs from stdin, lexing and parsing them, and then printing the output. Many of the methods we intend to support have not been fully implemented, but most basic calculator functions should work. This file also handles the indentation in the _indent_ method.


## Examples

```python
def gcd(a, b):
    while a != b:
        if a > b:
	    a = a - b
        else:
	    b = b - a
    return a
```

generates the tokens "DEF VARIABLE LPAREN VARIABLE COMMA VARIABLE RPAREN COLON INDENT SEP WHILE VARIABLE NEQ VARIABLE COLON INDENT SEP IF VARIABLE GT VARIABLE COLON INDENT SEP VARIABLE ASN VARIABLE MINUS VARIABLE SEP DEDENT ELSE COLON INDENT SEP VARIABLE ASN". **You may need to replace the spaces with tabs.**

This is accepted by menhir as

```menhir
program: DEF VARIABLE LPAREN VARIABLE COMMA VARIABLE RPAREN COLON INDENT SEP WHILE VARIABLE NEQ VARIABLE COLON INDENT SEP IF VARIABLE GT VARIABLE COLON INDENT SEP VARIABLE ASN VARIABLE MINUS VARIABLE SEP DEDENT ELSE COLON INDENT SEP VARIABLE ASN VARIABLE MINUS VARIABLE SEP DEDENT DEDENT RETURN VARIABLE SEP DEDENT SEP
ACCEPT
[program:
  [stmt_list:
    [stmt_list:]
    [stmt:
      [stmt:
        DEF
        VARIABLE
        LPAREN
        [formals_opt:
          [formal_list: [formal_list: VARIABLE] COMMA VARIABLE]
        ]
        RPAREN
        COLON
        [stmt_block:
          INDENT
          SEP
          [stmt_list:
            [stmt_list:
              [stmt_list:]
              [stmt:
                WHILE
                [expr: [expr: VARIABLE] NEQ [expr: VARIABLE]]
                COLON
                [stmt_block:
                  INDENT
                  SEP
                  [stmt_list:
                    [stmt_list:]
                    [stmt:
                      IF
                      [expr: [expr: VARIABLE] GT [expr: VARIABLE]]
                      COLON
                      [stmt_block:
                        INDENT
                        SEP
                        [stmt_list:
                          [stmt_list:]
                          [stmt:
                            [expr:
                              VARIABLE
                              ASN
                              [expr: [expr: VARIABLE] MINUS [expr: VARIABLE]]
                            ]
                            SEP
                          ]
                        ]
                        DEDENT
                      ]
                      ELSE
                      COLON
                      [stmt_block:
                        INDENT
                        SEP
                        [stmt_list:
                          [stmt_list:]
                          [stmt:
                            [expr:
                              VARIABLE
                              ASN
                              [expr: [expr: VARIABLE] MINUS [expr: VARIABLE]]
                            ]
                            SEP
                          ]
                        ]
                        DEDENT
                      ]
                    ]
                  ]
                  DEDENT
                ]
              ]
            ]
            [stmt: RETURN [expr: VARIABLE] SEP]
          ]
          DEDENT
        ]
      ]
      SEP
    ]
  ]
  EOF
]
```
