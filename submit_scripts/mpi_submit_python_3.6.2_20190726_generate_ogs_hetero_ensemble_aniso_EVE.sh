# Specify the number ob slots manually! In case you run the mpi_local_generate_ogs.py the number of cores has to be the same in both scripts
# specify the path for 1) output file and 2) output directory and 3) job_name 4) the number of slots 5) the working directory

#!/bin/bash

#$ -S /bin/bash
#$ -wd /work/houben/test
#$ -N gen_ogs_20170726
#$ -o /work/houben/test/$JOB_ID_gen_ogs.OUT
#$ -e /work/houben/test/$JOB_ID_gen_ogs.ERR
#$ -l h_rt=120
#$ -l h_vmem=16G
#$ -pe openmpi-orte 100

# disable core dump (like this it's not working)
# ulimit -c 0

# load modules for mpi
module use /software/easybuild-broadwell/modules/all/Core

# Führt zu fehlern:
# module use /software/easybuild-E5-2690v4/modules/all/Core


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
mpirun -np $NSLOTS python3 /home/houben/python/scripts/ogs5py/20190726_generate_ogs_hetero_ensemble_aniso_EVE.py /work/houben/test $NSLOTS

# run this stuff to surpress fork() warning
# mpirun --mca mpi_warn_on_fork 0 -np 100 python3 path_script dir_out 100
