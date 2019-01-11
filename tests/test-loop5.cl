for i in [1, 2, 3]:
    print(i)
    type(i) # dyn

type(i) # dyn
print(i) # 3

for i in "hello":
    print(i)
    type(i) # str

type(i) # dyn
print(i) # o

for i in range(5):
    print(i)
    type(i) # int

type(i) # dyn
print(i) # 4


