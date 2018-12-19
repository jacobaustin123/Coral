l = [12.4, 37.6, 46.5, 1]

print(1) # should get to here

a: float = l[1]
b = l[3]
print(a)
print(b)

c = l[7]

print(2) # shouldn't get to here

d = l[12]

print(2) # shouldn't get to here

