#!/bin/bash
# This script executes the gw_model from de Rooij 2012 and stores the output files and plots in a separated folder. It will only work with the file plot.py in the working directory. 

dir_user=0
echo "Enter a name for directory:"
read dir_user

if [ $dir_user = '\n' ]
then
	dir_new=`date +%Y%m%d_%Hh%Mm%Ss`
else
	dir_new=$dir_user
fi

echo "GW Model de Rooij 2012 started. Date and Time: "$dir_new
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