#!/bin/bash

# Make sure only root can run our script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Variables.
shortdate=`date +"%d-%m-%y"`

mkdir -p /mnt/f/backup_$shortdate
rsync -av -P /mnt/e/* /mnt/f/backup_$shortdate/
