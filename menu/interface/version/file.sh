#!/bin/bash
#
# [Ansible Role]
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705
# URL:      https://plexguide.com
#
# PlexGuide Copyright (C) 2018 PlexGuide.com
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################
rm -r /var/plexguide/ver.temp 1>/dev/null 2>&1
touch /var/plexguide/ver.temp

### Builds Version List for Display
while read p; do
  echo $p >> /var/plexguide/ver.temp
done </opt/plexguide/menu/interface/version/versions.sh

echo ""
echo "Welcome to the PG Versioning Deployment System!"
cat /var/plexguide/ver.temp
echo ""
echo "To QUIT, type >>> exit"
break=no
while [ "$break" == "no" ]; do
read -p 'Type the [PG Version] for Deployment! (all lowercase): ' typed
typed=($grep /var/plexguide/ver.temp)

if [ "$typed" == "exit" ]; then
  echo ""
  echo "-------------------------------------------------"
  echo "SYSTEM MESSAGE: Exiting Version Install Interface"
  echo "-------------------------------------------------"
  echo ""
  read -n 1 -s -r -p "Press [ANY KEY] to Continue "
  echo ""
  exit
fi

if [ "$typed" != "" ]; then
break=yes
ansible-playbook /opt/plexguide/menu/interface/version/choice.yml
  echo ""
  echo "-------------------------------------------------"
  echo "SYSTEM MESSAGE: Installed Verison - $typed"
  echo "-------------------------------------------------"
  echo ""
  echo $typed > /var/plexguide/pg.number
  touch /var/plexguide/ask.yes
  read -n 1 -s -r -p "Press [ANY KEY] to Continue "
  echo ""
  exit
fi

done