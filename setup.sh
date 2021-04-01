# export or set the following SNORT3_* and SNORT_* variables

[ -d "$SNORT3_BUILD" ] || SNORT3_BUILD=/usr/local/
[ -d "$SNORT3_DAQ_DIR" ] && daq_dir="--daq-dir $SNORT3_DAQ_DIR"

[ -e "$SNORT3_MIN_RULES" ] || SNORT3_MIN_RULES=max.rules
[ -e "$SNORT3_MAX_RULES" ] || SNORT3_MAX_RULES=max.rules

[ -d "$SNORT_PCAPS" ] || SNORT_PCAPS=$PWD/pcap
# wget https://snort.org/downloads/openappid/16584 -O snort-openappid.tar.gz
# place it here
[ -d "$SNORT_ODP" ] || export SNORT_ODP="$PWD"

export SNORT_LUA_PATH=$SNORT3_BUILD/etc/snort/

snort=$SNORT3_BUILD/bin/snort
plugs=$SNORT3_BUILD/lib64

confs="decode stream inspect detect-min detect-max network-awareness"
daq="$daq_dir --daq dump --daq-var output=none"
# Note that that get_1m_9k.pcap has 8K packets so you will have to add 
# a snaplen arg to the command line to properly process it. 
# You can do that by adding -s 9000 below
#args="--warn-all --plugin-path $plugs $daq -H -Q"
args="--warn-all --plugin-path $plugs $daq -H -Q -s 9000"
runt="seconds:"
mbps="Mbits/sec:"

