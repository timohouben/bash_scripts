#!/bin/bash
#$ -S /bin/bash
#$ -N generate_ogs
#$ -l h_rt=86400
#$ -l h_vmem=8G
#$ -binding linear:1

# output files
#$ -o $CWD/generate_ogs.OUT
#$ -e $CWD/generate_ogs.ERR

module use /software/easybuild-E5-2690v4/modules/all/Core
module load foss/2018b
module load python/3.6.2
module load libGLU
source /home/houben/pyenv3.6.2/bin/activate

python3 /work/houben/generate_dat_for_hetero_field/generate_ogs_heterogeneous.py
