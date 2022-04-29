#!/bin/bash
# SCRIPT:
# REV: Version 1.0
# PLATFORM: Linux
# AUTHOR: Coenraad
#
# PURPOSE: Linux template
#
##########################################################
########### DEFINE FILES AND VARIABLES HERE ##############
##########################################################

##########################################################
################ BEGINNING OF MAIN #######################
##########################################################


    echo
    echo -e "\e[40;38;5;82m [+] \e[30;48;5;82m Installing Need Repo's and software!!! This will take TIME..  \e[0m"
    echo
    echo "Installing system"
i cho


echo -e "Setup User for sudo"
echo
echo "Type in the user name that will get sudo role "
read usersudo
echo "$usersudo ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$usersudo
chmod 0440 /etc/sudoers.d/$usersudo


####################################################
################ END OF MAIN #######################
####################################################
exit 0
# End of script
