# Test: Countdown function with explicit return
# Tests that recursive call type flows back properly

def countdown(n):
    if n <= 0:
        return 0
    else:
        print(n)
        return countdown(n - 1)

type(countdown(5))
