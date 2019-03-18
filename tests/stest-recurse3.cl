def foo(x):
    def bar(x):
        if x < 1:
            return x

        return foo(x / 2)

def foo(x):
    if x < 0:
        return x

    else:
        return foo(x / 2)
