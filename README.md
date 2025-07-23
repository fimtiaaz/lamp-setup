# CentOS 7 LAMP Stack Setup

This project sets up a LAMP (Linux, Apache, MariaDB, PHP) environment on a CentOS 7 virtual machine using Bash automation scripts. Each step is modularized and easy to follow. Ideal for home lab practice, server provisioning, or learning Linux server management.

---

## Prerequisites

- CentOS 7 Minimal Install VM  
- Bridged network with working internet  
- `yum` repos configured to use `vault.centos.org`  
- Root or sudo privileges  
- Guest Additions installed (for folder sharing, optional)  

---

## Project Structure

```
centos7-lamp-setup/  
├── README.md  
└── scripts/  
    ├── 01-static-dns.sh  
    ├── 02-install-apache.sh  
    ├── 03-install-mariadb.sh  
    ├── 04-install-php.sh  
    └── 05-verify-lamp.sh  
```

---

## Setup Instructions

---

### 1. Configure Static DNS (Optional)

Sets Google and Cloudflare DNS resolvers for your CentOS VM and locks `/etc/resolv.conf` to prevent overrides.

🔧 What it does:
- Edits `/etc/sysconfig/network-scripts/ifcfg-enp0s3`
- Updates `/etc/resolv.conf`
- Locks DNS config using `chattr +i`

**Run:**
```bash
sudo bash scripts/01-static-dns.sh
```

---

### 2. Install Apache HTTP Server

Installs and enables Apache (`httpd`) and opens HTTP (port 80) in the firewall.

What it does:
- Installs `httpd`
- Enables & starts the service
- Opens port 80 in firewalld

**Run:**
```bash
sudo bash scripts/02-install-apache.sh
```

---

### 3. Install MariaDB (MySQL)

Installs the MariaDB database server and walks you through securing it with a guided script.

🔧 What it does:
- Installs `mariadb-server`
- Enables & starts the service

**Run:**
```bash
sudo bash scripts/03-install-mariadb.sh
```

Then run the secure installer:
```bash
sudo mysql_secure_installation
```

Recommended responses:
- Set root password → Y  
- Remove anonymous users → N  
- Disallow root login remotely → N  
- Remove test database → N  
- Reload privilege tables → N  

---

### 4. Install PHP

Installs PHP and the MySQL PHP module, then restarts Apache.

What it does:
- Installs `php` and `php-mysql`
- Restarts Apache

**Run:**
```bash
sudo bash scripts/04-install-php.sh
```

---

### 5. Verify LAMP Setup

Creates a PHP info file to confirm PHP is processed by Apache.

What it does:
- Creates `/var/www/html/info.php`

**Run:**
```bash
sudo bash scripts/05-verify-lamp.sh
```

Then open in browser:  
```
http://<server-ip>/info.php
```

---

## License

MIT © Furqan Imtiaz
