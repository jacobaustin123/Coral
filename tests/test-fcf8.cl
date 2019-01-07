x = [1,2,3,4,5,6,7,8,9,10]

def map(fun,lst,length):
	for i in range(length):
		lst[i] = fun(lst[i])
	return lst

def square(a):
	return a*a

map(square,x,10)
print(x)
# prints [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, ]

