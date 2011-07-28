#!/bin/bash

shopt -s extglob
cd /var/www/htdocs/joomla.terst.org
sudo rm -rf !(Joomla1.6-MultiDB-GA.zip)
unzip Joomla1.6-MultiDB-GA.zip >/dev/null
touch configuration.php
sudo chgrp -R www-data .
chmod g+w configuration.php tmp components modules plugins logs cache administrator/{components,modules}

echo "Run the web installer, then press Enter"
read KEY

chmod g-w configuration.php
rm -rf installation/

