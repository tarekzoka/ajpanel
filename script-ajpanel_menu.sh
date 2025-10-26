wget "https://raw.githubusercontent.com/tarekzoka/ajpanel/main/ajpanel_menu.tar.gz"

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
