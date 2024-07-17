#!/bin/bash

figlet -f standard "Daily Upkeep" | lolcat

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

mylog() {
        STEP=$1
        MSG=$2

        echo -e "step $STEP: ${GREEN}${MSG}${NOCOLOR}"
        logger "step $STEP: $MSG"
}

myfail() {
        STEP=$1
        MSG=$2

        echo -e "step $STEP ERROR: ${RED}${MSG}${NOCOLOR}"
        logger "step $STEP ERROR: $MSG"
}

# handle command line options
if [[ $1 == "-h" ]]; then
        echo "usage: $0"
        echo " -h prints help"

        exit 1
fi

# step 1
mylog 1 "Configure DPKG"
echo "Initializing..."

# step 2
mylog 2 "Attempt to fix any issues with dependencies"
echo "Initializing..."

# step 3
mylog 3 "Update"
echo "Initializing..."

# step 4
mylog 4 "Upgrade"
echo "Initializing..."

# step 5
mylog 5 "dist-update"
echo "Initializing..."

# step 6
mylog 6 "Purge Unnecisary Dependencies"
echo "Initializing..."

# step 7
mylog 7 "Clean Dependencies"
echo "Initializing..."

# step 8
mylog 8 "Update Pihole"
echo "Initializing..."

if [[ $? == 0 ]]; then
        myfail 3 "nothing really"
fi

echo

echo -e "step 1: ${GREEN}pre-configuring packages${NOCOLOR}"
sudo dpkg --configure -a

echo

echo -e "step 2: ${GREEN}fix and attempt to correct a system with broken dependencies${NOCOLOR}"
sudo apt-get install -f

echo

echo -e "step 3: ${GREEN}update apt cache${NOCOLOR}"
sudo apt-get update

echo

echo -e "step 4: ${GREEN}upgrade packages${NOCOLOR}"
sudo apt-get upgrade

echo

echo -e "step 5: ${GREEN}distribution upgrade${NOCOLOR}"
sudo apt-get dist-upgrade

echo

echo -e "step 6: ${GREEN}remove unused packages${NOCOLOR}"
sudo apt-get --purge autoremove

echo

echo -e "step 7: ${GREEN}clean up${NOCOLOR}"
sudo apt-get autoclean

echo

echo -e "step 8: ${GREEN}Update Pihole${NOCOLOR}"
pihole -up

echo

echo
figlet -f standard "The End"
date
sleep 5
clear

echo
