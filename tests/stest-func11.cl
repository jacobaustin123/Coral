def foo(x : list) -> float:
    def bar(x : list) -> int:
	return 3

    type(bar([4, 2])) # int
    
    def bar():
	return 3.0
    
    type(bar()) # float
    
    def bar(x) -> float:
	return 3.0
    
    type(bar("hello")) # float

    type(bar) # func

    bar("hello")
    return 3.0

type(foo([1, 2, 3])) # float

