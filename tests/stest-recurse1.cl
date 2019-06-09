def foo(n):
    if n <= 1:
	return n
    else:
        return foo(n - 1) + foo(n - 2) 

type(foo(3))

