#!/bin/bash

sudo su

yum update -y

yum install epel-release -y

yum install ansible -y

yum install python-pip -y

pip install --upgrade pip

python -m pip --version

pip install ansible[azure]

rpm --import https://packages.microsoft.com/keys/microsoft.asc

sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'

yum install gcc gcc-c++ -y

yum install python-devel -y

yum install azure-cli -y

yum update azure-cli -y

yes | pip uninstall pyOpenSSL cryptography

pip install pyOpenSSL cryptography

pip install azure

mkdir ~/.azure

mv sync/.credentials ~/.azure/credentials
