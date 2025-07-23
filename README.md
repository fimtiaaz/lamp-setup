

This sets up a complete LAMP (Linux, Apache, MariaDB, PHP) environment on a CentOS 7 virtual machine. It's ideal for running PHP-based web applications in a local or lab setup.

---

## Prerequisites

- CentOS 7 Virtual Machine (Minimal Install)
- Bridged network with working internet
- YUM configured to use `vault.centos.org`
- Guest Additions installed (for folder sharing, if needed)
- Root or sudo privileges

---

## Project Structure

centos7-lamp-setup/
├── README.md
└── scripts/
├── 01-static-dns.sh
├── 02-install-apache.sh
├── 03-install-mariadb.sh
├── 04-install-php.sh
└── 05-verify-lamp.sh

---

## Setup Instructions

### 1. Configure Static DNS (Optional)

Run:

```bash
sudo bash scripts/01-static-dns.sh
This sets Google and Cloudflare DNS resolvers:

Edits /etc/sysconfig/network-scripts/ifcfg-enp0s3

Updates /etc/resolv.conf

Locks DNS config using chattr +i /etc/resolv.conf

### 2. Install Apache HTTP Server
Run:

sudo bash scripts/02-install-apache.sh

What it does:

Installs httpd

Enables and starts the Apache service

Opens HTTP (port 80) in the firewall

### 3. Install MariaDB (MySQL)
Run:

sudo bash scripts/03-install-mariadb.sh

Then manually run the secure setup:

sudo mysql_secure_installation

Recommended responses:

Set root password: Y

Remove anonymous users: N

Disallow root login remotely: N

Remove test database: N

Reload privileges: N

### 4. Install PHP
Run:

sudo bash scripts/04-install-php.sh

This installs:

PHP

php-mysql (for MariaDB connectivity)

Then restarts Apache to load PHP support

###5. Verify LAMP Setup
Run:

sudo bash scripts/05-verify-lamp.sh

Creates the PHP test file:
<?php phpinfo(); ?>

Accessible at:
http://192.168.8.171/info.php

If the PHP page loads, your LAMP stack is working!

