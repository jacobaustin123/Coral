def foo():
	if x == 3:
		def bar(x):
			return 3

		return bar

	else:
		return 5.0

def dyn():
	if x == 3:
		return 3.0

	else:
		return 4.0

x = 3

y = foo()
z = dyn()

print(y(z))

x = 4

y = foo()

print(y)
