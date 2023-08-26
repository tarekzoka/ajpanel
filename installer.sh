#!/bin/bash
######################################################################################
## Command=wget https://raw.githubusercontent.com/tarekzoka/ajpanel/main/installer.sh -O - | /bin/sh
##
###########################################
###########################################
#!/bin/sh
#

wget -O /tmp/ajpanel.tar.gz "https://raw.githubusercontent.com/tarekzoka/ajpanel/main/ajpanel.tar.gz"

tar -xzf /tmp/*.tar.xz -C /

rm -r /tmp/ajpanel.tar.gz

killall -9 enigma2

sleep 2;
