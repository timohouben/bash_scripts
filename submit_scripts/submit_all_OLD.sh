#!/bin/bash

set -e

# set home and working directory
dir_home='/home/houben'
dir_work='/work/houben'
# set prejectname
projectname='transect_01'
CWD="$(pwd)"

# loop over all directories and subdirectories and submit a relating job
for directories in */ ; do
name_dir=$directories
dir_sim=$CWD/$name_dir

### SoftLinks to OGS-Unix-Executable ###
ln -sf /home/houben/OGS/ogs ${dir_sim}ogs


### Neuschreiben des qsub-Skripts ###

submitfile=${dir_sim}qsub_${name_dir%?}.sh
	cat > ${submitfile} << EOF
#!/bin/bash
#$ -S /bin/bash
#$ -N ${projectname}
#$ -l h_rt=86400
#$ -l h_vmem=4G
#$ -binding linear:1

# output files	
#$ -o ${dir_sim}${name_dir%?}.out
#$ -e ${dir_sim}${name_dir%?}.err
echo 'Your job should be in progress!'
echo ${dir_sim}
${dir_sim}ogs ${dir_sim}${projectname}
EOF

qsub ${submitfile}


done
