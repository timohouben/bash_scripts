#!/bin/bash
 
#$ -S /bin/bash
 
#$ -j y
#$ -l h_rt=86400
#$ -l h_vmem=4G

#$ -pe openmpi-orte 8
 
module load openmpi/gcc/1.8.8-1
 
mpirun -np 8 /home/houben/OGS_mpi_own/ogs5/build/bin/ogs /work/houben/mpi_test/5000_30_9.00e-05/transect