#! /usr/bin/env bash

menu () {
		while true
		do
				clear
				
				echo
				echo "Post Archlinux Installation Script"
				echo "<-------------------------------->"
				
				echo
				echo "1) Packages"
				echo "2) Mirrors"

				echo
				echo "e|E) Exit"

				echo
				echo "<-------------------------------->"

				echo
				read -p "Enter your choice: " Var1

				case $Var1 in

						1)			Pkgs;;
						2)			Mrrs;;

						e|E)		Exit;;

				esac
		done
}





########
# VAR1 #
########

Pkgs () {
		clear
		
		echo
}


Mrrs () {
		clear

		echo
		echo "1) Install Reflector"
		echo "2) Update Mirrors"
		read -p "Enter your choice: " Var2

		case $Var2 in
				1)	InsRefl;;
				2)	UpdMrrs;;
		esac
}


Exit () {
		clear
		exit
}





########
# VAR2 #
########

InsRefl () {
		clear

		echo
		echo "Installing Reflector... please wait..."
		sleep 1

		echo
		sudo pacman -S reflector
		sleep 1

		echo
		echo "Returning to Main Menu..."
		sleep 1

		clear
}


UpdMrrs () {
		clear

		echo
		echo "Updating Mirrors... please wait..."
		sleep 1
		
		echo
		sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
		sleep 1

		echo
		echo "Returning to Main Menu..."
		sleep 1

		clear
}
