#!/bin/bash
clear
figlet -f standard "Crow Menu" | lolcat
date | lolcat

RED="\033[1;31m"
GREEN="\033[1;32m"
PURPLE="\e[0;35m"
YELLOW="\e[0;33m"
NOCOLOR="\033[0m"

echo -e "${YELLOW}Crow's Quick Menu${NOCOLOR}"
echo -e "${GREEN}You can access the Quick Menu by typing MENU${NOCOLOR}"
echo "
1. Daily Upkeep
2. Reboot
3. SSH
4. Pihole Menu
5. Aliases
6. More Options
" | lolcat

read -p "What option would you like to select?: " opt

if
[ "$opt" == "1" ]
then

     sudo /home/crow/Documents/bashscripts/bash_scripts_repo/General/./update.sh
fi

if
[ "$opt" == "2" ]
then
     sudo reboot

fi

if
[ "$opt" == "3" ]
then

clear
figlet -f standard "Crow's SSH" | lolcat
date | lolcat
     echo "
Welcome to Black Box's SSH terminal.
" | lolcat

fi

if
[ "$opt" == "4" ]
then

     /home/crow/Documents/bashscripts/bash_scripts_repo/Menu_Options/Pihole_Options.sh
fi

if
[ "$opt" == "5" ]
then

     sudo nano /home/crow/.bash_aliases
fi

if
[ "$opt" == "6" ]
then
        echo "To Be Added Later"
fi


