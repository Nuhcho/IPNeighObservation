#!/bin/sh

bh_ap="ath11"

echo "time IDLE Status" > /tmp/ipNeighFix.txt

while [ 1 ]; do
    t=$(date +%T)
    wlanconfigValue=$(wlanconfig $bh_ap list | head -n2 | tail -n1 | tr -s ' ' | cut -d' ' -f9)
    ipNeighValue=$(ip -4 neigh | head -n1 | tail -n1 | tr -s ' ' | cut -d' ' -f6)
    echo $t $wlanconfigValue $ipNeighValue >> /tmp/ipNeighFix.txt
    sleep 15
done
