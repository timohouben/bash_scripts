# Specify the number ob slots manually! In case you run the mpi_local_generate_ogs.py the number of cores has to be the same in both scripts
#!/bin/bash

#$ -S /bin/bash
#$ -N mpitest
#$ -o /home/houben/mpi4py_test/mpi-test-log.log
#$ -j y
#$ -l h_rt=86400
#$ -l h_vmem=8G

#$ -pe openmpi-orte 10


# load modules for open mpi
module use /software/easybuild-E5-2690v4/modules/all/Core
module load uge/8.5.5-easybuild
module load foss/2018b

# load modules for python
module load python/3.6.2
module load libGLU

# load modules for mpi4py
module load openmpi/gcc/2.1.1-1
module load gcc/4/9.4-3

# activate python environment
source /home/houben/pyenv3.6.2/bin/activate

# mpirun with script to execute
mpirun -np $NSLOTS python3 /home/houben/mpi4py_test/mpi_local_generate_ogs_heterogeneous.py $NSLOTS
