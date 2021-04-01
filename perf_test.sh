#!/bin/bash

. ./setup.sh

mpse=$1
max=$2
thr="$3"

[ "$thr" ] || thr="1"
[ "$4" ] && confs="$4"

for z in $thr ; do
    for pcap in $SNORT_PCAPS/* ; do
	echo "<<<<<<<<<<<<<< $pcap >>>>>>>>>>>>>"
#        for conf in $confs ; do
		echo "!!!! calling repeat !!!!!!!!"
#            ./repeat.sh $conf.lua $mpse $max $pcap $z
#	    ./repeat.sh detect-min.lua hyperscan 1 pcap/get_1m_8k.pcap
            ./repeat.sh detect-min.lua $mpse $max $pcap $z
#        done
    done
done

