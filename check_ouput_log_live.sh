[ $(expr `date +%s` - `stat -c%Y /home/tom/coin_real.log`) -ge 150 ] && sudo systemctl restart coin_real.service || echo "restart not needed"
