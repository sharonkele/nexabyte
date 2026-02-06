#!/bin/bash
FILE_NAME=index.html
USER=
sudo apt update
sudo apt install nginx
sudo amazon-linux-extras install nginx1 -y 
sudo systemctl enable nginx
sudo systemctl start nginx
sudo mkdir -p /var/www/nexabyte
sudo chown -R $USER:$USER /var/www/nexabyte
sudo chmod -R 755 /var/www/nexabyte
cd nexabyte
cat <<EOF > /var/www/nexabyte/$FILE_NAME

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Hello, Nginx!</title>
</head>
<body>
    <h1>Hello, Nginx!</h1>
    <p>
We’re Your First Contact for All Your Technological Requirements: 
Are you having any problems with your computer? Then you have come to the right place. NexaByte have supported our customers with their laptops, mobile phones and desktop computers over 10 years (see our testimonial page). 
We can work with you to design, create and maintain all your systems. Our goal is to help you get the most economical option for the services you need. 
Our departments are structured to support your business with uptime. NexaByte ensures the reliability of IT services across your organisation. We aim to design, maximise and consult on the use of a wide range of operating systems and networks, both for you and to maintain a high quality of services for your customers. 
We can install, configure, and secure the following operating systems: 
<guest VM OS you installed>Hostname:</guest VM OS you installed> 
Our dedicated team support starts with contacting our in-house specialist: 
Sharon Oodzi:
Your Student Record Number:
Last updated: <remove>Deadline for this assignment:</remove></p>
</body>
</html>


EOF

