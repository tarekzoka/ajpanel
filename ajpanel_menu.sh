#The revised script appears well-organized and more concise. It performs the following steps:

#1. Determines the package manager and system type (DreamOS or OpenSource).
#2. Removes unnecessary files and folders.
#3. Checks for mounted storage and creates a backup directory if it doesn't exist.
#4. Sets up the update URL for AJPanel.
#5. Downloads and installs various panels and scripts, including icons and commands.
#6. Configures the `ajpanel_menu.xml` and `ajpanel_settings`.
#7. Updates Enigma2 settings and restarts the Enigma2 service.

#Here's the final version of the script:
#```sh

#!/bin/sh
#
echo " download and install panel emil nabil "

# Determine the package manager and system type
if [ -f /etc/apt/apt.conf ]; then
    status='/var/lib/dpkg/status'
    it=DreamOs
    apt install wget >/dev/null 2>&1
else
    status='/var/lib/opkg/status'
    it=OpenSource
    opkg install wget >/dev/null 2>&1
fi

# Remove unnecessary files and folders
[ -d "/CONTROL" ] && rm -r /CONTROL >/dev/null 2>&1
rm -rf /control /postinst /preinst /prerm /postrm /tmp/*.ipk /tmp/*.tar.gz >/dev/null 2>&1

echo ""
echo "> Checking mounted storage, please wait..."
sleep 3

# Check for mounted storage
mrp=("/media/hdd" "/media/usb" "/media/mmc")
for mr in "${mrp[@]}"; do
    if [ -d "$mr" ]; then
        echo "> Mounted storage found at: $mr"
        break
    fi
done

# Create backup directory if it doesn't exist
if [ ! -d "$mr/AJPanel_Backup" ]; then
    mkdir -p $mr/AJPanel_Backup
fi

# Set up update URL
echo "https://raw.githubusercontent.com/biko-73/AjPanel/main/" > $mr/AJPanel_Backup/ajpanel_update_url
echo ""
echo ""

echo "download icons panel"

plugin=AJPanel_Backup
url=https://dreambox4u.com/emilnabil237/plugins/ajpanel/AJPanel_Backup.zip
package=/var/volatile/tmp/$plugin.zip
wget --show-progress -qO $package --no-check-certificate $url
cd /tmp
unzip -qn ./AJPanel_Backup.zip
rm -rf AJPanel_Backup.zip
cp -rf AJPanel_Backup $mr/
rm -rf AJPanel_Backup
cd ..
opkg install curl
sleep 2

# Download and install eliesat panel
cd /tmp
curl -k -Lbk -m 55532 -m 555104 "https://dreambox4u.com/emilnabil237/plugins/ajpanel/eliesat-panel.tar.gz" > /tmp/eliesat-panel.tar.gz
sleep 1
echo "installing ...."
cd /tmp
tar -xzf eliesat-panel.tar.gz -C /
echo ""
sleep 1
cd
rm -f /tmp/eliesat-panel.tar.gz
echo ""

# Download ajpanel_cmd
pack="ajpanel_cmd"
package=$mr/AJPanel_Backup/$pack
url=https://dreambox4u.com/emilnabil237/plugins/ajpanel/ajpanel_cmd
wget --show-progress -qO $package --no-check-certificate $url

##########################
# Download and install emil-panel
wget -O $mr/AJPanel_Backup/ajpanel_menu_Emil.xml "https://dreambox4u.com/emilnabil237/plugins/ajpanel/new/ajpanel_menu_Emil.xml"

echo ""
sleep 2
cd /tmp
curl -k -Lbk -m 55532 -m 555104 "https://dreambox4u.com/emilnabil237/plugins/ajpanel/new/emil-panel-lite.tar.gz" > /tmp/emil-panel-lite.tar.gz
sleep 1
echo "installing ...."
cd /tmp
tar -xzf emil-panel-lite.tar.gz -C /
echo ""
echo ""
echo ""
sleep 1
cd
rm -f /tmp/emil-panel-lite.tar.gz
echo "OK"
cd
echo " Ok Downloaded Panel "
sleep 3
echo
echo "download scripts "
cd /tmp
wget -q "--no-check-certificate" https://github.com/emil237/ajpanel/raw/main/script.tar.gz -O /tmp/script.tar.gz
tar -xzf /tmp/script.tar.gz -C /
sleep 2
rm -f /tmp/script.tar.gz
cd
echo

echo " download panel by Haitham "
sleep 1
cd /tmp
backage="$mr/AJPanel_Backup/"
wget "https://gitlab.com/hmeng80/AjPanel/-/raw/main/ajpanel_menu_Haitham.xml"
cp ajpanel_menu_Haitham.xml $backage
sleep 1
rm -f /tmp/ajpanel_menu_Haitham.xml

echo ""

echo " download panel by Hamdy "
sleep 1
cd /tmp
backage="$mr/AJPanel_Backup/"
wget "https://github.com/Ham-ahmed/Secript-Panel/raw/main/ajpanel_menu_HAN.xml"
mv ajpanel_menu_HAN.xml ajpanel_menu_HA.xml
cp ajpanel_menu_HA.xml $backage
sleep 1
rm -f /tmp/ajpanel_menu_HA.xml

echo ""

echo "download panel by biko_73 "
sleep 1
cd /tmp
backage="$mr/AJPanel_Backup/"
wget "https://github.com/biko-73/AjPanel/raw/main/ajpanel_menu_biko_73.xml"
cp ajpanel_menu_biko_73.xml $backage
sleep 1
rm -f /tmp/ajpanel_menu_biko_73.xml
echo ""

echo "download panel by Tarek_Hanfy "
sleep 1
cd /tmp
backage="$mr/AJPanel_Backup/"
wget "https://github.com/tarekzoka/ajpanel/raw/main/ajpanel_menu_Tarek.xml"
cp ajpanel_menu_Tarek.xml $backage
sleep 1
rm -f /tmp/ajpanel_menu_Tarek.xml
cd
echo ""
cd

echo " download panel by Eliesat "
sleep 1
cd /tmp
backage="$mr/AJPanel_Backup/"
wget "https://gitlab.com/eliesat/eliesatpanel/-/raw/main/ajpanel_menu.xml"
######################
echo "###############################################"
sed -i '/item name="Panel (by Biko73)"/d' 'ajpanel_menu.xml'
sed -i '/item name="Panel (emil)"/d' 'ajpanel_menu.xml'
sed -i '/item name="Panel (by Haitham)"/d' 'ajpanel_menu.xml'
sed -i '/item name="Panel (tarek)"/d' 'ajpanel_menu.xml'
sed -i '/item name="Panel (By Hamdy Ahmed)"/d' 'ajpanel_menu.xml'
sed -i '/item name="Panel (tarek)"/d' 'ajpanel_menu.xml'
echo ""
user_file_exists=true
###########################
#rename file#
mv ajpanel_menu.xml ajpanel_menu_Elie.xml
cp ajpanel_menu_Elie.xml $backage
sleep 1
rm -f /tmp/ajpanel_menu_Elie.xml

echo " Ok downloaded panels "
sleep 3
echo
echo
echo " Uploaded By Emil Nabil "
sleep 4
# Configure ajpanel_menu.xml
espp=$(grep config.plugins.AJPanel.backupPath /etc/enigma2/settings | cut -d '=' -f 2)
ajpanel_menu="ajpanel_menu.xml"
ajpanel_menu_path="$espp$ajpanel_menu"
ajpanel_menu_url="https://dreambox4u.com/emilnabil237/plugins/ajpanel/ajpanel_menu.xml"
echo ""
echo "> $plugin package installed successfully"
echo "> Uploaded By Emil Nabil"
sleep 4
# Get system image version
if [ -f /etc/image-version ]; then
    image=$(grep -iF "creator" /etc/image-version | cut -d "=" -f 2 | xargs)
elif [ -f /etc/issue ]; then
    image=$(awk '{print $1;}' /etc/issue)
else
    image=''
fi

[ ! -z "$image" ] && echo -e "> image: $image"
sleep 3
echo "> Setup The Plugin...."
# Configure ajpanel_settings
touch "$mr/AJPanel_Backup/ajpanel_settings"
cat <<EOF > "$mr/AJPanel_Backup/ajpanel_settings"
config.plugins.AJPanel.backupPath=$mr/AJPanel_Backup/
config.plugins.AJPanel.browserBookmarks=/usr/lib/enigma2/python/Plugins/Extensions/,/tmp/,/
config.plugins.AJPanel.checkForUpdateAtStartup=True
config.plugins.AJPanel.downloadedPackagesPath=$mr/AJPanel_Backup/downloaded-packages/
config.plugins.AJPanel.exportedPIconsPath=$mr/AJPanel_Backup/exported-picons/
config.plugins.AJPanel.exportedTablesPath=$mr/AJPanel_Backup/exported-tables/
config.plugins.AJPanel.FileManagerExit=d
config.plugins.AJPanel.hideIptvServerChannPrefix=True
if [ "$it" == DreamOS ]; then
    config.plugins.AJPanel.iptvAddToBouquetRefType=8193
else
    config.plugins.AJPanel.iptvAddToBouquetRefType=5002
fi
config.plugins.AJPanel.lastFileManFindSrt=/tmp
config.plugins.AJPanel.lastTerminalCustCmdLineNum=307
config.plugins.AJPanel.packageOutputPath=$mr/AJPanel_Backup/create-package-files/
if [ "$it" == DreamOS ]; then
    config.plugins.AJPanel.PIconsPath=$mr/picon/
else
    config.plugins.AJPanel.PIconsPath=/media/hdd/picon/
fi
config.plugins.AJPanel.screenshotFType=png
config.plugins.AJPanel.subtBGTransp=60
config.plugins.AJPanel.subtDelaySec=-1
config.plugins.AJPanel.subtShadowColor=#FF0000
config.plugins.AJPanel.subtTextFg=#FFFF00
EOF

# Update Enigma2 settings
sed -i '/config.plugins.AJPanel../d' /etc/enigma2/settings
grep "config.plugins.AJPanel.*" "$mr/AJPanel_Backup/ajpanel_settings" >> /etc/enigma2/settings
##################################################################################
echo ""
echo " Ok downloaded panels "
sleep 3
echo
echo
echo " Uploaded By Emil Nabil "
sleep 4;
echo "> Setup Done..., Please Wait enigma2 restarting..."

# Restart Enigma2 service or kill enigma2 based on the system
if [ "$it" == DreamOS ]; then
    sleep 2
    systemctl restart enigma2
else
    sleep 2
    killall -9 enigma2
fi

exit 0












