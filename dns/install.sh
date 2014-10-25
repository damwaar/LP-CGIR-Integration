#!/bin/bash

# Damien Arnoux
# LP-CGIR : Projet d'intégration

# Installation des fichiers de configuration de Bind9

if [ ! -e /usr/sbin/named ]; then
	echo "BIND9 n'est pas installé."
	echo "=> apt-get install bind9"
	echo "exiting..."
	exit 1
fi

if [ ! -d "/var/bind" ]; then
	echo "création du répertoire /var/bind"
	mkdir /var/bind 2> /dev/null
	chown bind:bind /var/bind 2> /dev/null
	chmod 700 /var/bind 2> /dev/null
fi

# copie des fichiers de configuration et déclaration
cp --interactive named.conf /etc/bind/ 2> /dev/null
cp --interactive named.conf.local /etc/bind/ 2> /dev/null
cp --interactive named.conf.options /etc/bind/ 2> /dev/null

#copie des fichiers de zone
FILE="pain-jacques.fr" ; cp --interactive $FILE /var/bind/ 2> /dev/null && chown bind:bind /var/bind/$FILE
FILE="pain-jacques.fr.140.rev" ; cp --interactive $FILE /var/bind/ 2> /dev/null && chown bind:bind /var/bind/$FILE

if [ ! $? ]; then
	service bind restart
fi

exit 0
