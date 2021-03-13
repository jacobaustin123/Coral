# Benchmarks

This file contains benchmarks and results for Coral. These benchmarks are not intended
to be exhaustive, but simply indicative of some advantages of Coral over Python or C.

All benchmarks were performed on a 2015 Macbook Pro running Mac OS Catalina on a 2.7 GHz
Dual-Core Intel Core i5 with 8GB of RAM.

## GCD Benchmark

Here we attempt to compute the gcd of two numbers in C, Python, and Coral.

### Source Code

The C source code is as follows:

```c
#include <stdio.h>

long gcd(long a, long b) {
  while (a != b) {
    if (a > b) {
      a = a - b;
    } else {
      b = b - a;
    }
  }

  return a;
}

int main(int argc, char ** argv) {
  long a = 90;
  long b = 800052312523;
  long result = gcd(a, b);
}
```

The C code will be compiled with `gcc -O1/2/3` or `clang -O1/2/3` for comparison.

The Coral/Python code is as follows:

```python
def gcd(a : int, b : int):
    while a != b:
        if a > b:
            a = a - b
        else:
            b = b - a
    return a

a = 90
b = 800052312523
result = gcd(a, b)
```

Note that we do not need type hints here, since it can be fully type inferred without.

### Results

Our results are as follows:

**Coral:**

Results are from `coral -o gcd -S gcd.py` and then `gcc -O1/2/3 gcd.s` then
`time ./a.out`. This allows us to compare different optimizations using GCC. I also
tested having Coral emit LLVM and compiling that with Clang, which produced similar 
results.

**-O0:**

```
real	0m0.033s
user	0m0.028s
sys	0m0.002s
```

**O1:**

```
real	0m0.033s
user	0m0.028s
sys	0m0.002s
```

**O2:**

```
real	0m0.034s
user	0m0.029s
sys	0m0.002s
```

**O3:**

```
real	0m0.031s
user	0m0.027s
sys	0m0.002s
```

**C:**

Results are from `gcc -O1/2/3 -o gcc gcc.c` and then `time ./gcd`.

**-O0:**

```
real	0m21.061s
user	0m17.938s
sys	0m0.120s
```

**-O1:**

```
real	0m19.983s
user	0m17.693s
sys	0m0.140s
```

**-O2:**

```
real	0m0.004s
user	0m0.001s
sys	0m0.002s
```

**-O3:**

```
real	0m0.004s
user	0m0.001s
sys	0m0.002s
```

**Python:**

Results are from `time python gcd.py`

```
real	13m46.220s
user	12m57.995s
sys	0m3.848s
```