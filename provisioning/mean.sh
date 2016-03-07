#!/bin/bash

sudo yum install -y epel-release
sudo yum install -y git

####### Nginx #######
# Install
cat <<EOF > /etc/yum.repos.d/nginx.repo 
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/x86_64/
gpgcheck=0
enabled=1
EOF
sudo yum install nginx
# Start
sudo systemctl start nginx.service
sudo firewall-cmd --permanent --zone=public --add-service=http 
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

####### MongoDB #######
# Install
cat <<EOF > /etc/yum.repos.d/mongodb.repo
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/stable/x86_64/
gpgcheck=0
enabled=1
EOF
sudo mkdir -p /data/db
sudo yum install -y mongodb-org
# Start
sudo systemctl start mongod

####### NodeJS #######
# Install
sudo yum install -y nodejs
sudo yum install -y npm

####### ExpressJS #######
# Install
sudo npm install -g express-generator

