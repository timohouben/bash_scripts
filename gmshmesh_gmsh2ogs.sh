#!/bin/bash

# This script generates a Gmsh-.msh file from a Gmsh-.geo input file and convertes the Gmsh-.msh file to an ogs-.msh file. The input file must be a Gmsh-.geo file.

# Set paths of executables first
pathofyourgmshexecutable="/Applications/Gmsh.app/Contents/MacOS/gmsh"
pathofyourgmsh2ogsexecutable="/Users/houben/PhD/executables_scripts/ogs_data_explorer/GMSH2OGS"
pathofyourcorrectionscript="/Users/houben/PhD/python/scripts/regular_grid/"
correctionscript="reg_grid_bottom_values_manu.py"

echo "Path of file and filename to mesh and convert: "
read inputgeo
echo "Extend filename by: "
read extension

$pathofyourgmshexecutable "$inputgeo" -2 -o "${inputgeo%.geo}_${extension}.msh"

inputmesh="${inputgeo%.geo}_${extension}.msh"
outputmesh="${inputmesh%.msh}_ogs.msh"
$pathofyourgmsh2ogsexecutable -i "$inputmesh" -o "$outputmesh"

echo "Do you also want do correct the mesh (y/n)?"
read yes_no

if [ $yes_no == 'y' ]
then
	mv "$outputmesh" "$pathofyourcorrectionscript"
	cd "$pathofyourcorrectionscript"
	./"$correctionscript"
	echo "Your file can be found in /Users/houben/PhD/python/scripts/regular_grid/"
	else
		exit
fi