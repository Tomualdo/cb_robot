#cp -v ~/Documents/coinbase_test/ALGO-EUR/data* ~/coin1/coinbase_test/ALGO-EUR/
#cp -v ~/Documents/coinbase_test/BAND-EUR/data* ~/coin1/coinbase_test/BAND-EUR/
#cp -v ~/Documents/coinbase_test/BCH-EUR/data* ~/coin1/coinbase_test/BCH-EUR/
#cp -v ~/Documents/coinbase_test/BTC-EUR/data* ~/coin1/coinbase_test/BTC-EUR/
#cp -v ~/Documents/coinbase_test/CGLD-EUR/data* ~/coin1/coinbase_test/CGLD-EUR/
#cp -v ~/Documents/coinbase_test/EOS-EUR/data* ~/coin1/coinbase_test/EOS-EUR/
#cp -v ~/Documents/coinbase_test/ETC-EUR/data* ~/coin1/coinbase_test/ETC-EUR/
#cp -v ~/Documents/coinbase_test/LINK-EUR/data* ~/coin1/coinbase_test/LINK-EUR/
#cp -v ~/Documents/coinbase_test/LTC-EUR/data* ~/coin1/coinbase_test/LTC-EUR/
#cp -v ~/Documents/coinbase_test/NMR-EUR/data* ~/coin1/coinbase_test/NMR-EUR/
#cp -v ~/Documents/coinbase_test/OMG-EUR/data* ~/coin1/coinbase_test/OMG-EUR/
#cp -v ~/Documents/coinbase_test/UMA-EUR/data* ~/coin1/coinbase_test/UMA-EUR/
#cp -v ~/Documents/coinbase_test/XLM-EUR/data* ~/coin1/coinbase_test/XLM-EUR/
#cp -v ~/Documents/coinbase_test/XRP-EUR/data* ~/coin1/coinbase_test/XRP-EUR/
#cp -v ~/Documents/coinbase_test/XTZ-EUR/data* ~/coin1/coinbase_test/XTZ-EUR/
#cp -v ~/Documents/coinbase_test/ZRX-EUR/data* ~/coin1/coinbase_test/ZRX-EUR/

for i in $(find ~/Documents/coinbase_ticker/ -maxdepth 1 -type d -name "*-EUR");
do
    #echo ${i}
    #ls ${i}/data* | sort -n | tail -n 1
    #/home/tom/Documents/coinbase_test/XRP-EUR/dataXRP-EUR20210104.json
    
    cp -v `ls ${i}/data* | sort -n | tail -n 5` ~/Documents/coinbase_migrated/cb_robot/${i#/*/*/*/*/}
done
