declare -i count=0;
for i in *;
  do
    if grep -q "Your simulation is terminated normally" $i/*.OUT;
    then
      echo $i is ready, $count;
      count=$count+1;
    else
      echo $i is not ready;
    fi;
  done
