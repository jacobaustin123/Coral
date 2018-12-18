def gcd(a,b):
	while a != b:
		if a>b:
			a = a-b
		else:
			b = b-a
	return a

print(gcd(1234342213,334232))


if True:
	x=23.4+1.0
else:
	x=5

if True:
	y=23.4
else:
	y=5


print(1.+x)
print(x+1.)
print(y)

n=45.
print(x+y*2.+4.+n)






