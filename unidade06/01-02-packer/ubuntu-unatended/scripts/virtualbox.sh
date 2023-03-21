#!/bin/sh -eux

# set a default HOME_DIR environment variable if not set
HOME_DIR="${HOME_DIR:-/home/vagrant}";

case "$PACKER_BUILDER_TYPE" in
virtualbox-iso|virtualbox-ovf)
    VER="`cat $HOME_DIR/.vbox_version`";
    ISO="VBoxGuestAdditions_$VER.iso";
    mkdir -p /tmp/vbox;
    mount -o loop $HOME_DIR/$ISO /tmp/vbox;
    sudo sh /tmp/vbox/VBoxLinuxAdditions.run --nox11 \
        || echo "VBoxLinuxAdditions.run exited $? and is suppressed." \
            "This is not working";
    umount /tmp/vbox;
    rm -rf /tmp/vbox;
    rm -f $HOME_DIR/*.iso;
    ;;
esac