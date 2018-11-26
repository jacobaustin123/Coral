def concat(a, b):
	return a + b

a = ""
for i in [1, 2, 3]:
	a = concat(a, a * i)

type(a)