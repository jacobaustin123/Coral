def one_please():
	return 1

def call_it(f):
	return f()

z = call_it(one_please)
print(z)
