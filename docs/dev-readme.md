# Development History/Details

This document contains details about the implementation of the Coral language/compiler, including descriptions of each of the key files, design choices, build/installation instructions, and guidelines for contributions.

# Overview

Coral is written in the OCaml language, a (mostly) functional programming language similar to ML. OCaml's algebraic types and match statements make constructing an AST for the language and iterating over it during semantic checking and code-generation much more convenient. 

For a good tutorial on the OCaml language, see [the official OCaml tutorial](https://ocaml.org/learn/tutorials/), including especially the "99 Problems".

Coral uses make and ocamlbuild as build systems. Make is the high-level build system, used to build and run tests. See the main Makefile for more details. Ocamlbuild is used to link in the few dependencies that Coral relies on, namely llvm/ocaml-llvm, and the Unix OCaml library. To build the main library, run `make` from the home directory. To run tests, run `make test`. To remove failed tests or other additional files, run `make clean`. To install the latest version of Coral, run `make install`.

Coral compiles Coral/Python code to native executables using LLVM. With certain flags, Coral will emit the
LLVM code or the assembly code as desired. Those flags are:

```bash
> coral gcd.cl -emit-llvm # only produces llvm
> coral gcd.cl -no-compile # only run semantic checker
> coral gcd.cl -no-except # generates machine code with no runtime error handling
> coral gcd.cl -S # only generates assembly code
> coral gcd.cl -d # shows debugging information about the program. can be combined with other flags
```

# Building Coral from the source

## MacOS

To build Coral, you need to have ocaml 4.07.\*, llvm, the ocaml-llvm bindings, ocamlbuild, ocamlfind, and the clang compiler. On Mac, with Homebrew, installing these dependencies is pretty easy. Run

```bash
> brew install opam llvm
> opam init
> eval $(opam env)
> opam switch create 4.07.1
> eval $(opam env)
> opam install llvm ocamlbuild ocamlfind core
> eval $(opam env)
```

This should all succeed without problems. Sometimes we have needed to run `opam depext conf-llvm.6.0.0` if the build process fails with an LLVM error. The above may take a while, since it needs to build OCaml twice from the source. You should be given an option to add some lines to your .bashrc or .bash_profile to avoid having to initialize opam each time. Feel free to open an issue on GitHub if any of the above fail.

Once these have been installed, try navigating to the root of the Coral directory and running `make`. This should create a "coral" executable which can be used as an interpreter or compiler.

# Linux

Linux builds will depend on the distribution. Generally, you will use your distribution's package manager to install opam and llvm, and then install dependencies as for MacOS.

First, follow the OCaml/Opam installation instructions [here](https://opam.ocaml.org/doc/Install.html) for your distribution, install llvm following instructions [here](https://apt.llvm.org/), and then run

```bash
> opam init
> opam switch create 4.07.1
> opam install llvm ocamlbuild ocamlfind core
```

Then try running make. This build process has not been exhaustively tested, but has worked fine in the past. You will also need to install clang if it has not been installed by default. 

# Testing

Coral has a test directory containing a fairly large number of tests that Coral should always pass. Some of these tests begin with stest or sfail, indicating that they test semant only features, excluding code generation. Tests beginning with test or fail test codegen related features. fail tests are expected to produce error messages. All our tests are based on the expected output of running the given test file. These are compared to .out files with the same name by the *testall.sh* script. New tests should be added for each new feature or bug resolved for the Coral compiler.

# Structure

The Coral language/compiler is split up into several source files. Broadly, ast.ml and sast.ml define the
types used in the AST and SAST respectively. These include Stmt and Expr types, and the individual kinds
of expressions and statements supported by Coral. codegen.ml and codegenutils.ml are used for converting 
the SAST to LLVM. Parser.mly defines an OCamlyacc parser. Scanner.mll defines an OCamllex scanner. Semant.ml performs semantic checking on the AST. utilities.ml supports coral.ml and semant.ml. coral.ml
houses the main compiler code, interpreter, and command line parsing.

## Coral.ml

## Scanner.mll

## Parser.mly

## Ast.ml

## Sast.ml

## Semant.ml

## Codegen.ml