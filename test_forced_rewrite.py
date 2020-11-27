import json
import os

current_product = 'TEST-EUR'

ROOT_DIR = os.path.abspath(os.curdir)
product_folder = ROOT_DIR+'/'+current_product
strategy_file = product_folder+'/'+current_product+'-strategy.json'

def forced_rewrite(strategy_file):

    with open(strategy_file ,'r+') as new_file:
        strategy_data = json.load(new_file)
        strategy_data['forced_buy'] = False
        new_file.seek(0)
        new_file.truncate()        
        json.dump(strategy_data,new_file,indent=4)

forced_rewrite(strategy_file)