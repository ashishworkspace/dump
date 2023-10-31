#!/bin/bash
sudo dnf update
sudo cat <<EOL | sudo tee /etc/yum.repos.d/mongodb-org-7.0.repo
[mongodb-org-7.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2023/mongodb-org/7.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-7.0.asc
EOL
sudo dnf update &&\
     sudo dnf install -y mongodb-org &&\
     sudo mkdir -p /data/db
sudo systemctl start mongod