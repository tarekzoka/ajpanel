#!/bin/bash
######################################################################################
## Command=wget https://raw.githubusercontent.com/tarekzoka/ajpanel/main/installer.sh -O - | /bin/sh
##
###########################################
###########################################
#!/bin/sh
echo
opkg install --force-overwrite https://github.com/tarekzoka/ajpanel/blob/main/enigma2-plugin-extensions-ajpanel_arek-v7.1.0_all.ipk?raw=true
wait
#!/bin/sh
#

wget -O /tmp/enigma2-plugin-extensions-ajpanel_v7.1.0_all.deb "https://github.com/tarekzoka/ajpanel/blob/main/enigma2-plugin-extensions-ajpanel_v7.1.0_all.deb?raw=true"
wait
apt-get update ; dpkg -i /tmp/*.deb ; apt-get -y -f install
wait
dpkg -i --force-overwrite /tmp/*.deb

killall -9 enigma2

sleep 2;

exit 0
######################################################################################
##
echo ""
# Download and install plugin
cd /tmp
set -e
     wget "$MY_URL/$MY_IPK"
  wait
     wget "$MY_URL/$MY_DEB"

 if which dpkg > /dev/null 2>&1; then
		dpkg -i --force-overwrite $MY_DEB; apt-get install -f -y
	else
		$OPKGINSTALL $MY_IPK
	fi
echo "================================="
set +e
cd ..
wait
rm -f /tmp/$MY_IPK
rm -f /tmp/$MY_DEB
	if [ $? -eq 0 ]; then
echo ">>>>  SUCCESSFULLY INSTALLED <<<<"
