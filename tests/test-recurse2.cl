def foo(x):
    if x <= 0:
        return x

    else:
        return bar(x - 1)

def bar(x):
    if x <= 0:
        return x

    else:
        return foo(x - 1)

print(foo(50))
