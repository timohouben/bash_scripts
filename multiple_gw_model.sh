#!/bin/bash
# This script executes the gw_model from de Rooij 2012 and stores the output files and plots in a separated folder. It will only work with the file plot.py in the working directory. 

dir_user=0


# specify the STORATIVITIES for groundwater model deRooij 2012
#declare -a storages=(0.0003 0.0006 0.0009 0.0012 0.0015 0.0018 0.0021 0.0024 0.0027 0.003 0.006 0.009 0.012 0.015 0.018 0.021 0.024 0.027 0.03 0.06 0.09 0.12 0.15 0.18 0.21 0.24 0.27 0.3)
declare -a storages=(0.022201 0.022202)
#declare -a names="1E-05 2E-05 3E-05 4E-05 5E-05 6E-05 7E-05 8E-05 9E-05 1E-04 2E-04 3E-04 4E-04 5E-04 6E-04 7E-04 8E-04 9E-04 1E-03 2E-03 3E-03 4E-03 5E-03 6E-03 7E-03 8E-03 9E-03 1E-02"
declare -a names="1E-5 2E-5"
names_arr=($names)

counter=0

for i in "${storages[@]}"
do

	#echo "${i}"
	dir_new="${i}"
	
	new_line="1e-5     30       1000.0     "
	new_line+=$i
	new_line+="       0.0     0.0"
	
	echo $new_line
	sed '3 c\
	'"${new_line}
	"'' Dupuitflow.in > Dupuitflow_neu.in

	cp -f Dupuitflow_neu.in Dupuitflow.in
	rm Dupuitflow_neu.in
	
	
	echo "GW Model de Rooij 2012 started. Folder name: "${names_arr[$counter]}
	start_time="$(date -u +%s)"
	./a
	sleep 1
	echo Done.
	
	# calculate elapsed time and print
	end_time="$(date -u +%s)"
	elapsed="$(($end_time-$start_time))"
	echo "Total of $elapsed seconds elapsed for calculation."
	
	
	
	mkdir ${names_arr[$counter]}
	echo "Plots and .OUT will be moved to folder" ${names_arr[$counter]} "when you close the plot-window."
	./plot.py
	
	mv *.OUT ${names_arr[$counter]}/
	cp *.in ${names_arr[$counter]}/
	mv *.png ${names_arr[$counter]}/
	echo Plots and .OUT saved.
	counter=$((counter + 1))
	
done