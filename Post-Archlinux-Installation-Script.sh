#! /usr/bin/env bash 
  
  menu () { 
    while true 
    do 
      clear 
                                  
      echo 
      echo " Post Archlinux Installation Script" 
      echo " <-------------------------------->" 
                                  
      echo 
      echo " 1) Packages" 
      echo " 2) Mirrors" 
                                  
      echo 
      echo " 3) Dotfiles" 
  
      echo 
      echo " E|e) Exit" 
  
      echo 
      echo " <-------------------------------->" 
  
      echo 
      read -p " Enter your choice: " VarMain 
  
      case $VarMain in 
  
        1)      Pkgs;; 
        2)      Mrrs;; 
                                                  
        3)      DotF;; 
  
        e|E)    Exit;; 
  
      esac 
    done 
  } 
  
  
  
  
  
  ########### 
  # VARMAIN # 
  ########### 
  
  Pkgs () { 
    clear 
                  
    echo 
    echo " 1) UPGRADE Packages" 
    echo " 2) UPDATE Packages" 
                  
    echo  
    echo " 3) INSTALL Packages" 
  
    read -p " Enter your choice: " VarPkgs 
  
    case $VarPkgs in 
        1)  UPG-Pkgs;; 
        2)  UPD-Pkgs;; 
  
        3)  INS-Pkgs;; 
    esac 
  } 
  
  
  Mrrs () { 
    clear 
  
    echo 
    echo " 1) Install Reflector" 
    echo " 2) Update Mirrors" 
    read -p " Enter your choice: " VarMrrs 
  
    case $VarMrrs in 
        1)  InsRefl;; 
        2)  UpdMrrs;; 
    esac 
  } 
  
  
  DotF () { 
    clear
                 
    echo
    cd /home/$USER/ && mkdir Git\ Repo 
    git clone https://github.com/Jiei-720p/i3-gaps-dotfiles
    clear
  }
  
  
  Exit () { 
    clear 
    exit 
  } 
  
  
  
  
  
  
  ########### 
  # VARPKGS # 
  ########### 
  
  UPG-Pkgs () { 
    clear 
  
    echo 
    echo " Upgrading Packages... please wait..." 
    sleep 1 
  
    sudo pacman -Syu \
    && echo "Packages successfully upgraded..." \
    && sleep 1 \
    && echo " Returning to Main Menu... " \
    || echo "Package Upgrade Failed..." \
    && echo " Returning to Main Menu... " \
    && sleep 1
  
    clear 
  } 


  UPD-Pkgs () { 
    clear 
  
    echo 
    echo " Syncing Packages... please wait..." 
    sleep 1 
  
    sudo pacman -Syy \
    && echo "Packages successfully synchronized" \
    && sleep 1 \
    || echo "Sync Failed..." \
    && sleep 1 \
    
    clear 
  } 
  
  
  
  
  
  ########### 
  # VARMRRS # 
  ########### 
  
  InsRefl () { 
    clear 
  
    echo 
    echo " Installing Reflector... please wait..." 
    sleep 1 
  
    sudo pacman -S reflector \
    && echo " Reflector successfully installed... " \
    && sleep 1 \
    && exit 0 \
    || echo " Reflector Installation Failed... " \
    && sleep 1 \
    && exit 1
        
    if [ $exit == 0 ]; then
        read -p " Update Mirrors? Y/n: " QUpdMrrs
        case $QUpdMrrs in 
            y|Y)    UpdMrrs;; 
            n|N)    Return;; 
        esac 
        clear
            
    elif [ $exit == 1 ]; then
        echo " Returning to Main Menu... "
        sleep 1
        clear
    fi
  }
  
  
  UpdMrrs () { 
    clear 
  
    echo 
    echo " Updating Mirrors... please wait..." 
    sleep 1 
  
    sudo reflector --verbose --latest 20 \
    --protocol https --sort rate \
    --save /etc/pacman.d/mirrorlist \
    && exit \
    || exit 1
    
        if [ $exit == 0 ]; then
            echo " Mirrors Successfully Updated... "
            echo " Returning to Main Menu... "
            sleep 1
            clear
            
        elif [ $exit == 1 ]; then
            echo " Mirror Update Failed... "
            echo " Something must've happend... "
            echo " Returning to Main Menu... "
            sleep 1
            clear
        fi
    
    clear 
  } 
  
  
  
  
  
  ########## 
  # VARINS # 
  ########## 
  
  INS-Pkgs () { 
    echo 
    echo " 1) Editing Documents" 
    echo " 2) Editing Media" 
    echo  
    echo " 3) Gaming" 
    echo  
    echo " 4) Terminal Shit" 
    read -p " Enter your choice: " VarINS-Pkgs
    
    case $VarINS-Pkgs in
        1) InsDoc;;
        2) InsMed;;
        3) InsGmg;;
        4) InsTerm;;
  } 
  
  
  
  
  
  ########## 
  # RETURN # 
  ########## 
  
  Return () { 
                 echo " Suit yourself..." 
                 sleep 1 
  
                 echo " Returning to Main Menu..." 
                 sleep 1 
                 clear 
  } 
  
  
  
  
  
  ######## 
  # LOOP # 
  ######## 
  menu
