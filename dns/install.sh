#!/bin/bash

# Damien Arnoux
# LP-CGIR : Projet d'intégration

# Installation des fichiers de configuration de Bind9

if [ ! -f /usr/sbin/named ]; then
	echo "BIND9 n'est pas installé."
	echo "=> apt-get install bind9"
	echo "exiting..."
	exit 1
fi

if [ ! -d "/var/bind" ]; then
	echo "création du répertoire /var/bind"
	mkdir /var/bind
	chown bind:bind /var/bind
	chmod 700 /var/bind
fi

# copie des fichiers de configuration et déclaration
cp --interactive named.conf /etc/bind/
cp --interactive named.conf.local /etc/bind/
cp --interactive named.conf.options /etc/bind/

#copie des fichiers de zone
cp --interactive pain-jacques.fr /var/bind/
cp --interactive pain-jacques.fr.140.rev /var/bind/

if [ ! $? ]; then
	echo ""
	echo "[ OK ]"
fi

exit 0
