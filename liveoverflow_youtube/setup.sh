#!/bin/sh

{
echo "# enable core dumps"
echo "echo '/tmp/core.%e.%p' | sudo tee /proc/sys/kernel/core_pattern"
echo "ulimit -S -c unlimited"

echo "# disable aslr"
echo "echo 0 | sudo tee /proc/sys/kernel/randomize_va_space"
} | sudo tee /opt/reve.sh > /dev/null

sudo chmod +x /opt/reve.sh

{
echo "[Unit]"
echo "Description=Reverse Engineering setup"
echo "[Service]"
echo "ExecStart=/opt/reve.sh"
echo "Restart=always"
echo "[Install]"
echo "WantedBy=multi-user.target"
} | sudo tee /etc/systemd/system/revEng.service > /dev/null

sudo systemctl enable revEng.service
sudo systemctl start revEng.service
