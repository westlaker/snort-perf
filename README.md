# snort3-perf

This is for running performance test with snort 3, adopted from snort3_demo/perf/3.0

The PCAP file we focus on is get_1m_9k.pcap, but limited to it. You can add more PCAP files into pcap directory:

[ -d "$SNORT_PCAPS" ] || SNORT_PCAPS=$PWD/pcap

Please grab this file https://snort.org/downloads/openappid/16584 -O snort-openappid.tar.gz
and place it into obp directory:

[ -d "$SNORT_ODP" ] || export SNORT_ODP="$PWD"

Note that that get_1m_9k.pcap has 8K packets so you will have to add a snaplen arg to the command line to properly process it. 
You can do that by adding -s 9000 below:

args="--warn-all --plugin-path $plugs $daq -H -Q -s 9000"

To run testing:

1) Validate:

validate.sh $conf.lua $mpse $num $pcap $z

- conf = decode | inspect | detect-max | detect-min | network-awareness | stream
- mpse = hyperscan | ac_full | ac_bnfa
- max = 1
- pcap
- z = number of threads

./validate.sh decode.lua hyperscan 1 pcap/get_1m_8k.pcapA
./validate.sh inspect.lua hyperscan 1 pcap/get_1m_8k.pcap 
./validate.sh detect-max.lua hyperscan 1 pcap/get_1m_8k.pcap 
./validate.sh detect-min.lua hyperscan 1 pcap/get_1m_8k.pcap
./validate.sh network-awareness.lua hyperscan 1 pcap/get_1m_8k.pcap
./validate.sh stream.lua hyperscan 1 pcap/get_1m_8k.pcap 

2) Individual Performance Test:

repeat.sh $conf.lua $mpse $num $pcap $z

- conf = decode | inspect | detect-max | detect-min | network-awareness | stream
- mpse = hyperscan | ac_full | ac_bnfa
- num = number of repeating test
- pcap
- z = number of threads

./repeat.sh decode.lua hyperscan 1 pcap/get_1m_8k.pcap
./repeat.sh stream.lua hyperscan 1 pcap/get_1m_8k.pcap
./repeat.sh inspect.lua hyperscan 1 pcap/get_1m_8k.pcap
./repeat.sh detect-min.lua hyperscan 1 pcap/get_1m_8k.pcap
./repeat.sh detect-max.lua hyperscan 1 pcap/get_1m_8k.pcap
./repeat.sh network-awareness.lua hyperscan 1 pcap/get_1m_8k.pcap

