def gcd(a : int, b : int) -> int:
	while a != b: 
		if a > b:
			a = a - b
		else: 
			b = b - a
	
	return a

