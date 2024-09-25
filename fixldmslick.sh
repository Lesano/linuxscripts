#!/bin/bash
echo "This working for lightDM Slick Greeter, not tested on others."
echo "Adding $USER group"
sudo groupadd $USER
echo "Adding lightdm to $USER group"
sudo usermod -a -G $USER lightdm
echo "Changing files to group"
sudo chgrp $USER /home/$USER -Rv
echo "Permission to $USER"
sudo chmod 750 /home/$USER -Rv
echo "Done, logout."
