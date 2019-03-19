
iterator=(1 2 3)

index=1

for i in "${iterator[@]}"
do
  echo $index
  awk -v a="$index" '{ print $a }' Hinitial_multi.in

  printf "%s\n" "${locations[@]}" > locations.txt
  printf "%s\n" "${head[@]}" > head.txt

  paste locations.txt head.txt | column -s $'\t' -t > Hinitial.in
  index=$((index + 1))
done


if [ $multiple_initials -eq 1 ]; then
  awk -v a="$index" '{ print $a }' Hinitial_multi.in > heads_temp.txt
  #printf "%s\n" "${locations[@]}" > locations_temp.txt
  paste OutputLocations.in heads_temp.txt | column -t > Hinitial.in
  #paste OutputLocations.in heads_temp.txt | column -s $'\t' -t > Hinitial.in
  rm locations_temp.txt
  rm heads_temp.txt
  index=$((index + 1))
fi


NICHT VOLLSTÄNDIG!!
