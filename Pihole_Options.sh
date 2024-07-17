#!/bin/bash
clear
figlet -f standard "Pihole Menu" | lolcat
date | lolcat

RED="\033[1;31m"
GREEN="\033[1;32m"
PURPLE="\e[0;35m"
YELLOW="\e[0;33m"
NOCOLOR="\033[0m"

echo -e "${YELLOW}Pihole Menu: One${NOCOLOR}"
echo -e "${GREEN}You can access the Pihole Menu by typing PiMenu${NOCOLOR}"
echo "
1. Help
2. Version
3. GUI
4. Update Lists
5. Enable/Disable Pihole
6. More Options
" | lolcat

read -p "What option would you like to select?: " opt

        if
                [ "$opt" == "1" ]
                then
                        pihole -h
        fi

        if
                [ "$opt" == "2" ]
                then
                        pihole -v
        fi

        if
                [ "$opt" == "3" ]
                then
                        clear
                        figlet -f standard "Monitoring Tools"
                        date
                        read -p "What would you like to monitor? (Crow/Pihole) " GUI
        if
                [ "$GUI" == "Crow" ]
                then
                        clear
                        figlet -f standard "Crow Tools"date
                        echo "
                        1. htop
                        2. gotop
                        "
                        read -p "What option would you like to select?: " tool
                                if
                                        [ "$tool" == "1" ]
                                        then
                                                htop
                                fi

                                if
                                        [ "$tool" == "2" ]
                                        then
                                                /home/crow/./gotop
                                fi

fi

        if
        [ "$GUI" == "Pihole" ]
        then

                figlet -f standard "Pihole Tools"
                date
        fi
fi

if
[ "$opt" == "4" ]
then
        pihole -g
fi

if
[ "$opt" == "5" ]
then
        echo "To Be Added Later"
fi

if
[ "$opt" == "6" ]
then
        echo "To Be Added Later"
fi

