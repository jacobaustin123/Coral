#def id(a,b):
#    return a
#
#def call(f):
#    k=666
#    v=1
#    z=k+v
#    return z
##result = call(id)
##print(result)
#
#
#

def one_please():
	return 1

print(one_please())


def call_it(f):
	return f()

print(call_it(one_please))


def sum(a,b):
	return a+b

print(sum(1,2)*2)

def cond(a):
	if a>0:
		print(a)
	else:
		print(-1)
	return 0


cond(10)
cond(-10)

def gcd(a,b):
	while a != b:
		if a<b:
			b = b-a
		else:
			a = a-b
	return a

print(gcd(1234342213,334232))
print(gcd(10,2))


#def call_it_args(f,aa,bb):
#    return f(aa,bb)
#
#print(call_it(one_please))
#
#
#def sum(a,b):
#    return a+b
#
#z = sum(10,5)
#print(z+2)






#result = call_it_args(sum,call_it(one_please),call_it(one_please))
#result = call_it_args(sum,call_it(one_please),call_it(one_please))
#print(result)
#print(call_it_args(sum,1,1))








