#! /usr/bin/env bash

menu () { while true
do
		clear

		echo
		echo "POST ARCH-LINUX INSTALL SCRIPT"
		echo "<---------------------------->"
		echo

		echo
		echo "SYSTEM"
		echo "1.1) Upgrade Packages"
		echo "1.2) Sync Packages"
		echo

		echo
		echo "INSTALL"
		echo "2.) Reflector"
		echo "2.) Fonts"
		echo "2.) Media"
		echo "2.) Gaming"
		echo
		
		echo
		echo "E|e) Exit"
		echo

		echo
		echo "<---------------------------->"
		echo

		read -p "Enter Number: " Var1

		case $Var1 in
				1)			PacUpg;;
				2)			PacUpd;;
				E|e)		clear && exit;;

		esac
done
}

#
#
#
#

PacUpg () {
		
		clear
		echo "Upgrading Packages... Please wait..."
		sleep 1

		sudo pacman -Syu
		clear

		echo "Command Executed Successfully..."
		sleep 1
		echo "Returning to Main Menu..."
		sleep 1
		clear
}

PacUpd () {

		clear
		echo "Synchronizing Packages... Please wait..."
		sleep 1

		sudo pacman -Syy
		clear

		echo "Command Executed Successfully..."
		sleep 1
		echo "Returning to Main Menu..."
		sleep 1
		clear
}

#
#
#
#

menu
