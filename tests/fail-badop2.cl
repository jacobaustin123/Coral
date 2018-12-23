def dynamic():
	if x == 3:
		return 3
	else:
		return 4.0

x = 3
z = dynamic()

y = z + 3
print(y)

x = 4
z = dynamic()

y = z + 3
print(y)
