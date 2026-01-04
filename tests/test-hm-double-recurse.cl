# Test: Function that makes two recursive calls with different args
# Should infer int -> int

def double_recurse(n):
    if n <= 0:
        return 1
    else:
        return double_recurse(n - 1) + double_recurse(n - 2)

type(double_recurse(5))
print(double_recurse(5))
