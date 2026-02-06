#!/bin/bash
SCRIPT_NAME=
sudo apt update
sudo apt install nginx
sudo amazon-linux-extras install nginx1 -y 
sudo systemctl enable nginx
sudo systemctl start nginx
cd /var/www
sudo mkdir nexabyte

cd nexabyte
cat <<EOF > /var/www/nexta