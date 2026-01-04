# Test: Triple multiplication in recursive calls
# Should infer int -> int

def triple(n):
    if n <= 0:
        return 1
    else:
        return 3 * triple(n - 1)

type(triple(4))
print(triple(4))
