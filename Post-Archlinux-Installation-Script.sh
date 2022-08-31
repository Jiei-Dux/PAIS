#! /usr/bin/env bash

menu () {
		while true
		do
				clear
				
				echo
				echo " Post Archlinux Installation Script"
				echo " <-------------------------------->"
				
				echo
				echo " 1) Packages"
				echo " 2) Mirrors"
				
				echo
				echo " 3) Dotfiles"

				echo
				echo " E|e) Exit"

				echo
				echo " <-------------------------------->"

				echo
				read -p " Enter your choice: " VarMain

				case $VarMain in

						1)			Pkgs;;
						2)			Mrrs;;
						
						3)			DotF;;

						e|E)		Exit;;

				esac
		done
}





###########
# VARMAIN #
###########

Pkgs () {
		clear
		
		echo
		echo " 1) UPGRADE Packages"
		echo " 2) UPDATE Packages"
		
		echo 
		echo " 3) INSTALL Packages"

		read -p " Enter your choice: " VarPkgs

		case $VarPkgs in
				1)	UPG-Pkgs;;
				2)	UPD-Pkgs;;

				3)	INS-Pkgs;;
		esac
}


Mrrs () {
		clear

		echo
		echo " 1) Install Reflector"
		echo " 2) Update Mirrors"
		read -p " Enter your choice: " VarMrrs

		case $VarMrrs in
				1)	InsRefl;;
				2)	UpdMrrs;;
		esac
}


DotF () {
		exec kitty --name Terminal -e bash /home/$USER/.Scripts/DotFiles.sh
}


Exit () {
		clear
		exit
}






###########
# VARPKGS #
###########

UPG-Pkgs () {
		clear

		echo
		echo " Upgrading Packages... please wait..."
		sleep 1

		if sudo pacman -Syu; then
				echo
				echo " Packages successfully upgraded..."
				sleep 1
				clear

				echo " Returning to Main Menu..."
				sleep 1

		else
				echo
				echo " Upgrade Failed... What the fuck?"
				sleep 1
				clear

				echo " Returning to Main Menu..."
				sleep 1
		fi

		clear
}

UPD-Pkgs () {
		clear

		echo
		echo " Syncing Packages... please wait..."
		sleep 1

		if sudo pacman -Syy; then
				echo
				echo " Packages successfully synchronized..."
				sleep 1
				clear

				echo " Returning to Main Menu..."
				sleep 1

		else
				clear
				echo " Sync Failed..."
				sleep 1
				clear

				echo " Returning to Main Menu..."
				sleep 1
		fi

		clear
}





###########
# VARMRRS #
###########

InsRefl () {
		clear

		echo
		echo " Installing Reflector... please wait..."
		sleep 1

		if sudo pacman -S reflector; then
				echo
				echo " Reflector successfully installed..."
				sleep 1
				clear

				echo
				echo " Update Mirrors? y/n"
				echo
				read -p " Enter your choice: " UpdMrrs?

				case $UpdMrrs? in
					y|Y) 	UpdMrrs;;
					n|N)	Return;;

				esac

				clear

		else
				echo " Reflector Installation Failed..."
				sleep 1
				clear
				
				echo " Returning to Main Menu..."
				sleep 1
		fi

		clear
}


UpdMrrs () {
		clear

		echo
		echo " Updating Mirrors... please wait..."
		sleep 1

		if sudo reflector --verbose --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist; then
				echo
				echo " Now ye got the latest Mirrors!"
				sleep 1
				clear

				echo " Returning to Main Menu..."
				sleep 1

		else
				echo
				echo " Updating Mirrors Failed..."
				sleep 1
				clear

				echo " Returning to Main Menu..."
				sleep 1
		fi		

		clear
}





##########
# VARINS #
##########

INS-Pkgs () {
		echo
		echo " 1) Editing Documents"
		echo " 2) Editing Media"
		echo 
		echo " 3) Gaming"
		echo 
		echo " 4) Terminal Shit"
}





##########
# RETURN #
##########

Return () {
		echo " Suit yourself..."
		sleep 1

		echo " Returning to Main Menu..."
		sleep 1
		clear
}





########
# LOOP #
########
menu
