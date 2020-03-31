<div align="center"><img src="https://i.ibb.co/y5rZ1ft/coral3.png" width="75%"><br><br></div>

The **Coral** programming language: a blazingly-fast, gradually typed Python-like language/compiler with powerful optional typing for improved safety and performance. Coral performs type inference on optionally typed Python code and seamlessly optimizes type-inferred objects to be nearly as efficient as equivalent C-code, orders of magnitude faster than Python. Coral also enforces types at compile and runtime, catching errors where possible before code is run, and otherwise throwing errors at runtime.

# Table of Contents
* [Examples](#examples)
* [Installation](#installation)
* [Goals](#goals)
* [Using the Coral Compiler and Interpreter](#using-the-coral-compiler-and-interpreter)
* [Adding Type Annotations](#adding-type-annotations)
* [Exceptions](#exceptions)
* [Differences from Python](#differences-from-python)

# Examples

Coral is syntactically identical to a subset of Python, so any valid Coral program is also a valid Python program. This code snippet is a simple gcd program using some optional explicit typing. This program runs correctly in Python, but takes ten minutes to run. When compiled to machine code using the Coral compiler, it takes less than a second - nearly as fast as C code.

```python
def gcd(a, b):
    while a != b:
        if a > b:
            a = a - b
        else:
            b = b - a
    return a

def add(a : int, b : int) -> int:
    return a + b

x = add(50, 40)
y = 100052312523
print(gcd(x, y))
```

Coral supports Python 3.7 style type annotations, as seen in the add function here. These type annotations are not just cosmetic - they allow the compiler to further type-infer ambiguous code segments and perform additional optimization and compile-time error checking.

# Installation

The Coral GitHub page provides installers for MacOS and several Linux distributions. **These installers can be found on the [Releases page](https://github.com/jacobaustin123/Coral/releases)**. These require that clang be installed.

To build the language from the source, **you must have OCaml 4.07.\*, ocaml-llvm, and clang already installed**. To build Coral from the source with OCaml, ocaml-llvm, and gcc/clang already installed, run:

```bash
> git clone https://github.com/jacobaustin123/Coral.git
> cd Coral
> make
```

This will generate an executable called coral which acts as a compiler and interpreter for our language. If OCaml and ocaml-llvm are not already installed, you should install them. On Mac OS, run:

```bash
> brew install opam llvm
> opam init
> opam switch create 4.07.1
> opam install llvm ocamlbuild ocamlfind core
```

If the above fails, you may need to run `eval $(opam env)` after opam init and opam switch. The following may also be useful instead:

```bash
> brew install opam llvm
> opam depext conf-llvm.6.0.0
> opam install llvm
> export PATH=/usr/local/opt/llvm@6/bin:$PATH
```

On Linux, follow the OCaml/Opam installation instructions [here](https://opam.ocaml.org/doc/Install.html) for your distribution, install llvm following instructions [here](https://apt.llvm.org/), and then run

```
> opam install llvm ocamlbuild ocamlfind
```

You may need to add the llvm path (on Mac usually /usr/local/opt/llvm@6/bin:$PATH) to your PATH variable using bashrc.

# Goals

### Familiarity

Coral's syntax is identical to Python's, with all its usual convenience. Python programmers can simply copy their code into the Coral compiler, and they can add type annotations which can be used to help performance and improve safety. Python is already an easy-to-learn language, and Coral adds no additional difficult to the learning curve. Coral also imposes no further restriction on the kinds of functions which can be run.

### Type Safety

Coral provides type safety where desired. Type specifiers on variables and functions enforce correct usage in large code bases. Sometimes it is helpful to have more flexibility with what kinds of types a variable can take or what kinds of arguments can be passed to it. Coral allows that. But if you have a large code-base with functions or arguments of known type, it can be helpful to explicitly declare those types and have them guaranteed by the compiler and runtime environment. Coral provides that too. Coral generally strives to catch as many type errors as possible at compile time, but will fall back to runtime checks where needed.

### Code Optimization

Because of Coral's type inference system and assisted by type annotations, Coral is able to compile code to far more efficient machine code that Python. Even without type-hints, Coral can often optimize code to be nearly as fast as equivalent C code, and type hints can allow it to overcome ambiguities in type-inference that would otherwise prevent Coral from optimizing fully. This natural interplay between typed code and optimization is at the heart of the Coral language.

### Seamless Interplay between Typed and Untyped Code

The core philosophy of Coral is that you don’t pay a penalty if you don’t type your code, and typed functions can be called with untyped arguments and vice versa. This preserves all the convenience of Python, while giving the programmer the freedom to be more explicit where desired.

# Using the Coral Compiler and Interpreter

Once Coral has been compiled, you can begin writing your own Coral programs. Use the Language Reference Manual to learn syntax as well as the limitations of the Coral language.

The following sample code is an implementation of gcd, a simple program in Coral:

```python
def gcd(a, b):
    while a != b:
        if a < b:
            b = b-a
        else:
            a = a-b
    return a

a = 1234342213
b = 334232
print(gcd(a,b))
```

This code is syntactically identical to Python, and requires no type annotations. To compile using the Coral compiler, save this code to a file called gcd.cl and compile it with

```bash
> coral gcd.cl
```

By default, this will generate the corresponding LLVM IR, compile it to an executable file called a.out, and run it. To change the name of the output file, run

```bash
> coral gcd.cl -o main
```

This will name the file main instead. To generate only the LLVM IR, run Coral with the ```-emit-llvm``` flag. To generate only the assembly code, run Coral with the ```-S``` flag. To only run the semantic checker without compilation, use the ```-no-compile``` flag. To disable runtime error checking for improved performance, using the ```-no-except``` flag.

```bash
> coral gcd.cl -emit-llvm # only produces llvm
> coral gcd.cl -no-compile # only run semantic checker
> coral gcd.cl -no-except # generates machine code with no runtime error handling
> coral gcd.cl -S # only generates assembly code
> coral gcd.cl -d # shows debugging information about the program. can be combined with other flags
```

Coral also has a build-in **interpreter**. To use the interpreter, simply run ```coral``` without a file specified. This will open an interactive window like the OCaml or Python interpreter in which you can run any valid Coral program. The following is an example of gcd code run in the interpreter:

```python
> coral
Welcome to the Coral programming language.
>>> def gcd(a, b)
...     while a != b:
...         if a > b:
...             a = a - b
...         else:
...             b = b - a
...     return a
...
>>> gcd(5,10)
5.
>>>
```

# Adding Type Annotations

There are many cases in Python where types cannot be fully inferred at compile time due to the lack of strong static typing. There are also many cases where a function may be intended to only take a single kind of input or return a single kind of output. Both these cases can be addressed by the inclusion of optional static typing in Coral. These type hints or type annotations follow the Python 3.7 standard, for example:

```python
def foo(x : int, y : int) -> str:
    if x == 3:
        return "hello"
    else:
        return "goodbye"
```

This function can only take integer arguments, and can only return a string. Calling this function with other arguments, like

```python
>>> foo(3.0, 4.0) # called with floating point arguments
STypeError: invalid type assigned to x
```

will result in an error. Likewise, a function like

```python
def foo(x) -> str:
    return x
```

will succeed if called with a string argument, like ```foo("hello")```, but will raise a compile-time error if called with an integer argument, like ```foo(3)```. For example:

```python
>>> def foo() -> int:
...     return "hello"
...
STypeError: invalid return type
```

Sometimes these kinds of errors will only be raised when the function is called, if type inference depends on the types of the arguments or global variables in the function. Coral also supports Python-style lists, and these can be specified in type annotations.

```python
>>> def add(x : list):
...     sum = 0
...     for i in x:
...         sum += i
...     return sum
...
>>> print(add([1, 2, 3]))
6
>>> print(add(4.0))
STypeError: invalid type assigned to x
```

In cases where type inference is not possible (due for example to a conditional branch), these errors will occur at runtime.

```python
>>> def dynamic() -> str:
...    if x == 3:
...        return 3
...    else:
...        return "hello"
...
>>> x = 4
>>> print(dynamic())
hello
>>> x = 3
>>> print(dynamic())
RuntimeError: invalid return type (expected string)
```

Valid type annotations include variable annotations, function argument annotations, and function return type annotations. Variable annotations work the same way:

```python
>>> x : int = 3 # valid
>>> x = "hello"
STypeError: invalid type assigned to x
```

# Optimization

Coral uses a gradual typing system that places type-inferred immutable variables on the stack instead of following Python's dynamic PyObject memory model. This optimization can speed up computational intensive numerical code by many orders of magnitude. For example, the example gcd code above, even without type annotations, runs about 1000x faster in Coral than in Python. You can test this by simply running the same program using both the Python interpreter and Coral compiler. Other highly optimized examples include:

```python
>>> def count(x):
...    sum = 0
...
...    for i in range(x):
...        if i / 20 < 5:
...            sum += i
...
...    return sum
...
>>> print(count(100000000))
4950
```

which runs much faster in Coral than Python. Type annotations make this optimization even more robust. Often types cannot be fully type inferred, but type hints allow more code to be placed on the stack. For example, in this gcd code:

```python
>>> def gcd(a : int, b : int) -> int
...     while a != b:
...         if a > b:
...             a = a - b
...         else:
...             b = b - a
...     return a
...
>>> def dynamic():
...    if x > 50:
...        return x
...    else:
...        return 4.0
...
>>> x = 51
>>> a = dynamic()
>>> x = 1552323251232
>>> b = dynamic()
>>> print(gcd(a, b))
5.
```

Without the type annotations on the gcd function, this code takes about 25 seconds when run by Coral and does not terminate within 5 minutes when run by Python - this is because the Coral compiler cannot determine the type of the object returned by the dynamic function at compile-time. However, when type annotations are added to the gcd function, it finishes in less than a second when compiled and run by Coral.

# Exceptions

Coral has both compile and runtime exceptions for type errors, undefined variables, and out of bounds list access. Coral strives to raise as many of these errors as possible at compile time, using a robust type inference system. For example, the following errors will be caught by the compiler:

**Function Argument Errors:**

```python
>>> def foo(x : int):
...     return x
...
>>> print(foo(3.0))
STypeError: invalid type assigned to x
```

**Function Return Type Errors:**

```python
>>> def foo(x) -> str:
...     return x
...
>>> print(foo(3.0))
STypeError: invalid return type
```

**Variable Assignment Errors:**

```python
>>> def foo():
...     return "hello"
...
>>> x : int = foo()
STypeError: invalid type assigned to x
```

All errors prefixed by an "S" are caught at compile time. Some errors cannot be caught by the compiler, and will only be caught at runtime. Runtime checks are only added to the LLVM IR when the code is not provably correct at compile-time. This saves needless computation at runtime. For example, in this example, the return type of the dynamic function is unknown, so if it ultimately returns a string at runtime, the error will be thrown then.

```python
>>> def dynamic():
...    if x == 3:
...        return 3
...    else:
...        return "hello"
...
>>> x = 3
>>> print(dynamic() * dynamic())
9
>>> x = 4
>>> print(dynamic() * dynamic())
RuntimeError: unsupported operand type(s) for binary *
```

This only occurs in relatively obscure cases like the above, but in all cases type hints are respected and errors due to invalid usage are raised. Coral also performs out-of-bounds checking at runtime for arrays, as in:

```python
>>> x = [1, 2, 3, 4, 5]
>>> print(x[0])
1
>>> print(x[5])
RuntimeError: list index out of bounds
>>> print(x[-1])
RuntimeError: list index out of bounds
```

While it is not recommended, runtime exceptions can be disabled using the ```-no-except``` compiler flag, which will significantly improve performance at the expense of possible segmentation faults or invalid type usage.

# Differences from Python

Coral strives to be syntactically identical to Python, and as close as possible to Python in runtime behavior. There are a few differences in behavior and many limitations, mostly due to the scope of the Coral project. These features could be added at a later date, and we welcome contributions.

### No Closures

Coral does not have closures when returning functions from functions (as first class objects). For example, in Python the following code works as expected:

```python
>>> def foo():
...    x = 3
...    def bar():
...        return x
...    return bar
...
>>> f = foo()
>>> print(f())
3
```

but in Coral this will throw an error warning about an undefined variable, i.e.

```python
>>> print(f())
SNameError: name 'x' is not defined
```

### No Classes

Coral does not have classes, structs, or any kind of object oriented programming model. These could easily be added using the same model as lists, but they have not been so far.

### No Casting

For no particular reason, Coral does not support casting between types. That means there is no int, float, bool, or str keyword to convert between types explicitly. Likewise, you cannot perform arithmetic operations that mix types, as in

```python
x = 3
y = 4.0
print(x + y)
```

This is an important feature, and will hopefully be added soon.

### Unsupported Keywords

Coral does not support several common Python keywords, including:

```python
elif, break, continue, pass, class, global, await, from, as, nonlocal, yield, async, raise, except, finally, is, lambda, try, with
```

These should be implemented, and we again welcome contributions to support these features. The primary limitation is adding support for them in the codegen/LLVM IR generation steps.

# Acknowledgments

This language was developed as a Programming Languages and Translators project in Fall 2018 at Columbia University by Jacob Austin, Matthew Bowers, Sanford Miller, and Rebecca Cawkwell.
