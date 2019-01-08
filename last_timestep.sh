declare -i count=0;
for i in *;
  do
    #line = $(wc -l < $i/*.OUT)
    #echo ${line}
    if tail -n 50 $i/*.OUT | grep "Time step:";
    then
      #echo $i is ready, $count;
      count=$count+1;
    else
      echo $i is not ready;
    fi;
  done
