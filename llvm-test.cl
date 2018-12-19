evade_semant = True

print(1) # should get to here

if evade_semant:
	i = 2.2

x: int = i

print(2) # shouldn't get to here

