#!/bin/bash

sudo apt-get -y update
sudo apt-get -y install nginx
echo 'Hello World - You got it, you just finish your Terraform lab01' | sudo tee /var/www/html/index.html
sudo service nginx start