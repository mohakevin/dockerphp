#! /bin/bash

if [ -z "$descarga" ]
then
	echo "Salgo, no URL"
	exit 2
else
	cd /var/www && wget --no-check-certificate -O descarga.tar.gz $descarga 
	tar -xzvf descarga.tar.gz
	cd /etc/apache2/ && apachectl -d . -f ./apache2.conf -e info -DFOREGROUND
fi
