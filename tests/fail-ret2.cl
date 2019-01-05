def foo() -> str:
	x = [1, 2, 3]
	if False:
		x = "hello"
	return x

print(foo())
