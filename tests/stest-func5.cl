def foo():
	def bar(x):
		return x
	return bar

type(foo()(3))
