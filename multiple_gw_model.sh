#!/bin/bash
# This script executes the gw_model from de Rooij 2012 and stores the output files and plots in a separated folder. It will only work with the file plot.py in the working directory. 

dir_user=0


# specify the STORATIVITIES for groundwater model deRooij 2012
declare -a storages=(1E-5 1e-3)
#declare -r thickness=30

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
	
	
	echo "GW Model de Rooij 2012 started. Folder name: "$dir_new
	./a
	sleep 1
	echo Done.
	
	mkdir $dir_new
	echo "Plots and .OUT will be moved to folder" $dir_new "when you close the plot-window."
	./plot.py
	
	mv *.OUT $dir_new/
	cp *.in $dir_new/
	mv *.png $dir_new/
	echo Plots and .OUT saved.
done