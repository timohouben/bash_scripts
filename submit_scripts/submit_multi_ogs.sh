#!/bin/bash

# Copy this script in the parent directory of multiple ogs model runs.
# Specify:
# h_rt
# h_vmem
# path/to/ogs/executable
set -e

projectname='transect'
CWD="$(pwd)"

# loop over all directories and subdirectories and submit a relating job
for dir in *; do
    path_dir=$CWD/$dir

    ### SoftLinks to OGS-Unix-Executable ###
    ln -sf /home/houben/OGS_source/ogs ${path_dir}/eve/ogs

    ### Neuschreiben des qsub-Skripts ###

    submitfile=${path_dir}/eve/qsub_${dir}.sh

cat > ${submitfile} << EOF
#!/bin/bash
#$ -wd $CWD
#$ -S /bin/bash
#$ -N ogs_${dir}
#$ -l h_rt=864000
#$ -l h_vmem=8G
#$ -binding linear:1

# output files	
#$ -o ${path_dir}/eve/${dir}.OUT
#$ -e ${path_dir}/eve/${dir}.ERR
${path_dir}/eve/ogs ${path_dir}/${projectname}
EOF

    qsub ${submitfile}
    echo 'Your job should be in progress! Name of directory:'
    echo ${dir}
done
