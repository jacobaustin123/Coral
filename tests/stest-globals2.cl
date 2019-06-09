x : int = 3

def foo():
    a = x
    x = "hello"
    return a

type(foo())

x : str = "hello"

type(foo())
