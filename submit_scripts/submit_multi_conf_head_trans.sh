#!/bin/bash

# script to execute a python script for multiple folders as job for eve
# cwd should containt multiple folders with ogs runs

set -e

# set home and working directory
dir_home='/home/houben'
dir_work='/work/houben'
projectname='head_timeseries'
# set prejectname
CWD="$(pwd)"

# loop over all directories and subdirectories and submit a relating job
for directories in */ ; do
name_dir=$directories
dir_sim=$CWD/$name_dir

### Neuschreiben des qsub-Skripts ###

submitfile=${dir_sim}qsub_${name_dir%?}.sh
	cat > ${submitfile} << EOF
#!/bin/bash
#$ -S /bin/bash
#$ -N ${projectname}${directories%?}
#$ -l h_rt=3600
#$ -l h_vmem=4G
#$ -binding linear:1

# output files	
#$ -o ${dir_sim}${name_dir%?}_head_timeseries.OUT
#$ -e ${dir_sim}${name_dir%?}_head_timeseries.ERR
/home/houben/python_pkg/python_scripts/python_scripts/head_ogs_vs_gw-model/transient/multi_conf_head_ogs_vs_gw_model_trans.py "${dir_sim%?}"
EOF

qsub ${submitfile}
echo 'Your job should be in progress! Name of directory:'
echo ${dir_sim}


done
