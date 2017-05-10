#!/bin/bash
# This is a little install script to copy all of the files in the correct places

# Files
SRV=spideroak@.service
SRP=spideroak.sh
SRC=.spideroak.rc

# Directories
SERV=/lib/systemd/system
SCRI=/usr/local/lib/systemd/scripts

do_install() {
    echo "Creating directories..."
    mkdir -v -p $SCRI

    echo "Copying Service file and Script"
    cp -v $SRV $SERV
    cp -v $SRP $SCRI/${SRP%.sh}

    echo "Copying RC file to user dir"
    cp -v $SRC $HOME

    echo "Configuring spideroak@root.service to start at boot..."
    systemctl enable spideroak@root
}

do_uninstall() {
    echo "Uninstalling spideroak@root.service..."
    echo "Disabling service."
    systemctl disable spideroak@root

    rm -v -f $HOME/$SRC
    rm -v -f $SCRI/${SRP%.sh}
    rm -v -f $SERV/$SRV
}

if [ $1 == "--uninstall" ]; then
    do_uninstall
else
    do_install
fi

