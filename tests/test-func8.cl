def foo():
	if x == 3:
		return 3.0

	else:
		return 4

def bar(x):
	return x + 4.0


x = 3

y = foo()
z = bar(y)
print(z)