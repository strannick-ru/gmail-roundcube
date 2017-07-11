#! /bin/bash

apt-get update && apt-get -y dist-upgrade && apt-get -y install perdition ca-certificates
sleep 2
/usr/sbin/service perdition stop
/bin/cp /srv/perdition/perdition.conf /etc/perdition/perdition.conf
/bin/cp /srv/perdition/default_perdition /etc/default/perdition
/usr/sbin/service perdition start
echo "Perdition started"