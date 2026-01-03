# Test: GCD recursive version should infer (int, int) -> int
# Currently fails to infer return type due to recursive call

def gcd(a, b):
    if b == 0:
        return a
    else:
        return gcd(b, a - (a / b) * b)

# Should print: int
type(gcd(48, 18))
print(gcd(48, 18))
