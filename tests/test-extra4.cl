def apply_n(f,a,n):
	for i in range(n):
		a = f(a)
	return a

def double(a):
	return a*2

print(apply_n(double,10,4))
