def foo():
	if True:
		def bar(x):
			return 3

		return bar

	else:
		return 3.0

y = foo()
print(y(5))
