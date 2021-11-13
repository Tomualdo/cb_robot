for i in $(find . -maxdepth 1 -type d -name "*-EUR");
do
    echo $i
    a=$(ls $i)
    echo ${#a}
    [[ ${#a} -gt 1000 ]] && ls ${i}/data* | sort -n | head -n 1
done
