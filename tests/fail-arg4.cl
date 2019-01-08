if True:
    def foo(x : int):
        return x

def dynamic():
    if x == 3:
        return 3.0
    else:
        return 4

x = 4
print(foo(dynamic()))

x = 3
print(foo(dynamic()))
