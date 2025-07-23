#!/bin/bash

sudo yum install mariadb-server mariadb -y
sudo systemctl enable mariadb
sudo systemctl start mariadb

echo "MariaDB installed and started."
echo "Now run 'sudo mysql_secure_installation' manually to complete DB hardening."

