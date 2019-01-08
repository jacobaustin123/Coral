def gcd(a : int, b : int):
    while a != b: 
        if a > b: 
            a = a - b
        else: 
            b = b - a
    return a

def dynamic(): 
    if x > 50:
        return x
    else: 
        return 4.0

x = 51
a = dynamic()

x = 1552323251232
b = dynamic()

print(gcd(a, b))
