def dynamic():
	if True:
		return 3
	else:
		return "hello"

x = dynamic()

def foo(y):
	return y + 5

foo(x)
