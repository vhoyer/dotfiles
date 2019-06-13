#!/bin/sh

if [ ! $1 ]; then
	echo 'Argument $1 is required and it must be an email'
	exit 1
fi

ssh-keygen -t rsa -C "$1"
