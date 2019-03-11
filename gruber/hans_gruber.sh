#!/bin/bash

#    Define Colours

RED='\033[1;31m'
LBLUE='\33[0;34m'
LGREE='\33[0;32m'
LGREE1='\33[1;32m'
NC='\033[0m' # No Color
FLASH='\033[5m'

# SET BASH COLOUR
clear

printf "${LGREE}\n"
printf "${LGREE1}\n"
printf "${LGREE1}\n"
printf "${LGREE1}\n"
printf "${LGREE1}\n"
printf "${LGREE1}\n"
printf "${LGREE1}>>> ${LGREE}Hans Gruber v1.0 - Shaun Keir 2016\n"
printf "${LGREE1}>>> ${LGREE}Nothing special. Just a little bash script\n"
printf "${LGREE1}>>> ${LGREE}to download some settings for my i3 desktop\n ${NC}"
echo
printf "${LGREE}notwitter  |  noemail\n ${NC}"
echo
# echo Your current external IP is:
# dig +short myip.opendns.com @resolver1.opendns.com
printf "${RED}${FLASH}YOU ARE ABOUT TO INSTALL SOFTWARE TO YOUR SYSTEM VIA PACMAN\n${NC}"
printf "${LGREE1}Some may be overwrites - they are installed just to be sure...see below for details\n${NC}"
printf "${LGREE}GIT+WGET+CURL+OPENSSH Enable CLI Install Commands etc.\n${NC}"
printf "${LGREE}GIT+WGET ZIP and UNZIP are Compression Tools\n${NC}"
read -n 1 -s -r -p "Press any key to continue"
echo
sudo pacman -S wget git curl openssh
echo
sudo pacman -S zip unzip
echo
printf "${LGREE1}These following items are for general look and feel\n${NC}"
printf "${LGREE}FEH Enables Wallpapers to be set\n${NC}"
printf "${LGREE}i3STATUS+i3BLOCKS are Status Bars (see i3/config to set which you prefer)\n${NC}"
read -n 1 -s -r -p "Press any key to continue"
echo
sudo pacman -S feh i3status i3blocks dunst
# Start Polybar (can be quirky ---adjust these lines as required---
pacaur -S polybar-git
pacaur -S jsoncpp for arch
sudo ln -s /usr/lib/libjsoncpp.so.20 /usr/lib/libjsoncpp.so.19
# End Polybar
printf "${LGREE}DONE\n${NC}"
sudo pacman -S compton numlockx
printf "${LGREE}DONE\n${NC}"
sudo pacman -S rofi
printf "${LGREE}DONE\n${NC}"
pacaur -S ttf-font-awesome-4
printf "${LGREE}DONE\n${NC}"
printf "${RED}${FLASH}YOU ARE ABOUT TO COPY FILES TO YOUR SYSTEM...SEE MY GITHUB FOR CONTENTS\n${NC}"
read -n 1 -s -r -p "Press any key to continue"
mkdir /home/$USER/NewTheologian
cd /home/$USER/NewTheologian
git clone https://github.com/kjarr/RiceAnPea
cd RiceAnPea
echo
echo
sudo cp -Rf Maclean/. /home/$USER/.config/
sudo cp -Rf config/. /home/$USER/.config/
sudo cp -Rf home/. /home/$USER/
sudo ldconfig
echo "Done!"
# Setting up Launch.sh chmod
cd /home/$USER/.config/polybar/
chmod 700 launch.sh
cd /home/$USER/

#EXIT
echo "You have been Grubered! You can now delete the NewTheologian folder" > /home/$USER/NewTheologian.txt

#Exit if the script is already running, just in case
#Got this part of script somewhere in this forum
if pidof -x $(basename $0) > /dev/null; then
  for p in $(pidof -x $(basename $0)); do
    if [ $p -ne $$ ]; then
      echo "Script $0 is already running: exiting"
      exit
    fi
  done
fi

### DO NOT EDIT BELOW THIS LINE ###
### ANIM INSPIRED BY DANIEL KNIGHT - DIETPI ###
{


  INPUT=0
  if [[ $1 =~ ^-?[0-9]+$ ]]; then
    INPUT=$1
  fi

  #/////////////////////////////////////////////////////////////////////////////////////
  #Anim_0 processing
  #/////////////////////////////////////////////////////////////////////////////////////

  Anim_0(){

    local MAX_COUNT=28
    ((MAX_COUNT--))

    local count=0
    local mode=0
    local MAX_PASSES=2

    local passes=0

    local marker=(

      '* NEWTHEOLOGIAN.COM - HANS GRUBER COMPLETE! *'
      '---------------------------------------------'
      '|-------------------------------------------|'
      '-|-----------------------------------------|-'
      '--|---------------------------------------|--'
      '---|-------------------------------------|---'
      '----|-----------------------------------|----'
      '-----|---------------------------------|-----'
      '------|-------------------------------|------'
      '-------|-----------------------------|-------'
      '--------|---------------------------|--------'
      '---------|-------------------------|---------'
      '----------|-----------------------|----------'
      '-----------|---------------------|-----------'
      '------------|-------------------|------------'
      '-------------|-----------------|-------------'
      '--------------|---------------|--------------'
      '---------------|-------------|---------------'
      '----------------|-----------|----------------'
      '-----------------|---------|-----------------'
      '------------------|-------|------------------'
      '-------------------|-----|-------------------'
      '--------------------|---|--------------------'
      '---------------------|-|---------------------'
      '----------------------|----------------------'

    )

    while (( $passes < $MAX_PASSES ))
    do
      if (( $mode == 0 )); then
        ((count++))
        if (( $count >= $MAX_COUNT )); then
          count=$MAX_COUNT
          mode=1
          ((passes++))
        fi
      elif (( $mode == 1 )); then
        ((count--))
        if (( $count <= 0 )); then
          count=0
          mode=0
          ((passes++))
        fi
      fi

      #color=$((228 + $count))
      color=154

      #echo -ne "${marker[$count]}\r"

      echo -ne "\e[38;5;${color}m ${marker[$count]}\r"
      #echo -e "\e[38;5;${color}m ${marker[$count]}\r"

      #echo -e "\e[38;5;154m ${marker[$count]}\r"

      #fSleep="0.0$count"
      local fSleep=0.03
      sleep "$fSleep"

    done

    unset marker

  }

   #/////////////////////////////////////////////////////////////////////////////////////
  #Main Loop
  #/////////////////////////////////////////////////////////////////////////////////////
  #----------------------------------------------------------------
  #Hide cursor
  tput civis
  #----------------------------------------------------------------
  # Run
  Anim_"$INPUT"
  #----------------------------------------------------------------
  #Put colours back to normal
  echo -e "\e[0m"

  #Move a line down
  echo -e ""
  #----------------------------------------------------------------
  #enable cursor
  tput cnorm
  #-----------------------------------------------------------------------------------
  exit
  #-----------------------------------------------------------------------------------
}
