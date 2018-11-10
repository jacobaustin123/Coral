def bar():
	def foo(y):
		return y
	
	return foo

x = bar()
x()
