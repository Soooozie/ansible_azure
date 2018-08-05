#!/bin/bash

sudo su

yum update -y

yum install epel-release -y

yum install ansible -y

yum install python-pip -y

yum install cowsay -y

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

pip install "pywinrm>=0.3.0"

pip install msrestazure --upgrade

#if you want to use dynamic inventory files
pip install logging 

#If you want to use credssp
pip install pywinrm[credssp]

#If you want to use kerberos
yum -y install python-devel krb5-devel krb5-libs krb5-workstation

pip install pywinrm[kerberos]

mv sync/krb5.conf /etc/krb5.conf

#################################

#generate certificate for winrm
USERNAME="vagrant"

cat > openssl.conf << EOL
distinguished_name = req_distinguished_name
[req_distinguished_name]
[v3_req_client]
extendedKeyUsage = clientAuth
subjectAltName = otherName:1.3.6.1.4.1.311.20.2.3;UTF8:$USERNAME@localhost
EOL

export OPENSSL_CONF=openssl.conf
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -out cert.pem -outform PEM -keyout cert_key.pem -subj "/CN=$USERNAME" -extensions v3_req_client
rm openssl.conf
