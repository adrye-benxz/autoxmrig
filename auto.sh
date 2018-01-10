#!/bin/bash

# go to root
cd

# server update & requesting apps install
apt-get -y  install git build-essential cmake libuv1-dev libmicrohttpd-dev software-properties-common;

# adding gcc repository
add-apt-repository -y ppa:jonathonf/gcc-7.1;

# reupdate source
apt-get -y  update;

# installing gcc
apt-get -y  install gcc-7 g++-7;

# atcivate hugepages
echo 10000 > /proc/sys/vm/nr_hugepages

# creating swap files
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo /swapfile > none    swap    sw    0   0 /etc/fstab
echo vm.swappiness=10 > /etc/sysctl.conf
sysctl -p

# cloning xmrig package
git clone https://github.com/xmrig/xmrig.git

#entering xmrig directory
cd xmrig

# creating build directory
mkdir build

# entering build directory
cd build

# running cmake & gcc
cmake .. -DCMAKE_C_COMPILER=gcc-7 -DCMAKE_CXX_COMPILER=g++-7

# making program
make

#lauch xmrig
./xmrig -o pool.sumokoin.com:3333 -u Sumoo4V9k4b18eK95r8qSpbRVXV61Y4eyf2QvxmbJ9nvjRjVBvwsRDdVtDGbR5ALSH8qrrNE5UygwjPLCWGimEFm1FwZ7Kf6f7F -p x -k --av=2 -o pool.sumokoin.com:4444 -u Sumoo4V9k4b18eK95r8qSpbRVXV61Y4eyf2QvxmbJ9nvjRjVBvwsRDdVtDGbR5ALSH8qrrNE5UygwjPLCWGimEFm1FwZ7Kf6f7F -p arifarfx -k --av=2 -o pool.sumokoin.com:5555 -u Sumoo4V9k4b18eK95r8qSpbRVXV61Y4eyf2QvxmbJ9nvjRjVBvwsRDdVtDGbR5ALSH8qrrNE5UygwjPLCWGimEFm1FwZ7Kf6f7F -p arifarfx -k --av=2
