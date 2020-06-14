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
echo "          +---------------------------------------+         "
echo "          | 1. Install Homebridge and Config UI X |         "
echo "          | 2. Uninstall Homebridge               |         "
echo "          | 3. Homebridge Administration          |         "
echo "          | 4. Get to our GitHub page             |         "
echo "          +---------------------------------------+         "
echo "                    Visit us @ AutoInst.me                  "
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

    echo "Installing Homebridge and Config UI X..."
    npm install -g --unsafe-perm homebridge homebridge-config-ui-x

    #Installing Service and creating User
    hb-service install --user homebridge
  fi

  if [ "$opt2" = "2" ]; then

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

    #Upgrade npm (version 6.13.4 has issues with git dependencies)
    npm install -g npm

    echo "Installing Homebridge and Config UI X..."
    npm install -g --unsafe-perm homebridge homebridge-config-ui-x

    #Installing Service and creating User
    hb-service install --user homebridge
  fi
fi

if [ "$opt1" = "2" ]; then

#Uninstalling the service
hb-service uninstall
npm uninstall -g homebridge homebridge-config-ui-x

echo ""
echo "Homebridge is now uninstalled!"
echo ""
fi

if [ "$opt1" = "3" ]; then
  echo ""
  echo "          +---------------------------------------+         "
  echo "          | 1. Start Homebridge service           |         "
  echo "          | 2. Stop Homebridge service            |         "
  echo "          | 3. Restart Homebridge service         |         "
  echo "          | 4. View logs                          |         "
  echo "          +---------------------------------------+         "
  echo "                                                            "

  read -p "Select your option: " opt3
  echo ""

    if [ "$opt3" = "1" ]; then
      hb-service start
      clear
      echo "Started the Homebridge service!"
    fi

    if [ "$opt3" = "2" ]; then
      hb-service stop
      clear
      echo "Stopped the Homebridge service!"
    fi

    if [ "$opt3" = "3" ]; then
      hb-service restart
      clear
      echo "Restarted the Homebridge service!"
    fi

    if [ "$opt3" = "4" ]; then
      hb-service logs
    fi
fi

if [ "$opt1" = "4" ]; then
  echo "Here is our GitHub page:"
  echo ""
  echo "https://github.com/X19S/AutoInstall-NextCloud"
  echo ""
fi
