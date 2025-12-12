#! /bin/bash

sudo yum install httpd -y

cd /var/www/html
echo "<html><body><h1>Welcome to the Web Server</h1></body></html>" > index.html
service httpd start
