def gcd(a, b):
    while a != b: 
	if a > b: 
	    a = a - b
	else: 
            b = b - a
    return a

y = gcd(100253, 135053)
type(y)
