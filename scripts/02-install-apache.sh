#!/bin/bash

sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd

# Open HTTP port
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --reload

echo "Apache installed and started."

