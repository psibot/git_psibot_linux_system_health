#!/bin/bash
# SCRIPT:
# REV: Version 1.0
# PLATFORM: Linux
# AUTHOR: Coenraad
#
# PURPOSE: Ubuntu Ansible Postgresql Server Deploy
#
##########################################################
########### DEFINE FILES AND VARIABLES HERE ##############
##########################################################
# Run as root.
if [[ $EUID -ne 0 ]]; then
    echo -e  "\e[1mMust be ROOT to run  this script!\e[0m"
    echo -e  "\e[1mMust be ROOT to run  this script!\e[0m"
    echo -e  "\e[1mMust be ROOT to run  this script!\e[0m"
    exit
fi


##########################################################
################ BEGINNING OF MAIN #######################
##########################################################

function sudoUser()
{
    clear
    echo
    echo -e  "\e[40;38;5;82m [+] \e[30;48;5;82m Setup Sudo User AND Root SSH For Ansible !!!  \e[0m"
    echo
    echo
    echo "Type in the user name that will get sudo role "
    echo
    read usersudo
    echo "$usersudo ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$usersudo
    chmod 0440 /etc/sudoers.d/$usersudo
    sleep 2
    echo
    echo -e  "\e[40;38;5;82m [+] \e[30;48;5;82m Enable ROOT Login  !!!  \e[0m"
    echo
    sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    sudo systemctl restart ssh
    echo
    clear
    echo
    echo -e "\e[32m[-]\e[0m \e[1m Type A ROOT Password for ssh  \e[0m"
    echo
    sudo passwd
}

function install_psql()
{
    clear
    echo
    echo -e  "\e[40;38;5;82m [+] \e[30;48;5;82m Needed Packages for Server Deploy !!!  \e[0m"
    echo
    echo
    clear
    echo
    echo -e  "\e[40;38;5;82m [+] \e[30;48;5;82m Install Repo For Postgresql !!!  \e[0m"
    echo
    echo
    sleep 2
    # Create the file repository configuration:
    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

    # Import the repository signing key:
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

    # Update the package lists:

    sudo apt update; sudo apt upgrade

    # Install the latest version of PostgreSQL.
    # If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
    clear
    echo -e "\e[32m[-]\e[0m \e[1m   Choose Postgresql Versio You need to install 12 , 13 , 14 \e[0m"
    echo -e "\e[32m[-]\e[0m \e[1m   Just Type Version Number * 12 , 13 , 14 \e[0m"
    echo
    read versionpsql
    sudo apt-get -y install postgresql-$versionpsql postgresql-client-$versionpsql libpq-dev postgresql-server-dev-$versionpsql python-dev python3-dev python3 python3-pip curl wget vim sed libxml2-utils nmap vim git gawk htop cmake gcc clang llvm rsync network-manager net-tools
    echo
    clear
    echo -e "\e[32m[*]\e[0m \e[1m Starting Postgresql Service  \e[0m"
    echo
    sudo service postgresql start
    echo
    echo "Check Version"
    echo
    psql -V

}


 function install_asible()
 {
     clear
     echo
     echo -e  "\e[40;38;5;82m [+] \e[30;48;5;82m Needed Packages for Ansible Deploy !!!  \e[0m"
     echo
     clear
     echo
     echo
     sleep 2
     sudo apt update; sudo apt upgrade
     clear
     echo -e "\e[32m[-]\e[0m \e[1m Pulling Package Ansible ???  \e[0m"
     echo
     read -p "Press [Enter] to continue...or Ctl+C to Exit"
     echo
     sudo apt-get -y ansible ansible*
     echo
     clear
     echo
     echo

 }



 function delete_psql()
 {
     clear
     echo
     echo
     sleep 2
     sudo apt update; sudo apt upgrade
     clear
     echo
     echo -e  "\e[32m[+]\e[0m Current Postgresql Versions On Server \e[0m"
     echo
     sudo service postgresql restart
     echo
     read -p "Press [Enter] to continue...or Ctl+C to Exit"
     echo
     clear
     echo -e "\e[32m[-]\e[0m \e[1m   Choose Postgresql Version You need to DELETE !!! \e[0m"
     echo -e "\e[32m[-]\e[0m \e[1m   Just Type Version Number * , 12 , 13 , 14 \e[0m"
     echo
     echo -e "\e[101m[+]\e[0m THIS CAN NOT BE UNDONE \e[0m"
     echo
     read -p "Press [Enter] to continue...or Ctl+C to Exit"
     echo
     echo
     read versionpsql
     sudo apt-get -y remove  postgresql-$versionpsql postgresql-client-$versionpsql libpq-dev postgresql-server-dev-$versionpsql
     echo
     clear
     echo "Check Other Version or Postgresql on Server"
     echo
     sudo service postgresql restart

 }

  function check_psql()
  {
      clear
      echo
      echo
      sleep 2
      clear
      echo
      echo -e  "\e[32m[+]\e[0m Current Postgresql Versions On Server \e[0m"
      echo
      sudo service postgresql restart
      echo
      read -p "Press [Enter] to continue...or Ctl+C to Exit"
      echo
      clear

  }


function show_menus()
  {
  clear
  echo
  echo -e "\e[1;31;42m Ubuntu Ansible - Postgresql Server Deploy \e[0m "
  echo
  echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'a' for - Install Need Repositories And Packages \e[0m"
  echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'b' for - Setup SUDO User for Server  \e[0m"
  echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'c' for - Check Current Postgresql Vesrions  \e[0m"
  echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'd' for - Delete Older Postgresql Vesrions  \e[0m"
  echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'e' for - Install Ansible Packages  \e[0m"
  echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'x' for - Exit \e[0m"
  echo
  echo "Pick Option:"
  }


  show_menus

  read choice
  if [ "$choice" == a ]; then
      install_psql
      show_menus
      read choice
  fi

  if [ "$choice" == b ]; then
      sudoUser
      show_menus
      read choice
  fi

  if [ "$choice" == c ]; then
       check_psql
       show_menus
       read choice
  fi

  if [ "$choice" == d ]; then
      delete_psql
      show_menus
      read choice
  fi

  if [ "$choice" == e ]; then
     install_asible
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
############### END OF MAIN #######################
####################################################
exit 0
# End of script
