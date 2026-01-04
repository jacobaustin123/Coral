# Test: Recursive call used as argument to another call
# Should infer int -> int

def nested(n):
    if n <= 1:
        return n
    else:
        return nested(nested(n - 1))

type(nested(5))
print(nested(5))
