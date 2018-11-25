def foo(a, b):
	return a

def call(f):
	k = 66
	z = f(k, 1)
	return z

result = call(foo)
type(result)

