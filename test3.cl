def foo():
	if True:
		def bar():
			return x

		return bar
	else:
		def baz():
			return x + 1

		return baz

z = foo()
