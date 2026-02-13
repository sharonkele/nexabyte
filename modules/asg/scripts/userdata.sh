#!/bin/bash
USER=root
sudo yum update
sudo yum install nginx -y
aws s3 cp s3://scripts-so25aco/create_linux_user.sh /home/ec2-user
chmod 777 /home/ec2-user/create_linux_user.sh
sudo mkdir -p /var/www/nexabyte
sudo chown -R $USER:$USER /var/www/nexabyte
sudo chmod -R 755 /var/www/nexabyte
cd nexabyte
aws s3 cp s3://scripts-so25aco/index.html .
sudo systemctl enable nginx
sudo systemctl start nginx

