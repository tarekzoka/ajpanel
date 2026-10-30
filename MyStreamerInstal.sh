#!/bin/sh

# color
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Show title
echo -e "${CYAN}"
echo "##################################################"
echo "#    IPAudioPro Installation Script    #"
echo "#                   Version 00                  #"
echo "##################################################"
echo -e "${NC}"
sleep 2s

# Remove unnecessary files and folders
echo -e "${YELLOW}> Removing unnecessary files and folders...${NC}"
sleep 2s

if [ -d "/CONTROL" ]; then
    rm -r /CONTROL >/dev/null 2>&1
    echo -e "${GREEN}✓ Removed /CONTROL directory${NC}"
fi

directories="/control /postinst /preinst /prerm /postrm"
for dir in $directories; do
    if [ -d "$dir" ] || [ -f "$dir" ]; then
        rm -rf "$dir" >/dev/null 2>&1
        echo -e "${GREEN}✓ Removed $dir${NC}"
    fi
done

# Clean temporary files
echo -e "${YELLOW}> Cleaning temporary files...${NC}"
rm -rf /tmp/*.ipk >/dev/null 2>&1
rm -rf /tmp/*.tar.gz >/dev/null 2>&1
echo -e "${GREEN}✓ Temporary files cleaned${NC}"

# Settings
plugin=MyStreamer
version=00
url=https://raw.githubusercontent.com/tarek1902/MyStreamer/refs/heads/main/MyStreamer.tar.gz
package=/var/volatile/tmp/$plugin-$version.tar.gz

# Download and install
echo ""
echo -e "${BLUE}> Downloading $plugin-$version package please wait...${NC}"
sleep 3s

# Progress bar during download
echo -e "${CYAN}"
wget --show-progress -qO $package --no-check-certificate $url
echo -e "${NC}"

# Check if the download was successful
if [ ! -f "$package" ]; then
    echo -e "${RED}❌ Download failed!${NC}"
    echo -e "${RED}> $plugin-$version package download failed${NC}"
    sleep 3s
    exit 1
fi

echo -e "${GREEN}✓ Download completed successfully${NC}"
echo -e "${YELLOW}> Extracting package...${NC}"

# Extract files
tar -xzf $package -C /
extract=$?
rm -rf $package >/dev/null 2>&1

echo ""
if [ $extract -eq 0 ]; then
    echo -e "${GREEN}"
    echo "######################################################"
    echo "#              INSTALLED SUCCESSFULLY                #"
    echo "#           Enigma2 restart is required              #"
    echo "#        .::UPLOADED BY  >>>>   TAREK-HANFY::.       #"
    echo "######################################################"
    echo -e "${YELLOW}"
    echo "########################################"
    echo "########################################"
    echo -e "${NC}"
    sleep 3s
    
    # إضافة ريستارت بعد 3 ثواني
    echo -e "${RED}> killall -9 enigma2 in 3 seconds...${NC}"
    echo -e "${YELLOW}> Press Ctrl+C to cancel killall -9 enigma2${NC}"
    sleep 3s
    echo -e "${RED}> killall -9 enigma2 now...${NC}"
    sleep 1s
    reboot
    
else
    echo -e "${RED}"
    echo "######################################"
    echo "#       INSTALLATION FAILED          #"
    echo "######################################"
    echo -e "${NC}"
    echo -e "${RED}> $plugin-$version package installation failed${NC}"
    sleep 3s
fi

# Closing message
echo ""
echo -e "${CYAN}###########################${NC}"
echo -e "${WHITE}Script execution completed${NC}"
echo -e "${CYAN}###########################${NC}"

