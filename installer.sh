#!/bin/bash
######################################################################################
## Command=wget https://raw.githubusercontent.com/tarekzoka/ajpanel/main/installer.sh -O - | /bin/sh
##
###########################################
###########################################
#!/bin/sh
echo
opkg install --force-overwrite https://github.com/tarekzoka/ajpanel/blob/main/enigma2-plugin-extensions-ajpanel_v8.8.8_all.ipk?raw=true

killall -9 enigma2

sleep 2;

exit 0
