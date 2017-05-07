#!/bin/bash
# This is a little install script to copy all of the files in the correct places

# Files
SRV=spideroak@.service
SRP=spideroak.sh
SRC=.spideroak.rc

# Directories
SERV=/lib/systemd/system
SCRI=/usr/local/lib/systemd/scripts

echo "Creating directories..."
mkdir -v -p $SCRI

echo "Copying Service file and Script"
cp -v $SRV $SERV
cp -v $SRP $SCRI/${SRP%.sh}

echo "Copying RC file to user dir"
cp -v $SRC $HOME

echo "Configuring spideroak@root.service to start at boot..."
systemctl enable spideroak@root

