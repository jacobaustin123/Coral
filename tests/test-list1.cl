x = [1, 2, 3]

def foo():
	x[1] = 4
	y = x[1] + 3
	return y
	
print(foo())
