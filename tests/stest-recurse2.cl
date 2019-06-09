def foo(x):
    def bar(x):
	if x == 0:
            return x
	else:
	    return bar(x - 1)

    return bar(x)

type(foo(5))
