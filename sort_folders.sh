#!/bin/bash

# set threshold
declare -a threshold
for i in {1..100};
do
    j=$(($i*10))
    threshold+=(${j})
done
echo Threshold is set as follows: ${threshold[@]}

# print all elements of array
#declare -p threshold
#echo ${threshold[@]}

read -p 'Insert path: ' path

mkdir TEMP
mv * TEMP


for j in "${threshold[@]}";
    do
    mkdir $path/smaller_than_${j}
    for i in `ls -1 $path/TEMP `;
        do
        if ((`echo "$i" | awk -F'_' '{print $1}' | sed 's/^0//g'` < $j));
            then
            mv TEMP/${i} smaller_than_${j}/;
        fi;
    done
done

mv TEMP/* $path
rm -r TEMP
