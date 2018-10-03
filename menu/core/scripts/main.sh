#!/bin/bash
#
# [Ansible Role]
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705 & Deiteq
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
echo "on" > /var/plexguide/final.choice
echo "removal" > /var/plexguide/type.choice ## temp
program=$(cat /var/plexguide/type.choice)

menu=$(echo "on")

while [ "$menu" != "break" ]; do
menu=$(cat /var/plexguide/appguard.menu)
bash /opt/plexguide/menu/interface/$program/file.sh
menu=$(cat /var/plexguide/appguard.menu)

finalchoice=$(cat /var/plexguide/final.choice)
if [ "$menu" == "2" ]; then
  bash /opt/plexguide/menu/interface/$program/file.sh
fi

if [ "$menu" == "3" ]; then
  bash /opt/plexguide/menu/interface/$program/file.sh
fi

if [ "$menu" == "4" ]; then
  bash /opt/plexguide/menu/interface/$program/file.sh
fi

echo 'INFO - Looping: PG Authentication Interface' > /var/plexguide/pg.log && bash /opt/plexguide/roles/log/log.sh
done

echo 'INFO - Selected: Exiting ' > /var/plexguide/pg.log && bash /opt/plexguide/roles/log/log.sh