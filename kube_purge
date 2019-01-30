#!/bin/bash
# SCRIPT: kube_purge.sh
# REV: Version 1.0
# PLATFORM: Linux
# AUTHOR: Coenraad
#
# PURPOSE: ROOT Kube control
#
##########################################################
########### DEFINE FILES AND VARIABLES HERE ##############
##########################################################
export https_proxy="http://coenraadl:Lafarge2000@172.16.27.90:8080/"
export http_proxy="http://coenraadl:Lafarge2000@172.16.27.90:8080/"
export ftp_proxy="http://coenraadl:Lafarge2000@172.16.27.90:8080/"
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

function clean()
{
    echo
    echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m Purging System for reset!!!  \e[0m"
    echo
    echo "Reseting system"
    echo
    kubeadm reset
    docker system prune -a
    service kubenet restart
    service docker restert

  }

function purge()
  {
      echo
      echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m Purging System !!!  \e[0m"
      echo
      echo "Delete old docker images"
      echo
      # remove exited containers:
     docker ps --filter status=dead --filter status=exited -aq | xargs -r docker rm -v
     # remove unused images:
     docker images --no-trunc | grep '<none>' | awk '{ print $3 }' | xargs -r docker rmi

    }

function show_menus()
  {
  echo -e "Docker Kuberenetes ROOT admin "
  echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'a' for !!! PURGE AND RESET SYSTEM !!! \e[0m"
  echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'b' for Delete old Docker images ect. !!!\e[0m"
  echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'x' for Exit!!!\e[0m"
  echo
  echo "Pick Option:"
  }


  show_menus

  read choice
  if [ "$choice" == a ]; then
      clean
      show_menus
      read choice
  fi

  if [ "$choice" == b ]; then
      purge
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
