#! /bin/bash

apt-get update && apt-get -y dist-upgrade && apt-get -y install \
	nginx-light wget aspell-ru sqlite3 unzip curl git \
	php5-fpm php5-cli php5-pspell php5-ldap php5-gd \
	php5-xmlrpc php5-sqlite php5-apcu php5-curl

echo "apc.rfc1867 = 1" >> /etc/php5/mods-available/apcu.ini

cd /tmp
wget https://github.com/roundcube/roundcubemail/releases/download/1.3.0/roundcubemail-1.3.0-complete.tar.gz
wget https://github.com/Anisotropic/Chameleon-blue/archive/master.zip
tar zxvf roundcubemail-1.3.0-complete.tar.gz
unzip master.zip
mkdir -p /var/www/{html,db,logs,temp}
touch /var/www/logs/errors
mv /tmp/roundcubemail-1.3.0/* /var/www/html/
rm -rf /var/www/html/installer

sqlite3 -init /var/www/html/SQL/sqlite.initial.sql /var/www/db/sqlite.db .exit

cp /srv/roundcube/config.inc.php /var/www/html/config/
cp /srv/roundcube/composer.json /var/www/html/
cp /srv/roundcube/default /etc/nginx/sites-available/

mv /tmp/Chameleon-blue-master/skins/chameleon-blue /var/www/html/skins/
rm -rf /tmp/roundcubemail-1.3.0* /tmp/master.zip /tmp/Chameleon-blue-master
apt-get clean

chown -R www-data:www-data /var/www

service php5-fpm restart

usermod -s /bin/bash www-data
sudo -iu www-data sh -c "cd /var/www/html; curl -s https://getcomposer.org/installer | php"
sudo -iu www-data sh -c "cd /var/www/html; php composer.phar -n update --no-dev"
echo "Composer done"
usermod -s /usr/sbin/nologin www-data

service php5-fpm restart && echo "PHP started" && nginx -g 'daemon off;'
