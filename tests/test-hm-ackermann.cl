# Test: Ackermann function - deeply nested recursion
# Should infer (int, int) -> int

def ackermann(m, n):
    if m == 0:
        return n + 1
    else:
        if n == 0:
            return ackermann(m - 1, 1)
        else:
            return ackermann(m - 1, ackermann(m, n - 1))

type(ackermann(2, 2))
print(ackermann(2, 2))
