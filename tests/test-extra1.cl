def a():
    def b():
        def c(x):
            return x
	return c
    return b

print(a()()(3)) # 3
