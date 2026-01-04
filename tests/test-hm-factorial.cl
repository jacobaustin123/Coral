# Test: Factorial function should infer int -> int
# Currently infers: dyn because recursive call returns dyn
# Expected after HM: int

def factorial(n):
    if n <= 1:
        return 1
    else:
        return n * factorial(n - 1)

# Should print: int (not dyn)
type(factorial(5))
print(factorial(5))
