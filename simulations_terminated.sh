#!/bin/bash
declare -i count=0;
ready=();
not_ready=$(date);
not_ready+="\n######################################################################"
for i in *;
  do
    #line = $(wc -l < $i/*.OUT)
    #echo ${line}
    if tail -n 50 $i/*.OUT | grep -q "Your simulation is terminated normally";
    then
	echo $i is ready, $count;
	count=$count+1;
	ready+=" $i";
    elif tail -n 1 $i/*.OUT | grep -q "Executing ConstructGrid() ...";
    then
        echo $i is still constructing the grid;
	not_ready+="\n $i is still constructing the grid"
    else
	echo $i is not ready. Last time step: $(tail -n 100 $i/*.OUT | grep "Time step:");
	not_ready+="\n $i Last time step: $(tail -n 100 $i/*.OUT | grep "Time step:")";
    fi;
  done
echo $ready >> ready.txt
echo -e $not_ready >> not_ready.txt