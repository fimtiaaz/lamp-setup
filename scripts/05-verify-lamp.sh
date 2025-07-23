#!/bin/bash

# Create PHP info file
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

echo "PHP info page created at http://192.168.8.171/info.php"

