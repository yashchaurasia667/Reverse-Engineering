#!/bin/sh

echo "Starting script"

#requirements
if !(command -v git >/dev/null 2>&1); then
  sudo apt update
  sudo apt install git python3
fi

#radare2
if !(command -v r2 >/dev/null 2>&1); then
  echo "Installing radare2"
  git clone https://github.com/radareorg/radare2 /tmp/radare2
  /tmp/radare2/sys/install.sh
  echo 
  echo "radare2 installed"
fi

#gdb setup
if !(command -v gdb >/dev/null 2>&1); then
  sudo apt install gcc gdb
fi

if !(command -v gdb-pwndbg >/dev/null 2>&1); then
  git clone https://github.com/apogiatzis/gdb-peda-pwndbg-gef /tmp/gdb_tools
  /tmp/gdb_tools/install.sh
fi

