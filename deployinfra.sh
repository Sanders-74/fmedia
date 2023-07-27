#!/bin/bash

sudo apt install tzdata -y
# Next lines should be uncommented if there will be troubles with datetime data
#timedatectl set-timezone Asia/Omsk
#sudo apt install chrony -y
#sudo systemctl start chronyd
#sudo systemctl enable chronyd
#sudo systemctl status chronyd

useradd -m wpb
adduser wpb docker
adduser wpb sudo
passwd wpb 
cp /etc/hosts /etc/hosts.bak
echo "172.28.0.3 blog.example.com" >> /etc/hosts
su wpb
cd /home/wpb
git clone https://github.com/Sanders-74/fmedia.git ./fmedia 
cd fmedia
cat pdata.dat | docker login --username sanders2022 --password-stdin

sudo cp ./docker/daemon.json /etc/docker/
docker-compose up --build -d

echo "All done"
