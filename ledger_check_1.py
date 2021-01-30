import json
import os
from numpy.core.fromnumeric import product
from pprintpp import pprint as pp
from datetime import datetime, timedelta 
import dateutil.parser
import sys
import natsort
from portfolio2 import get_ballance
from product_list import products 

current_product = 'ETC-EUR'
#products = [
#                    "OMG-EUR",
#                    "XRP-EUR",
#                    "XTZ-EUR",
#                    "UMA-EUR",
#                    "CGLD-EUR",
#                    "NMR-EUR",
#                    "ZRX-EUR",
#                    "ALGO-EUR",
#                    "ETC-EUR",
#                    "EOS-EUR",
#                    "BAND-EUR",
#                    "XLM-EUR",
#                    "BCH-EUR",
#                    "BTC-EUR",
#                    "LINK-EUR",
#                    "LTC-EUR",
#                    "FIL-EUR",
#                    "BNT-EUR"
#                    ]

ROOT_DIR = os.path.abspath(os.curdir)

today_total = 0
today_value = 0
total_invested = 0
dic={}
dic_spend_EUR={}
dic_spend_EUR_ooa={}
dic_spend_total={}
dic_coins={}
dic_value={}
dic_profit_loss={}

def ledger_info(current_product,days=0):
    global today_total
    global today_value
    global total_invested
    global dic
    product_folder = ROOT_DIR+'/'+current_product
    # check if file exitst
    if os.path.isfile(product_folder+'/'+current_product+'buys.json'):
        pass
    else:
        return
    ledger_file = product_folder+'/'+current_product+'buys.json'
    with open(ledger_file) as json_ledger_file:
        ledger = json.load(json_ledger_file)

    remain_coins = 0
    total_earn = 0
    today_earn = 0
    remain_spend = 0
    remain_spend_ooa = 0
    
    for records in ledger:
        if ledger[records][0]['sell_flag'] == False:
            if ledger[records][0]['coins'] == 0:
                today_value += 1
                print(current_product,records)


def load_last_close(current_product):
    product_folder = ROOT_DIR+'/'+current_product
    # get files of data files in product folder
    data_files = [name for name in os.listdir(product_folder) if name.startswith("data")]
    pd_list = []

    mer = {}
    if current_product not in mer:
        mer[current_product] =[]
    data_files = data_files = natsort.natsorted(data_files,reverse=False)
    data_files = data_files[-1:] #load last file
    # print(data_files) 
    with open(product_folder+'/'+data_files[0]) as act_file:
        fil = json.load(act_file)
        return float(fil[current_product][-1:][0]['close'])



# pp(load_last_close('OMG-EUR'))

for prd in products:
    if len(sys.argv) > 1:
        days = int((sys.argv[1]))
        ledger_info(prd,days)
    else:
        ledger_info(prd)
        days = 0


# dic = {k: v for k, v in sorted(dic.items(), key=lambda item: item[1])}
dic = sorted(dic.items(), key=lambda x: x[1])
print("EARN:")
pp(dic)

dic_spend_EUR = sorted(dic_spend_EUR.items(),key=lambda x:x[1])
print("SPEND:")
pp(dic_spend_EUR)

dic_spend_EUR_ooa = sorted(dic_spend_EUR_ooa.items(),key=lambda x:x[1])
print("SPEND OOA:")
pp(dic_spend_EUR_ooa)

dic_spend_total = sorted(dic_spend_total.items(),key=lambda x:x[1])
print("SPEND TOTAL:")
pp(dic_spend_total)

dic_coins = sorted(dic_coins.items(),key=lambda x:x[1])
print("COINS:")
pp(dic_coins)

dic_value = sorted(dic_value.items(),key=lambda x:x[1])
print("VALUES:")
pp(dic_value)

dic_profit_loss = sorted(dic_profit_loss.items(),key=lambda x:x[1])
print("PROFIT/LOSS:")
pp(dic_profit_loss)

print("Days {} total earn is: {} e".format(days,today_total))
print("coins at 0 {} ".format(today_value))
bal = round(float(get_ballance()),2)
print("Invested {} e vs. actual {}".format(total_invested,total_invested + today_value + bal))

print("free {} e || total funds if folio {}".format(bal,total_invested + bal))
