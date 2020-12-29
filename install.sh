#!/bin/bash

cd /tmp

echo "Install Python"
apt-get update
apt-get -y upgrade

apt-get install -y make gcc g++ wget sudo zsh unzip

apt-get install -y software-properties-common

# apt-get update
# apt-get install -y python3.6

echo "Install terraform"
VERSION=0.14.3
DOWNLOAD_URL=https://releases.hashicorp.com/terraform/$VERSION/terraform_${VERSION}_linux_amd64.zip

cd /tmp
wget $DOWNLOAD_URL
unzip terraform_${VERSION}_linux_amd64.zip
mv terraform /usr/bin/terraform

echo "Install tflint"
wget https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh && bash install_linux.sh


echo "Install kubectl" 
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl



echo "Install php"
apt-get install -y php
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"