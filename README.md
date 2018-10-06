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
