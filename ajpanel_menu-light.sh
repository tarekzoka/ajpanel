#!/bin/sh
#

wget -O /media/hdd/AJPanel_Backup/ajpanel_menu_Tarek.xml "https://raw.githubusercontent.com/tarekzoka/ajpanel/main/ajpanel_menu_Tarek.xml"
wait
wget -O /media/sda1/AJPanel_Backup/ajpanel_menu_Tarek.xml "https://raw.githubusercontent.com/tarekzoka/ajpanel/main/ajpanel_menu_Tarek.xml"
wait
wget -O /media/dreambox-storage/AJPanel_Backup/ajpanel_menu_Tarek.xml "https://raw.githubusercontent.com/tarekzoka/ajpanel/main/ajpanel_menu_Tarek.xml"
wait
wget -O /media/usb/AJPanel_Backup/ajpanel_menu_Tarek.xml "https://raw.githubusercontent.com/tarekzoka/ajpanel/main/ajpanel_menu_Tarek.xml"

sleep 2;

wait

exit 0  


