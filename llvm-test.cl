def gcd(a,b):
	while a != b:
		if a>b:
			a = a-b
		else:
			b = b-a
	return a

print(gcd(1234342213,334232))


if True:
	x=23.4
else:
	x=5
print(x)







