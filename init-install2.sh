#!/bin/bash
# SCRIPT: server-setup.sh
# REV: Version 1.0
# PLATFORM: Linux
# AUTHOR: Coenraad
#
# PURPOSE: ROOT Kube control
#
##########################################################
########### DEFINE FILES AND VARIABLES HERE ##############
##########################################################

##########################################################
################ BEGINNING OF MAIN #######################
##########################################################
# Run as root.
if [[ $EUID -ne 0 ]]; then
    echo -e "\e[1mMust be ROOT to run  this script!\e[0m"
    echo -e "\e[1mMust be ROOT to run  this script!\e[0m"
    echo -e "\e[1mMust be ROOT to run  this script!\e[0m"
    exit 1
fi

clear

function pause(){
	local message="$@"
	[ -z $message ] && message="Press [Enter] key to continue..."
	read -p "$message" readEnterKey
}

function users-s()
{
    cls
    echo
    echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m This Will setup your user on New Server  \e[0m"
    echo
    echo "SetUp User "
    echo
    echo -e "What user should we setup for sudo - type the username"
    read uss 
    echo 
    adduser $uss 
    echo "$uss ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$uss
    sudo chmod 0440 /etc/sudoers.d/$uss
    echo 
    echo -e "Done"
    pause

  }

function setup-Laptop()
  {
      echo
      echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m Installing  System !!!  \e[0m"
      echo
      echo "This will take time"
      echo
      pause 
      echo 
      sudo apt update 
      echo 
      clear
      sudo apt install vim* git  forensic*
      #git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
      #sh ~/.vim_runtime/install_awesome_vimrc.sh
      sudo snap  install orchis-themes
      sudo snap  install chromeos-themes
      sudo snap  install ttvdesktop
      sudo snap  install good-job
      sudo snap  install tela-icons
      sudo snap  install wonderwall
      sudo snap  install wallpaperdownloader
      sudo snap  install discord
      sudo snap  install aetherp2p
      sudo snap  install i2pi2p --edge
      sudo snap  install easy-openvpn-server --candidate
      sudo snap  install qownnotes
      sudo snap  install youtube-dl
      sudo snap  install buka
      sudo snap  install audible-for-linux
      sudo snap  install rpi-imager
      sudo snap  install easy-installer --beta
      sudo snap  install midterm
      sudo snap  install obs-studio
      sudo snap  install filmographer
      sudo snap  install sublime-text --classic
      sudo snap  install circleci
      sudo snap  install netron
      sudo snap  install opencomic
      sudo snap  install cu-ddns
      sudo snap  install janlochi-zigbee2mqtt --edge
      sudo snap  install micropad
      sudo snap  install cacher
      sudo snap  install termius-beta
      sudo snap  install snowflake
      sudo snap  install termius-app
      sudo snap  install sftpclient
      sudo snap  install keepassxc
      sudo snap  install termius-beta
      sudo snap  install cacher
      sudo snap  install codechecker --classic
      sudo snap  install slack --classic
      sudo snap  install whatsdesk
      sudo snap install zoom-client
      sudo snap install teams-for-linux 
      sudo snap install prospect-mail 
      sudo snap install giara --beta
      sudo snap install telegram-desktop 
      sudo snap install bitwarden
      sudo snap install dm-tools
      sudo snap install csbooks
      sudo snap install phpstorm --classic
      sudo snap install intellij-idea-community --classic
      sudo snap install brackets --classic
      sudo snap install go --classic
      sudo snap install clion --classic
      sudo snap install pycharm-educational --classic
      sudo snap install code --classic
      sudo snap install ant --classic
      sudo snap install kotlin --classic
      sudo snap install flutter --classic 
      sudo snap install goland --classic
      sudo snap install cmake --classic
      sudo snap install kompare
      sudo snap install fuzzit
      sudo snap install goreleaser --classic
      sudo snap install aliasman
      sudo snap install gisto
      sudo snap install codechecker --classic
      sudo snap install rem --classic
      sudo snap install pigmeat
      echo 
      clear



    }

function show_menus()
  {
  echo -e "Setup News server or Laptop "
  echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'a' for !!! Setup Users !!! \e[0m"
  echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'b' for Install deps and Software on Laptop !!!\e[0m"
  echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'c' for Install deps and Software on Server !!!\e[0m"
  echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'x' for Exit!!!\e[0m"
  echo
  echo "Pick Option:"
  }


  show_menus

  read choice
  if [ "$choice" == a ]; then
      users-s
      show_menus
      read choice
  fi

  if [ "$choice" == b ]; then
      setup-Laptop
      show_menus
      read choice
  fi


  if [ "$choice" == x ]; then
      clear
      sleep 2
      echo -e "\e[40;38;5;82m [*] \e[30;48;5;82m THANK YOU FOR USING ME !!!  \e[0m"
      echo -e "\e[40;38;5;82m [*] \e[30;48;5;82m Have a nice day! \e[0m"
      exit 0
  fi


####################################################
################ END OF MAIN #######################
####################################################
exit 0
# End of script

