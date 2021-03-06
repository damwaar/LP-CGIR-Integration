#!/bin/bash

# Damien Arnoux
# LP-CGIR : Projet d'intégration

# Installation des fichiers de configuration de Bind9

if [ ! -e /usr/sbin/named ]; then
	echo "BIND9 is not installed."
	echo "=> 'apt-get install bind9' to fix."
	echo "exiting..."
	exit 1
fi

if [ ! -d "/var/bind" ]; then
	echo "creating directory /var/bind"
	mkdir /var/bind 2> /dev/null
	chown bind:bind /var/bind 2> /dev/null
	chmod 700 /var/bind 2> /dev/null
fi

# copie des fichiers de configuration et déclaration
cp --interactive named.conf /etc/bind/
cp --interactive named.conf.local /etc/bind/
cp --interactive named.conf.options /etc/bind/

#copie des fichiers de zone
FILE="pain-jacques.fr" ; cp --interactive $FILE /var/bind/ && chown bind:bind /var/bind/$FILE
FILE="pain-jacques.fr.140.rev" ; cp --interactive $FILE /var/bind/ && chown bind:bind /var/bind/$FILE

if [ $? ]; then
	service bind9 restart
fi

exit 0
