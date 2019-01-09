def reverse(x : str) -> str:
    out = ""
    for i in x:
        out = i + out
    return out

print(reverse("hello"))
