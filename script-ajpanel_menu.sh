#!/bin/bash
#
# Command: wget -q "--no-check-certificate" https://raw.githubusercontent.com/tarekzoka/ajpanel/refs/heads/main/script-ajpanel_menu.sh -O - | /bin/sh #
echo "------------------------------------------------------------------------"
echo "                     Installing ajpanel_menu"
echo "------------------------------------------------------------------------" "https://raw.githubusercontent.com/tarekzoka/ajpanel/main/ajpanel_menu.tar.gz"

tar -xzf ajpanel_menu.tar.gz  -C /

wait
rm -f /tmp/ajpanel_menu.tar.gz
echo "   UPLOADED BY  >>>>   TAREK-HANFY "   
sleep 4;                                                                                                                  
echo ". >>>>         RESTARING     <<<<"
echo BY-TAREK-HANFY   "**********************************************************************************"
wait
killall -9 enigma2
exit 0  
