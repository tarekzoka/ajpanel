#!/bin/bash
######################################################################################
## Command=wget https://raw.githubusercontent.com/tarekzoka/ajpanel/main/installer.sh -O - | /bin/sh
##
###########################################
###########################################
#!/bin/sh
echo

opkg install --force-overwrite  https://github.com/tarekzoka/ajpanel/blob/main/enigma2-plugin-extensions-ajpanel_v5.0.1_all.ipk?raw=true
wait
#!/bin/sh
#

wget -O /tmp/ajpanel_v5.1.0_all.deb "https://github.com/tarekzoka/ajpanel/blob/main/enigma2-plugin-extensions-ajpanel_v5.1.0_all.deb?raw=true"
wait
apt-get update ; dpkg -i /tmp/*.deb ; apt-get -y -f install
wait
dpkg -i --force-overwrite /tmp/*.deb
wait
sleep 2;