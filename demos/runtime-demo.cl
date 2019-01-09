def dynamic():
    if x == 3:
        return 3
    else:
        return 4.0

def foo(x : float):
    return x

x = 4

print(foo(dynamic()))

x = 3

print(foo(dynamic()))
