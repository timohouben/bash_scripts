#!/bin/bash

pwd
pwd
pwd
pwd

echo "Is it the right folder? Do you want to delete all ogs OUTPUT files in subdirectories? (y/n/q)"
#read -p "enter a value: " -i default -e output


read output
#output="${output:=y}"

 #"Is it the right folder? Do you want to delete all ogs OUTPUT files in subdirectories? (y/n)" -i "y" results

if [ $output == 'y' ]
then
	echo "### OUTPUT files have been deleted ###"
	rm -r *.tec &> /dev/null
#	rm -r *.asc &> /dev/null
	rm -r *.log &> /dev/null
	rm -r *.vtu &> /dev/null
	rm -r *.pvd &> /dev/null
	rm -r *.vtk &> /dev/null
#	rm -r **/*.asc &> /dev/null
	rm -r **/*.tec &> /dev/null
	rm -r **/*.log &> /dev/null
	rm -r **/*.vtu &> /dev/null
	rm -r **/*.pvd &> /dev/null
	rm -r **/*.vtk &> /dev/null
	rm -r **/**/*.tec &> /dev/null
#	rm -r **/**/*.asc &> /dev/null
	rm -r **/**/*.log &> /dev/null
	rm -r **/**/*.vtu &> /dev/null
	rm -r **/**/*.pvd &> /dev/null
	rm -r **/**/*.vtk &> /dev/null
	rm -r **/**/**/*.tec &> /dev/null
#	rm -r **/**/**/*.asc &> /dev/null
	rm -r **/**/**/*.log &> /dev/null
	rm -r **/**/**/*.vtu &> /dev/null
	rm -r **/**/**/*.pvd &> /dev/null
	rm -r **/**/**/*.vtk &> /dev/null
	
	echo "Do you also want to delete the ogs INPUT files in subdirectories? (y/n/q)"
	read input
	
	if [ $input == 'y' ]
	then
		echo "### INPUT files have been deleted, too ###"
		rm -r *.bc &> /dev/null
		rm -r *.gli &> /dev/null
		rm -r *.ic &> /dev/null
		rm -r *.mfp &> /dev/null
		rm -r *.mmp &> /dev/null
		rm -r *.msh &> /dev/null
		rm -r *.num &> /dev/null
		rm -r *.out &> /dev/null
		rm -r *.pcs &> /dev/null
		rm -r *.rfd &> /dev/null
		rm -r *.st &> /dev/null
		rm -r *.tim &> /dev/null
		rm -r **/*.bc &> /dev/null
		rm -r **/*.gli &> /dev/null
		rm -r **/*.ic &> /dev/null
		rm -r **/*.mfp &> /dev/null
		rm -r **/*.mmp &> /dev/null
		rm -r **/*.msh &> /dev/null
		rm -r **/*.num &> /dev/null
		rm -r **/*.out &> /dev/null
		rm -r **/*.pcs &> /dev/null
		rm -r **/*.rfd &> /dev/null
		rm -r **/*.st &> /dev/null
		rm -r **/*.tim &> /dev/null
		rm -r **/**/*.bc &> /dev/null
		rm -r **/**/*.gli &> /dev/null
		rm -r **/**/*.ic &> /dev/null
		rm -r **/**/*.mfp &> /dev/null
		rm -r **/**/*.mmp &> /dev/null
		rm -r **/**/*.msh &> /dev/null
		rm -r **/**/*.num &> /dev/null
		rm -r **/**/*.out &> /dev/null
		rm -r **/**/*.pcs &> /dev/null
		rm -r **/**/*.rfd &> /dev/null
		rm -r **/**/*.st &> /dev/null
		rm -r **/**/*.tim &> /dev/null
		rm -r **/**/**/*.bc &> /dev/null
		rm -r **/**/**/*.gli &> /dev/null
		rm -r **/**/**/*.ic &> /dev/null
		rm -r **/**/**/*.mfp &> /dev/null
		rm -r **/**/**/*.mmp &> /dev/null
		rm -r **/**/**/*.msh &> /dev/null
		rm -r **/**/**/*.num &> /dev/null
		rm -r **/**/**/*.out &> /dev/null
		rm -r **/**/**/*.pcs &> /dev/null
		rm -r **/**/**/*.rfd &> /dev/null
		rm -r **/**/**/*.st &> /dev/null
		rm -r **/**/**/*.tim &> /dev/null
	
	elif [ $input == 'q' ]
	then	
		exit	
	else
		echo "### only OUTPUT files have been deleted ###"	
	fi	
	
elif [ $output == 'q' ]
then	
	exit
	
elif [ $output == 'n' ]
then
	echo "Do you want to delete the ogs INPUT files in subdirectories instead? (y/n/q)"
	read input
		if [ $input == 'y' ]
		then
			echo "### ogs INPUT files have been deleted ###"
			rm -r *.bc &> /dev/null
			rm -r *.gli &> /dev/null
			rm -r *.ic &> /dev/null
			rm -r *.mfp &> /dev/null
			rm -r *.mmp &> /dev/null
			rm -r *.msh &> /dev/null
			rm -r *.num &> /dev/null
			rm -r *.out &> /dev/null
			rm -r *.pcs &> /dev/null
			rm -r *.rfd &> /dev/null
			rm -r *.st &> /dev/null
			rm -r *.tim &> /dev/null
			rm -r **/*.bc &> /dev/null
			rm -r **/*.gli &> /dev/null
			rm -r **/*.ic &> /dev/null
			rm -r **/*.mfp &> /dev/null
			rm -r **/*.mmp &> /dev/null
			rm -r **/*.msh &> /dev/null
			rm -r **/*.num &> /dev/null
			rm -r **/*.out &> /dev/null
			rm -r **/*.pcs &> /dev/null
			rm -r **/*.rfd &> /dev/null
			rm -r **/*.st &> /dev/null
			rm -r **/*.tim &> /dev/null
			rm -r **/**/*.bc &> /dev/null
			rm -r **/**/*.gli &> /dev/null
			rm -r **/**/*.ic &> /dev/null
			rm -r **/**/*.mfp &> /dev/null
			rm -r **/**/*.mmp &> /dev/null
			rm -r **/**/*.msh &> /dev/null
			rm -r **/**/*.num &> /dev/null
			rm -r **/**/*.out &> /dev/null
			rm -r **/**/*.pcs &> /dev/null
			rm -r **/**/*.rfd &> /dev/null
			rm -r **/**/*.st &> /dev/null
			rm -r **/**/*.tim &> /dev/null
			rm -r **/**/**/*.bc &> /dev/null
			rm -r **/**/**/*.gli &> /dev/null
			rm -r **/**/**/*.ic &> /dev/null
			rm -r **/**/**/*.mfp &> /dev/null
			rm -r **/**/**/*.mmp &> /dev/null
			rm -r **/**/**/*.msh &> /dev/null
			rm -r **/**/**/*.num &> /dev/null
			rm -r **/**/**/*.out &> /dev/null
			rm -r **/**/**/*.pcs &> /dev/null
			rm -r **/**/**/*.rfd &> /dev/null
			rm -r **/**/**/*.st &> /dev/null
			rm -r **/**/**/*.tim &> /dev/null
		elif [ $output == 'q' ]
		then	
			exit
		else
			echo "### no files have been deleted ###"
		fi
fi