#!/bin/bash

# Set static DNS in ifcfg file
echo "DNS1=8.8.8.8" | sudo tee -a /etc/sysconfig/network-scripts/ifcfg-enp0s3
echo "DNS2=1.1.1.1" | sudo tee -a /etc/sysconfig/network-scripts/ifcfg-enp0s3
echo "PEERDNS=no"  | sudo tee -a /etc/sysconfig/network-scripts/ifcfg-enp0s3

# Set static resolvers
sudo bash -c 'cat > /etc/resolv.conf <<EOF
nameserver 8.8.8.8
nameserver 1.1.1.1
EOF'

# Lock resolv.conf
sudo chattr +i /etc/resolv.conf

echo "Static DNS configured and resolv.conf locked."

