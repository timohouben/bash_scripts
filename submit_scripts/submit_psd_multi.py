#!/bin/bash

# NEW VERSION: CHANGED AT DEC 11th 18
# Changes:
# projectname of job on eve is equvalent to projectname+folder name and not any more equal to the ogs project name

set -e

# set home and working directory
dir_home='/home/houben'
dir_work='/work/houben'
projectname='plot_head'
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
#$ -l h_rt=7200
#$ -l h_vmem=4G
#$ -binding linear:1

# output files	
#$ -o ${dir_sim}${name_dir%?}_psd_multi.OUT
#$ -e ${dir_sim}${name_dir%?}_psd_multi.ERR

source /home/houben/env1/bin/activate

python /home/houben/python_pkg/python_scripts/python_scripts/frequency_analysis/psd_multi.py ${dir_sim%?}
EOF

qsub ${submitfile}
echo 'Your job should be in progress! Name of directory:'
echo ${dir_sim}


done
