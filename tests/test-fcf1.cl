def foo():
    if x == 3:
	def bar(x):
            return 3
        return bar
    else:
	def baz(x):
	    return 4.0
	return baz

x = 3

y = foo()
print(y(5))

x = 4

y = foo()
print(y(5))
