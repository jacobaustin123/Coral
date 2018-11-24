def foo(x):
	def bar(y):
		return y
	return bar

y = foo(3)
y(4)
