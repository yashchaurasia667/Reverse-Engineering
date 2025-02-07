import random

def check_key(key):
    char_sum = 0
    for c in key:
        char_sum += ord(c)
    
#    print(f"key={key}, sum={char_sum}")
    return char_sum

key = ""
while True:
    key+= random.choice("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-_")
    s = check_key(key)
    if(s > 916):
        key=""
    elif(s == 916):
        print(f"key found: {key}")

