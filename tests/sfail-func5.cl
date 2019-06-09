def foo(y):
    return bez(y)

def bez(x):
    return x + y

def bar(y):
    foo(y)

bar(3)
