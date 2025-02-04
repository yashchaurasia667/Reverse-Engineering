First compile the asembly into an object file using nasm: 
  nasm -f elf32 -o hello-world.o hello-world.asm

then compile the object file into an executable using ld:
  ld -m elf_i386 -o hello-world hello-world.o
