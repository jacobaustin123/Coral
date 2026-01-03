# Test: Fibonacci function should infer int -> int
# Currently infers: dyn because recursive calls return dyn
# Expected after HM: int (since base case returns int and + on ints returns int)

def fib(n):
    if n <= 1:
        return n
    else:
        return fib(n - 1) + fib(n - 2)

# Should print: int (not dyn)
type(fib(10))
print(fib(10))
