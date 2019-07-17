#!/bin/bash
#$ -S /bin/bash
#$ -N generate_ogs
#$ -l h_rt=86400
#$ -l h_vmem=8G
#$ -binding linear:1

# output files
# CHANGE HERE:
#$ -o /work/houben/20190513_spec_anal_hetero_ensemble_1/generate_ogs.OUT
#$ -e /work/houben/20190513_spec_anal_hetero_ensemble_1/generate_ogs.ERR

module use /software/easybuild-E5-2690v4/modules/all/Core
module load foss/2018b
module load python/3.6.2
module load libGLU
source /home/houben/pyenv3.6.2/bin/activate

python3 /work/houben/20190513_spec_anal_hetero_ensemble_1/generate_ogs_heterogeneous.py
