# Coral
The Coral programming language: a dynamically typed, Python-like language with powerful optional typing for improved scalability and performance.

## Usage

To build the language, clone the repository and run 

```ocamlbuild coral.native```

This will generate an executable called coral.native which acts as an interpreter for our language. 

## Examples

```python
def gcd(a, b):
    while a != b:
        if a > b:
	    a = a - b
        else:
	    b = b - a
    return a

x = 54
y = 26
gcd(x, y)
```

works correctly. Note that Coral currently doesn't support space-based indentation, and you can't copy and paste into the interpreter for some reason.

## Debugging

For debugging the parser or lexer, the interpreter supports a debug mode entered by running the executable with the ```-d``` option, i.e. ```./coral.native -d```. This will print the lexed input along with the result of each line. 

For debugging the parser, it can be useful to use menhir. Menhir is a tool which extends ocamlyacc, and can be installed by running ```opam install menhir```. With menhir install, you can simply run 

```menhir --interpret --interpret-show-cst ~/.../parser.mly```

to open a debugging interpreter which allows you to test the parser. For instance, after running this command, you can type

```menhir
program: DEF VARIABLE LPAREN VARIABLE RPAREN COLON INDENT SEP RETURN VARIABLE SEP DEDENT SEP
```

to see if it accepts that sequence of parser tokens. Here, the program tab indicates that menhir should be querying the program entry point, since I use multiple entry points for different parsing tasks.

## Status

The lexer and parser are both complete, except for the static typing syntax/parsing. However, the interpreter currently does not support non-float literals. That needs to be implemented along with the var : type tags. I have already added INT, FLOAT, STRING, and BOOL to the lexer, and these will simply need to be added to the parser in the expr method. I'm going to wait a few days before adding them, but it should be a simple matter of creating a Var type which can take one of those 4 types, or creating a general type which has a field to specify its type. We can talk about the best way to approach this. 

I have also not exhaustively tested the parser for validity. The indentation system in particular may have issues I have not discovered so far. The tester should try and come up with a systematic way of testig these things. Otherwise, everything looks good.

### What currently works?

Right now, I have patched together an interpreter written in OCaml, which can handle variable assignment, if/else statements, while loops, and functions. Basically every statement returns a value, so you may see some weird results, but in those respects it should work exactly like Python. You have to use tabs, since I haven't thought about the logic for doing tabs/whitespace. There are no classes, no lists, and no types besides floats.

### Some helpful utilities

The pattern list under tokenizer must fully reflect the list in the Scanner.mll. If you update the lexer, you can generate part of the revised list using the following awk script:

```awk
cat /.../.../Coral/scanner.mll | gawk '{ match($0, /{\s+([A-Z]+)\s+}/, arr); if(arr[1] != "" && arr[1] != "EOL") printf "  | %s { [%s] }\n", arr[1], arr[1] }'
```

You may need to install gawk first using brew. This isn't the whole list, so make sure to compare the existing list against the new one. In particular, the end is different. You can also update the print function in coral.ml in the same way, using

```awk
cat /.../.../Coral/scanner.mll | gawk '{ match($0, /{\s+([A-Z]+)\s+}/, arr); if(arr[1] != "" && arr[1] != "EOL") printf "  | Parser.%s -> \”%s\”\n", arr[1], arr[1] }'
```

## Installing LLVM

On MacOS, you can simply run

```
brew install llvm
opam depext conf-llvm.6.0.0
opam install llvm
```

and then add ```/usr/local/opt/llvm@6/bin``` to your ```~/.bash_profile```, i.e. with ```export PATH=/usr/local/opt/llvm@6/bin:$PATH```.

You should now be able to run MicroC as well as the LLVM functions like llc and lli.

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


## Parser Examples

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
