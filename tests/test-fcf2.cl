def foo():
	if x == 3:
		def bar(x):
			return 3

		return bar

	else:
		def baz(x):
			return 4.0

		return baz

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
z = dyn()

print(y(z))
