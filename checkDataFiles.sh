#!/bin/sh
for i in $(seq 1 2)
do
date >> ~/portfolio_gains.txt
/home/tom/Documents/coinbase_migrated/cb_robot/.venv/bin/python3 /home/tom/Documents/coinbase_migrated/cb_robot/test_ledger_info2.py | tail -n5 >> ~/portfolio_gains.txt
if [ $? -eq 0 ]; then
    echo exit normally
    exit
else
    echo exit ERROR
    echo copy files from ticker...
    sh /home/tom/Documents/coinbase_migrated/cb_robot/test_copy_ticks.sh
    echo done
fi

done
