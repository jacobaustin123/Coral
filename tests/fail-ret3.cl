def foo() -> list:
	x = [1, 2, 3]
	if True:
		x = "hello"
	return x

print(foo())
