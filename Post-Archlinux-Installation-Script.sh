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

		read -p "Enter your Choice: " VarMain

		case $VarMain in
				1)			Pkgs;;
				2)			Mrrs;;

				3)			DotF;;
				
				e|E)		Exit;;

		esac
done

}





################
#   PACKAGES   #
################

Pkgs () {

	clear
	
	echo " 1) UPGRADE Packages "
	echo " 2) UPDATE Packages "

}


Mrrs () {

	clear

}


DotF () {

	clear

}


Exit () {

	clear
	echo " Exiting... "
	sleep 1
	exit

}





############
#   LOOP   #
############

menu

