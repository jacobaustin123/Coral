def dynamic():
	if True:
		return 3
	else:
		return 4.0

def foo(x : float):
	return x

print(foo(dynamic()))

#def foo():
#	x : int  = dynamic()
#	return x
#
#print(foo())
