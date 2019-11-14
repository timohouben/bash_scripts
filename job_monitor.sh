#!/bin/bash

# Execute this script and insert the job ID to monitor the qstats of your job every n seconds.

echo "You are starting the job monitor. The resulting file will be stored in the current working directory."
echo "Insert the job ID: "
read jobid
echo "Intervall in seconds: "
read interval
echo "How long shall this job be monitored (s)?: "
read maximum

i="0"
while [ $i -lt $maximum ]
do
    qstat | grep $jobid | tr -d '\n' >> ${jobid}_job_monitor.txt
    date >> ${jobid}_job_monitor.txt
    i=$[$i+${interval}]
    sleep $interval
done
