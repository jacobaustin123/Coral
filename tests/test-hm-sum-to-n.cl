# Test: Sum from 1 to n should infer int -> int
# The recursive call should propagate the int type

def sum_to_n(n):
    if n <= 0:
        return 0
    else:
        return n + sum_to_n(n - 1)

# Should print: int
type(sum_to_n(10))
print(sum_to_n(10))
