#!/bin/bash

sudo apt install tzdata -y
# Next lines should be uncommented if there will be troubles with datetime data
#timedatectl set-timezone Asia/Omsk
#sudo apt install chrony -y
#sudo systemctl start chronyd
#sudo systemctl enable chronyd
#sudo systemctl status chronyd

sudo useradd -m wpb
su wpb
cd /home/wpb
git clone https://github.com/Sanders-74/fmedia.git ./fmedia 
cd fmedia
cat pdata.dat | docker login --username sanders2022 --password-stdin

#docker pull prom/prometheus
sudo cp ./docker/daemon.json /etc/docker/
docker-compose up --build -d

echo "All done"
