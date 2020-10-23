#!/bin/bash

cd /tmp

echo "Install Python"
apt-get update
apt-get -y upgrade

apt-get install -y make gcc g++

apt-get install -y software-properties-common

apt-get update
apt-get install -y python3.6
