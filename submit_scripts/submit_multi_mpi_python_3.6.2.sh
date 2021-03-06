#!/bin/bash

# Copy this script in the parent directory of multiple ogs model runs. It will submit an mpi job for every folder on the same level as this script.
# Structure:
# Level 1: This script and multiple folders with trivial names
    # Level 2: inside every folder: x-number of folders with ogs model runs

# Specify the following resources for a single mpi-job
# h_rt
# h_vmem
# #of cores
# comment
set -e
comment="_SA_20191114"
NSLOTS=2

CWD="$(pwd)"

# loop over all directories and subdirectories and submit a relating job
for dir in *; do
    path_dir=$CWD/$dir

    ### Neuschreiben des qsub-Skripts ###
    submitfile=${path_dir}/qsub_mpi_${dir}.sh

cat > ${submitfile} << EOF

#!/bin/bash

#$ -S /bin/bash
#$ -wd $path_dir
#$ -N SA_${path_dir: -9}
#$ -o $path_dir/"$JOB_ID"$comment.OUT
#$ -e $path_dir/"$JOB_ID"$comment.ERR
#$ -l h_rt=7200
#$ -l h_vmem=16G
#$ -pe openmpi-orte $NSLOTS

# disable core dump (like this it's not working)
# ulimit -c 0

# load modules for mpi
module use /software/easybuild-broadwell/modules/all/Core
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
mpirun -np $NSLOTS python3 /home/houben/python/scripts/spectral_analysis/20190513_spectral_analysis_mpi_hetero_log_normal.py $path_dir $NSLOTS
EOF

    qsub ${submitfile}
    echo 'Your job should be in progress! Name of directory:'
    echo ${dir}
    #echo "Job submitted: " > ${path_dir}/${dir}.OUT
    #date > ${path_dir}/${dir}.OUT
done
