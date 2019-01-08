if True:
	def foo():
		return x
else:
	def bar():
		return x + 1

x = 3
print(foo())
print(bar())
