#!/bin/bash

#  script to execute a python script for multiple folders as job for eve
# script has to be at the same level as the folders of the ogs runs to run the script. 

set -e

# set home and working directory
dir_home='/home/houben'
dir_work='/work/houben'
projectname='exe_ts_'

# set projectname
CWD="$(pwd)"

# loop over all directories and subdirectories and submit a relating job
for directories in */ ; do
name_dir=$directories
dir_sim=$CWD/$name_dir

### Neuschreiben des qsub-Skripts ###

submitfile=${CWD}/qsub_${name_dir%?}.sh
	cat > ${submitfile} << EOF
#!/bin/bash
#$ -S /bin/bash
#$ -N ${projectname}${directories%?}
#$ -l h_rt=3600
#$ -l h_vmem=8G
#$ -binding linear:1

# output files	
#$ -o ${CWD}/${name_dir%?}_multi_psd.OUT
#$ -e ${CWD}/${name_dir%?}_multi_psd.ERR

module use /software/easybuild-E5-2690v4/modules/all/Core
module load foss/2018b
module load python/3.6.2
module load libGLU
source /home/houben/pyenv3.6.2/bin/activate

python3 /home/houben/python_pkg/scripts/spectral_analysis/exe_extract_timeseries.py "${dir_sim%?}" "mean" "GROUNDWATER_FLOW" 1 "True"
EOF

qsub ${submitfile}
echo 'Your job should be in progress! Name of directory:'
echo ${dir_sim}


done
