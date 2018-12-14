#!/bin/bash

set -e

dir_home='/home/houben'
dir_work='/work/houben'

projectname='transect_01'

name_dir='Groundwater@UFZ_eve_VERTICAL_276_D'
dir_sim=/work/houben/$name_dir

# dir_sim='/work/houben/{$name_dir}'

### SoftLinks to OGS-Unix-Executable ###

ln -sf /home/houben/OGS/ogs ${dir_sim}/ogs


### Neuschreiben des qsub-Skripts ###

	submitfile=${dir_sim}/qsub_${name_dir}.sh
	cat > ${submitfile} << EOF
#!/bin/bash
#$ -S /bin/bash
#$ -N ${projectname}
#$ -l h_rt=80000
#$ -l h_vmem=4G
#$ -binding linear:1

# output files
#$ -o ${dir_sim}/${name_dir}.out
#$ -e ${dir_sim}/${name_dir}.err
echo 'Your job should be in progress!'
${dir_sim}/ogs ${dir_sim}/${projectname}
EOF

qsub ${submitfile}