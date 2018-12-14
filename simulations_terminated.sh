declare -i count=0;
for i in *;
  do
    #line = $(wc -l < $i/*.OUT)
    #echo ${line}
    if tail -n 5 $i/*.OUT | grep -q "Your simulation is terminated normally";
    then
      echo $i is ready, $count;
      count=$count+1;
    else
      echo $i is not ready. Last time step: $(tail -n 100 $i/*.OUT | grep "Time step:");
    fi;
  done
