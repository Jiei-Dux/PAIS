#! /usr/bin/env bash

menu () { 

	while true
	do
		clear

		echo
		echo " POST ARCH-LINUX INSTALL SCRIPT "
		echo " <----------------------------> "

		echo
		echo " 1) PACKAGES "
		echo " 2) MIRRORS "
		
		echo
		echo " 3) DotFiles "

		echo
		echo " E|e) Exit "

		echo
		echo " <----------------------------> "

		echo
		read -p " Enter your Choice: " VarMain

		case $VarMain in
				1)			Pkgs ;;
				2)			Mrrs ;;

				3)			DotF ;;
				
				e|E)		Exit ;;

		esac
done

}





############
#   MAIN   #
############

Pkgs () {

	clear
	
	echo
	echo " 1) UPGRADE Packages "
	echo " 2) UPDATE Packages "
	
	echo " 3) FONTS Installation "

	echo
	echo " 4) INSTALL Packages "

	echo
	echo " E|e) Back "

	echo
	read -p " Enter your Choice: " VarPkgs

	case $VarPkgs in
					1) 		UpgPkgs ;;
					2) 		UpdPkgs ;;
					3)		FontsIns ;;
					4) 		InsPkgs ;;
					E|e)	Back ;;
	esac

}


Mrrs () {

				clear

				echo
				echo " 1) INSTALL Reflector "
				echo " 2) UPDATE Mirrors "

				echo " E|e) Back "

				echo
				read -p " Enter your Choice: " VarMrrs

				case $VarMrrs in
								1)			InsRefl ;;
								2)			UpdMrrs ;;
								E|e)		Back ;;
				esac

}


DotF () {

				clear

				pacman -S git \
								&& echo " Git Successfully Installed " \
								&& sleep 1 \
								|| echo " Install Failed " \
								&& sleep 1

				clear
				echo
				mkdir "Git Repo"
				cd Git\ Repo

				git clone https://github.com/Jiei-720p/i3-gaps-dotfiles
				cd

				sleep 1
				clear

}


Exit () {

				clear

				echo
				echo " Exiting... "
				sleep 1

				tput rmcup
				exit
				

}


Back () {

				clear

}





############
# PACKAGES #
############

UpgPkgs () {

				clear
				
				echo
				sudo pacman -Syu \
								&& echo " Upgrade Successfull " \
								&& sleep 1 \
								|| echo " Upgrade Failed " \
								&& sleep 1
				echo 
				echo " Returning to Main Menu "
				sleep 2
				
				clear
}


UpdPkgs () {

				clear

				echo
				sudo pacman -Syy \
								&& echo " Update Successfull " \
								&& sleep 1 \
								|| echo " Update Failed " \
								&& sleep 1
				echo
				echo " Returning to Main Menu "
				sleep 2
				
				clear
}


InsPkgs () {

				clear

				echo
				echo " 1. Security "
				echo " 2.  "
				echo " 3.  "

				echo " E|e. Back"

				read -p  " Enter your choice: " VarInsPkgs

				case $VarInsPkgs in

								1) 		SecurityPkgs ;;
								2)		Pkgs ;;
								E|e)	Back ;;

				esac

}





############
#   LOOP   #
############

menu
