#!/bin/bash

#SBATCH -J test
#SBATCH -o test.%j.out
#SBATCH -e test.%j.err
#SBATCH -N 1
#SBATCH -n 1
#
# Option -A is for project name
#
#SBATCH -A OCE23001
#
# option -p is to choose the queue, the options are
#  See https://portal.tacc.utexas.edu/user-guides/lonestar5#running-queues 
#  for details on the different queues
#  
#SBATCH -p development
#SBATCH -t 2:00:00

## Enter email address here for begin/end notifications
#SBATCH --mail-user=shreyas.gaikwad@utexas.edu
#SBATCH --mail-type=begin
#SBATCH --mail-type=end

module load tacc-apptainer
echo "Running testreport for adjoint:"
apptained pull docker://shreyas911/mitgcm_ad_v2_amd64:v1.0
apptainer run docker://shreyas911/mitgcm_ad_v2_amd64:v1.0 ./testreport -adm -tap
echo "Running testreport for tlm:"
apptainer pull docker://shreyas911/mitgcm_ad_v2_amd64:v1.0
apptainer run docker://shreyas911/mitgcm_ad_v2_amd64:v1.0 ./testreport -tlm -tap
