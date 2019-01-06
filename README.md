<img src="https://github.com/ja3067/Coral/blob/fcf/docs/coral.png" width="75%">

# Coral

The Coral programming language: a gradually typed, Python-like language with powerful optional typing for improved safety and performance. Coral performs a kind of partial type inference on optionally explicitly typed Python code and seamlessly optimizes type-inferred objects to nearly as efficient as equivalent C-code, orders of magnitude faster than Python. Coral also enforces types at compile and runtime, catching errors where possible before code is run, and otherwise throwing errors at runtime for invalid types.

## Examples

Coral is syntactically identical to Python and any valid Coral program is also a valid Python program. The following is a simple gcd program which compiles to machine code nearly as efficient as equivalent C code.

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

Coral supports Python 3.7 style type annotations which allow it to further 
## Installation

The Coral language is written in OCaml and compiles target programs to LLVM IR. To build the language with OCaml and ocaml-llvm already installed, run:

```bash
> git clone https://github.com/ja3067/Coral.git
> cd Coral
> make
```

This will generate an executable called Coral which acts as a compiler and interpreter for our language. If OCaml and ocaml-llvm are not already installed, you should install them. On Mac OS, run:

```bash
> brew install opam
> brew install llvm
> opam install llvm
```

and on Linux run:

```bash
> sudo apt-get install opam
> sudo apt-get install llvm
> opam install llvm
```
Other Linux distributions can be installed similarly using your distribution's package manager. If the above fails, try instead running the following on Mac OS (or the equivalent on Linux):

```bash
> brew install llvm
> opam depext conf-llvm.6.0.0
> opam install llvm
> export PATH=/usr/local/opt/llvm@6/bin:$PATH
```

To add the llvm installation to your \$PATH variable permanently, you can copy the last line above to your .bashrc or .bash\_profile file.
