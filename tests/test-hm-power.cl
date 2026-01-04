# Test: Power function should infer (int, int) -> int
# Tests type inference with multiple parameters and recursive call

def power(base, exp):
    if exp == 0:
        return 1
    else:
        return base * power(base, exp - 1)

type(power(2, 10))
print(power(2, 10))
