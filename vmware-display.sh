#!/bin/bash

vmware-modconfig --console --install-all

openssl req -new -x509 -newkey rsa:2048 -keyout VMWARE17.priv -outform DER -out VMWARE17.der -nodes -days 36500 -subj "/CN=VMWARE/"

sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./VMWARE17.priv ./VMWARE17.der $(modinfo -n vmmon)

sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./VMWARE17.priv ./VMWARE17.der $(modinfo -n vmnet)

tail $(modinfo -n vmmon) | grep "Module signature appended"

sudo mokutil --import VMWARE17.der