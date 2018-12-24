def sum(a, b):
	return a + b

def one():
	return 1

def do_wild_things(f, a, b):
	return (f(a, b) + f(a, b)) * f(a, b)

z = do_wild_things(sum, 2 * one(), 4)

print(z)
