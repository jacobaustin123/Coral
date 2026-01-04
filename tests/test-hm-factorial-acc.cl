# Test: Factorial with accumulator - tests multiple params in recursion
# Should infer (int, int) -> int

def fact_acc(n, acc):
    if n <= 1:
        return acc
    else:
        return fact_acc(n - 1, n * acc)

type(fact_acc(5, 1))
print(fact_acc(5, 1))
