#!/bin/sh
#

wget -O /tmp/Tarek-panel.tar.gz "https://gitlab.com/hanfy1971/plugin/-/raw/main/MohamedStore-panel/Tarek-panel.tar.gz"

tar -xzf /tmp/Tarek-panel.tar.gz -C /

wait

rm -f /tmp/Tarek-panel.tar.gz
echo "   UPLOADED BY  >>>>   TAREK_HANFY "   
sleep 4;                                                                                                                  
echo ". >>>>         RESTARING     <<<<"
"**********************************************************************************"
wait
killall -9 enigma2
exit 0
