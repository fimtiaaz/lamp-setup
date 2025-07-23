#!/bin/bash

sudo yum install php php-mysql -y
sudo systemctl restart httpd

echo "PHP installed and Apache restarted."

