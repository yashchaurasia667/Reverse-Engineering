global _start

section .text:

_start:
  mov eax, 0x4                    ; using the write syscall
  mov ebx, 1                      ; using stdout as the fd
  mov ecx, message                ; use the message as the buffer
  mov edx, message_length         ; supply the message length
  int 0x80                        ; invoke the syscall

  mov eax, 0x1
  mov ebx, 0x0
  int 0x80


section .data:
  message: db "Hello, world!", 0xA
  message_length equ $-message
