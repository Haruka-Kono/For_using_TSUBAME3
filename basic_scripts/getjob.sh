#! /bin/sh

## get job ids with qstat
currentjob=`qstat | awk '{print $1}' | sed '/job-ID/d' | sed '/-/d'`
echo "$currentjob"
NR=`echo "$currentjob" | awk 'END{print NR}'`

echo number of jobs: $NR

## details of each job
for i in `seq 1 $NR`
do

        ## get each job id
        JOBi=`echo "$currentjob" | sed -n ''${i}' p'`

        ## get each job information and display only what I need
        echo job_id: $JOBi
        qstat -j $JOBi | grep -e cwd -e job_name -e job_state -e start_time
        echo ""

done
