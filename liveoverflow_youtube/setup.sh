#!/bin/sh

# enable core dumps
echo "enabling core dumps..."
echo "/tmp/core.%e.%p" | sudo tee /proc/sys/kernel/core_pattern
ulimit -S -c unlimited

# disable aslr
echo "disabling ASLR..."
echo 0 | sudo tee /proc/sys/kernel/randomize_va_space

