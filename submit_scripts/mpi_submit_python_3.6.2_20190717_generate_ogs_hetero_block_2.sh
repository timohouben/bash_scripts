# Specify the number ob slots manually! In case you run the mpi_local_generate_ogs.py the number of cores has to be the same in both scripts
# specify the path for 1) output file and 2) output directory and 3) job_name 4) the number of slots

#!/bin/bash

#$ -S /bin/bash
#$ -N gen_ogs_20170717
#$ -o /work/houben/20190717_SA_hetero_block_2/$JOB_ID.OUT
#$ -e /work/houben/20190717_SA_hetero_block_2/$JOB_ID.ERR
#$ -l h_rt=3600
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
mpirun -np $NSLOTS python3 /home/houben/python/scripts/ogs5py/20190717_generate_ogs_hetero_block_2_EVE.py /work/houben/20190717_SA_hetero_block_2 $NSLOTS

# run this stuff to surpress fork() warning
# mpirun --mca mpi_warn_on_fork 0 -np 100 python3 path_script dir_out 100
