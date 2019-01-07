x = 3

def foo(x):
  x = 3
  print(x)
  def bar(x):
    return x
  return x

print(foo(4))

def bar(x):
    return x

print(bar(3))
