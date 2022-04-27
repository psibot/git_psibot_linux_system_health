#!/bin/bash
# SCRIPT:
# REV: Version 1.0
# PLATFORM: Linux
# AUTHOR: Coenraad
#
# PURPOSE: Ansible Tower Quick Script
#
##########################################################
########### DEFINE FILES AND VARIABLES HERE ##############
##########################################################
 # Run as root.
 # if [[ $EUID -ne 0 ]]; then
 #    echo -e  "\e[1mMust be ROOT to run  this script!\e[0m"
 #    echo -e  "\e[1mMust be ROOT to run  this script!\e[0m"
 #    echo -e  "\e[1mMust be ROOT to run  this script!\e[0m"
 #    exit
 #fi



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


   function systems-ansible-up()
   {
       clear
       echo
       echo
       sleep 2
       clear
       echo
       echo -e  "\e[32m[+]\e[0m Ping ALL Ansible Hosts  \e[0m"
       echo
       ansible all -m ping -u root
       echo
       read -p "Press [Enter] to continue...or Ctl+C to Exit"
       echo
       clear

   }



 function show_menus()
   {
   clear
   echo
   echo -e "\e[1;31;42m Ubuntu Ansible - Tower Quick Check  \e[0m "
   echo
   echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'a' for - Setup SUDO User for Server  \e[0m"
   echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'b' for - Check Server Uptime And Status  \e[0m"
   echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'c' for - Delete Older Postgresql Vesrions  \e[0m"
   echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'd' for - Install Ansible Packages  \e[0m"
   echo -e "\e[32m[-]\e[0m \e[1m   Choose : Hit 'x' for - Exit \e[0m"
   echo
   echo "Pick Option:"
   }


   show_menus
   read choice

   if [ "$choice" == a ]; then
       sudoUser
       show_menus
       read choice
   fi

   if [ "$choice" == b ]; then
        systems-ansible-up
        show_menus
        read choice
   fi

   if [ "$choice" == c ]; then
       delete_psql
       show_menus
       read choice
   fi

   if [ "$choice" == d ]; then
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
################ END OF MAIN #######################
####################################################
exit 0
# End of script
