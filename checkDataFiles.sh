#!/bin/sh
for i in $(seq 1 2)
do

/home/tom/coin1/coinbase_test/.venv/bin/python3 /home/tom/coin1/coinbase_test/test_ledger_info2.py 1>/dev/null 2>/dev/null
if [ $? -eq 0 ]; then
    echo exit normally
    exit
else
    echo exit ERROR
    echo copy files from ticker...
    sh /home/tom/coin1/coinbase_test/test_copy_ticks.sh
    echo done
fi

done
