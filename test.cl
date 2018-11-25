def foo():
	def bar():
		return 5
	
	return bar

a = foo()
b = a()
