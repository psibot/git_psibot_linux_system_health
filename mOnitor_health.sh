#!/bin/bash
# SCRIPT: mOnitor_health.sh
# REV: Version 2.0
# PLATFORM: Linux
# AUTHOR: Coenraad
# PURPOSE: linux health check.
#
##########################################################
########### DEFINE FILES AND VARIABLES HERE ##############
##########################################################
# to install run script ./mOnitor_health.sh -i
##########################################################
################ BEGINNING OF MAIN #######################
##########################################################
# clear the screen
clear

unset tecreset os architecture kernelrelease internalip externalip nameserver loadaverage

while getopts iv name
do
        case $name in
          i)iopt=1;;
          v)vopt=1;;
          *)echo "Invalid arg";;
        esac
done

if [[ ! -z $iopt ]]
then
{
wd=$(pwd)
basename "$(test -L "$0" && readlink "$0" || echo "$0")" > /tmp/scriptname
scriptname=$(echo -e -n $wd/ && cat /tmp/scriptname)
su -c "cp $scriptname /usr/bin/monitor" root && echo "Congratulations! Script Installed, now run monitor Command" || echo "Installation failed"
}
fi

if [[ ! -z $vopt ]]
then
{
echo -e "mOnitor_health.sh version 2.0\nDesigned by Coenraad\nReleased Under Apache 2.0 License"
}
fi

if [[ $# -eq 0 ]]
then
{


# Define Variable tecreset
tecreset=$(tput sgr0)
echo -e "\e[40;38;5;82m Linux \e[30;48;5;82m System Monitor\e[0m"
echo 
echo -e  "\e[32m[+]\e[0m Starting Linux System Monitor\e[0m"
echo 

# Check if connected to Internet or not
ping -c 1 google.com &> /dev/null && echo -e '\E[32m'"Server connected to Internet: $tecreset Connected" || echo -e '\E[32m'"Internet: $tecreset Disconnected"

# Check OS Type
os=$(uname -o)
echo -e '\E[32m'"Operating System Type :" $tecreset $os

# Check OS Release Version and Name
cat /etc/lsb-release
cat /etc/lsb-release | grep 'DISTRIB_ID' | grep -v 'DISTRIB_RELEASE' | grep -v 'DISTRIB_DESCRIPTION' > /tmp/osrelease
echo -n -e '\E[32m'"OS Name :" $tecreset  && cat /tmp/osrelease | grep -v "DISTRIB_RELEASE" | cut -f2 -d\"
echo -n -e '\E[32m'"OS Version :" $tecreset && cat /tmp/osrelease | grep -v "DISTRIB_DESCRIPTION" | cut -f2 -d\"

# Check Architecture
architecture=$(uname -m)
echo -e '\E[32m'"Architecture :" $tecreset $architecture

# Check Kernel Release
kernelrelease=$(uname -r)
echo -e '\E[32m'"Kernel Release :" $tecreset $kernelrelease

# Check hostname
echo -e '\E[32m'"Hostname :" $tecreset $HOSTNAME

# Check Internal IP
internalip=$(hostname -i)
echo -e '\E[32m'"Internal IP :" $tecreset $internalip

#Check External IP
#externalip=$(curl -s ipecho.net/plain;echo)
#echo -e '\E[32m'"External IP : $tecreset "$externalip

# Check DNS
nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
echo -e '\E[32m'"Name Servers :" $tecreset $nameservers 

# Check Logged In Users
who>/tmp/who
echo -e '\E[32m'"Logged In users :" $tecreset && cat /tmp/who 

# Check RAM and SWAP Usages
free -g | grep -v + > /tmp/ramcache
echo -e '\E[32m'"Ram Usages (G) :" $tecreset
cat /tmp/ramcache | grep -v "Swap"
echo -e '\E[32m'"Swap Usages (G) :" $tecreset
cat /tmp/ramcache | grep -v "Mem"

# Check Disk Usages
df -h| grep 'Filesystem\|/dev/sda*' > /tmp/diskusage
echo -e '\E[32m'"Disk Usages :" $tecreset 
cat /tmp/diskusage

# Check Load Average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo -e '\E[32m'"Load Average :" $tecreset $loadaverage

# Check System Uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e '\E[32m'"System Uptime Days/(HH:MM) :" $tecreset $tecuptime
echo -e '\E[32m'"Last Reboot Time - Date : (HH:MM) :\e[0m" `who -b | awk '{print $3,$4}'`

# Unset Variables
unset tecreset os architecture kernelrelease internalip externalip nameserver loadaverage

# Remove Temporary Files
rm /tmp/osrelease /tmp/who /tmp/ramcache /tmp/diskusage
}
fi
shift $(($OPTIND -1))

echo -e '\E[32m'"CPU Load - > Threshold < 1 Normal > 1 Caution , > 2 Unhealthy:\e[0m"
#cpus=`lscpu | grep -e "^CPU(s):" | cut -f2 -d: | awk '{print $1}'`
#i=0
#	while [ $i -lt $cpus ]
#	do
#		echo "CPU$i : `mpstat -P ALL | awk -v var=$i '{ if ($3 == var ) print $4 }' `"
#		let i=$i+1
#		done


echo -e '\E[32m'"Here with uptime command we get load average for system, and cut command helps to process result.
Load Average : `uptime | awk -F'load average:' '{ print $2 }' | cut -f1 -d,`
Heatlh Status : `uptime | awk -F'load average:' '{ print $2 }' | cut -f1 -d, | awk '{if ($1 > 2) print "!!!Unhealthy!!!!"; else if ($1 > 1) print "!!!Caution!!!"; else print "+ Normal +"}'`\e[0m"
echo 
echo -e '\E[32m'"TOP 10: Memory using processs/application :\e[0m"
ps aux | awk '{print $2, $4, $6, $11}' | sort -k3rn | head -n 10
echo 
echo -e '\E[32m'"TOP 10: top CPU using processes :\e[0m"
top b -n1 | head -17 | tail -11
echo 
exit 0

