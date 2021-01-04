for i in $(find . -maxdepth 1 -type d -name "*-EUR");
do
    ls ${i}/data* | sort -n | head -n 1 | zip -rm ${i}/archive.zip -@;
done
