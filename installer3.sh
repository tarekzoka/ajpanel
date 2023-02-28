#!/bin/sh

#wget -q "--no-check-certificate" https://raw.githubusercontent.com/tarekzoka/ajpanel/main/installer3.sh -O - | /bin/sh

##########################################
version=8.4.0
#############################################################
TEMPATH=/tmp
OPKGINSTALL="opkg install --force-overwrite"
MY_IPK="enigma2-plugin-extensions-ajpanel_v8.6.1_all.ipk"
MY_DEB="enigma2-plugin-extensions-ajpanel_v8.6.1_all.deb"
MY_URL="https://raw.githubusercontent.com/tarekzoka/ajpanel/main"
# remove old version #
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/AJPan

echo ""
# Download and install plugin
cd /tmp
set -e
 if which dpkg > /dev/null 2>&1; then
  wget "$MY_URL/$MY_DEB"
		dpkg -i --force-overwrite $MY_DEB; apt-get install -f -y
wait
rm -f $MY_DEB
	else
  wget "$MY_URL/$MY_IPK"
		$OPKGINSTALL $MY_IPK
wait
rm -f $MY_IPK
	fi
echo "================================="
set +e
cd ..
wait
	if [ $? -eq 0 ]; then
echo ">>>>  SUCCESSFULLY INSTALLED <<<<"
fi
		echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   TAREK_HANFY "   
sleep 4;
echo "**********************************************************************************"
wait
exit 0  cc


