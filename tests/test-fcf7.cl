def foo():
    def bar():
	return 4
    return bar

a = foo()
b = a()
print(b)

