def foo(x, y):
	x = 3.0
	return x + y

type(foo("hi", 4.0)) # float

def bar(x : list):
	acc = 0
	for i : int in x:
		acc += i
	return acc

type(bar([1, 2, 3, 4])) # int

def gcd(a : int, b : int) -> int:
	while a != b: 
		if a > b:
			a = a - b
		else: 
			b = b - a
	return a

type(gcd(534, 2534)) # int


def gcd(a, b):
	while a != b: 
		if a > b:
			a = a - b
		else: 
			b = b - a
	return a

type(gcd(534, 2534)) # int
type(gcd(534.0, 2534.0)) # float
