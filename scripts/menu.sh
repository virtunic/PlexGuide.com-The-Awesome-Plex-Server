#!/bin/bash
# Main Menu for PlexGuide
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'

# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

one(){
	echo "one() called"
        pause
}

# do something in two()
two(){
	echo "two() called"
        pause
}

#check to see if /var/plexguide/dep exists - if not, install dependencies

file="/var/plexguide/dep14.yes"
if [ -e "$file" ]
then
    clear
else
    bash /opt/plexguide/scripts/startup/dep.sh
    touch /var/plexguide/dep14.yes
fi

#DONATION ASSISTANCE INFORMATION **************************************
#>>>>> Visit http://hexabot.us to compound your BTC & LTC 22% Weekly!
#>>>>> Visit http://coin.plexguide.com to purchase BitCoin & LitCoins!
# function to display menus
show_menus() {
clear
cat << EOF
PlexGuide.com Installer V4 (17.12.06) | Written By: Admin9705 & Deiteq
Visit http://wiki.plexguide.com <<< You can edit and improve the Wiki!

GOOGLE DRIVE *********************************************************
1. RClone   :  Media Syncs to Google Drive
2. PlexDrive:  Prevent G-Drive Plex Scan Bans

PROGRAMS *************************************************************
3. Programs :  Install Plex, Couch, NetData, Radarr, Sonarr & More!
4. **BETA** :  Install Working Beta Programs! No Guides, YMLs Work!
5. Updates  :  Update PlexGuide for the newest features & bugfixes!

INFO & T-SHOOT *******************************************************
6. Info View:  View System Information to Assist You
7. T-Shoot  :  Troubleshoot Problems & Provides Helpful Information

SYSTEM BACKUP & RESTORE - RCLONE MUST BE SETUP ***********************
8. Backup   :  Backup Docker Program Data to Your Google Drive
9. Restore  :  Restore Program Data From Your Google Drive

EOF

}

read_options(){
	local choice
	read -p "Enter choice [ 1 - 10 ];  Type [10] to Exit! " choice
	case $choice in
	1)
        clear
	      bash /opt/plexguide/scripts/menus/rclone-menu.sh
        ;;
    2)
        clear
        bash /opt/plexguide/scripts/menus/plexdrive-menu.sh
        ;;
	3)
        bash /opt/plexguide/scripts/menus/programs.sh
        clear
        ;;
    4)
        bash /opt/plexguide/scripts/menus/programs-beta.sh
        clear
        ;;
    5)
        bash /opt/plexguide/scripts/docker-no/upgrade.sh
        clear
        echo Remember, restart by typing: plexguide
        exit 0;;
    6)
        bash /opt/plexguide/scripts/menus/info-menu.sh
        clear
        ;;
    7)
        bash /opt/plexguide/scripts/menus/trouble-menu.sh
        clear
        ;;
    8)
        bash /opt/plexguide/scripts/menus/backup-menu.sh
        clear
        ;;
    9)
        bash /opt/plexguide/scripts/menus/restore-menu.sh
        clear
        ;;
    10)
        clear
        echo Remember, restart by typing:  plexguide
        exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}

# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP

# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do

	show_menus
	read_options
done
