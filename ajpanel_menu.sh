#!/bin/sh
#

wget -O /tmp/ajpanel_menu.tar.gz "https://raw.githubusercontent.com/tarekzoka/ajpanel/main/ajpanel_menu.tar.gz"

tar -xzf /tmp/*.tar.gz -C /

rm -r /tmp/ajpanel_menu.tar.gz

killall -9 enigma2

sleep 2;

