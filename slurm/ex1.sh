#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --mem=100M
#SBATCH --job-name=slurm-test

SLEEP_TIME=$(( ( RANDOM % 5 )  + 1 ))
echo "Sleeping ${SLEEP_TIME} secs..."
sleep ${SLEEP_TIME}
hostname
