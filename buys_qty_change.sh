find . -name "*strategy.json" | xargs grep "max_buys"
[ -z $1 ] || [ -z $2 ] && echo "Change max_buys and ooa_max_buys <ARG1> to <ARG2>" && exit 1
find . -name "*strategy.json" | xargs sed -i "s/\"max_buys\": $1/\"max_buys\": $2/g"
find . -name "*strategy.json" | xargs sed -i "s/\"ooa_max_buys\": $1/\"ooa_max_buys\": $2/g"
find . -name "*strategy.json" | xargs grep "max_buys"
