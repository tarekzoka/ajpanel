#!/bin/sh
#

wget -O /tmp/panel%20by%20Haitham.tar.gz "https://raw.githubusercontent.com/Haithameng84/panel/main/panel%20by%20Haitham.tar.gz"

tar -xzf /tmp/*.tar.gz -C /

rm -r /tmp/panel%20by%20Haitham.tar.gz

killall -9 enigma2

sleep 2;
