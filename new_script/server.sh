#!/bin/bash
sudo dnf update && \
     sudo dnf install -y git nodejs 
sudo dnf install -y https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox-0.12.6.1-2.almalinux9.x86_64.rpm
sudo git clone  https://github.com/ashishworkspace/AquilaCMS-CICD.git
sudo npm i -g yarn 
sudo bash -c 'cd AquilaCMS-CICD &&\
              yarn install &&\
              cp ecosystem.config.example.js ecosystem.config.js &&\
              npm run start:pm2'

