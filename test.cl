def dynamic():
	x = 3

	if True:
		x = 3.0
	
	return x

def foo():
	return 3

x = 3
x = dynamic()

print(x + 3.0)
