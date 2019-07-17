# Script to extract the results from ogs model runs and copy them into another folder. Script should be executed from a parent directory of multiple ogs runs.

for i in *;
do
	mkdir ${i}_results && cp ${i}/*.tec ${i}/*.ic ${i}/*.mfp ${i}/*.mmp ${i}/*.msh ${i}/*.num ${i}/*.out ${i}/*.pcs ${i}/*.rfd ${i}/*.st ${i}/*.tim ${i}/*.gli ${i}/*.bc ${i}/*.ERR ${i}/*.OUT ${i}/*.vtk ${i}/*.mpd ${i}/*.asc ${i}/*.py ${i}/*.sh ${i}/*.dat ${i}_results;
done
