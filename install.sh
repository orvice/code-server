#!/bin/bash

cd /tmp

echo "Install Python"
apt-get update
apt-get -y upgrade
apt-get install -y software-properties-common  make gcc g++
add-apt-repository ppa:deadsnakes/ppa
apt-get update
apt-get install -y python3.6