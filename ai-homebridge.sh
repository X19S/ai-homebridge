#!/bin/bash

echo "                                                            "
echo "                        %%%%%%%%%%%%                        "
echo "                  %%%%%%%%%%%%%%%%%%%%%%%%%                 "
echo "               %%%%%%%%%%%#%%%%%%%#%%%%%%%%%%%              "
echo "            %%%%%%%%%%##%%%       %%%%%%%%%%%%%%%           "
echo "          %%%%%%%%%%%%%%%   %%%%%   %       %%%%%%%         "
echo "         %%%%%%%%%%%%%   %%%%%%%%%%%   %%%  %%%%%%%%        "
echo "        %%%%%%%%%%%%   %%%%%      %%%% %%%  %%%%%%%%%       "
echo "       %%%%%%%%%%   %%%%%   %%%%%   %%%%%%  %%%%%%%%%%      "
echo "      %%%%%%%%%   %%%%(   %%%%%%%%%%   %%%%   %%%%%%%%%     "
echo "      %%%%%%%  %%%%%   %%%%      (%%%%   %%%%%   %%%%%%     "
echo "      %%%%%%%   %.  ,%%%%   %%%%%   %%%%%   %%%%%%%%%%%     "
echo "      %%%%%%%%%   %%%%   %%%%%%%%%%#   %%%%  %%%%%%%%%%     "
echo "       %%%%%%%%%%%%%   %%%%,      %%%%     ,%%%%%%%%%%      "
echo "        %%%%%%%%%%%%   %%   %%%%%   %%%%%%%%%%%%%%%%%       "
echo "         %%%%%%%%%%%%%%  %%%%%%%%%%  *%%%%%%%%%%%%%%        "
echo "          %%%%%%%%%%%%%%%%%%%%%%%   %%%%%%%%%%%%%%%         "
echo "            %%%%%%%%%%%%%%%%%%    %%%%%%%%%%%%%%%           "
echo "               %%%%%%%%%%%%%%%*(%%%%%%%%%%%%%%              "
echo "                  %%%%%%%%%%%%%%%%%%%%%%%%%                 "
echo "                        &%%%%%%%%%%%&                       "
echo "                                                            "
echo " 1. Install Homebridge and Config UI X"
echo " 2. Uninstall Homebridge"
echo " 3. Get to our GitHub page"
echo ""
echo " Made by AutoInst.me"
echo ""
echo ""

read -p "Select your option: " opt1
echo ""

if [ "$opt1" = "1" ]; then

  echo ">>> Which distro? <<<"
  echo " 1. Ubuntu/Debian"
  echo " 2. RaspiOS"
  echo ""
  echo ""

  read -p "Select your option: " opt2
  echo ""

  if [ "$opt2" = "1" ]; then

    echo "Updating system..."

    #Install Updates
    apt -y update
    apt -y dist-upgrade
    clear

    echo "Installing Node.js and dependencies..."

    #Setup repo
    curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -

    #Install Node.js
    apt install -y nodejs gcc g++ make python
    clear

    echo "Installing Homebridge and Homebridge Config UI X..."
    npm install -g --unsafe-perm homebridge homebridge-config-ui-x

    #Installing Service and creating User
    hb-service install --user homebridge

    echo "Homebridge is now installed!"
    echo "http://<ip address of your server>:8581"
    echo "User: admin   Pass: admin"
  fi
fi

if [ "$opt1" = "2" ]; then

#Uninstalling the service
hb-service uninstall
npm uninstall -g homebridge homebridge-config-ui-x

echo "Homebridge is now uninstalled!"
fi
