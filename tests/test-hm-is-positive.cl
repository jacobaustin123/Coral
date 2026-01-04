# Test: Recursive check that eventually returns bool
# Should infer int -> bool

def all_positive(n):
    if n <= 0:
        return n == 0
    else:
        return all_positive(n - 1)

type(all_positive(5))
print(all_positive(5))
