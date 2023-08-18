#!/bin/sh

PHP_FPM_USER="${PHP_FPM_USER:-wodby}"
PHP_FPM_GROUP="${PHP_FPM_GROUP:-wodby}"
echo "Set Drupal root owner to $PHP_FPM_USER:$PHP_FPM_GROUP"
sudo find . ! -user "$PHP_FPM_USER" -exec chown "$PHP_FPM_USER":"$PHP_FPM_GROUP" {} \;
echo "Set public files permissions"
sudo find docroot/sites/*/files ! -user "$PHP_FPM_USER" -exec chown "$PHP_FPM_USER":"$PHP_FPM_GROUP" {} \;
sudo find docroot/sites/* -type d -exec chmod 0755 {} \;
sudo find docroot/sites/*/files -type f -exec chmod 0644 {} \;
echo "Set private files permissions"
sudo find files-private ! -user "$PHP_FPM_USER" -exec chown "$PHP_FPM_USER":"$PHP_FPM_GROUP" {} \;
sudo find files-private -type d -exec chmod 0755 {} \;
sudo find files-private -type f -exec chmod 0644 {} \;
