def reverse(x : list) -> list:
    out = []
    for i in x:
        out = [i] + out
    print(out)
    return out

print(reverse([1, 2, 3]))
