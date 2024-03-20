#!/bin/bash

#SBATCH -J test
#SBATCH -o test.%j.out
#SBATCH -e test.%j.err
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 2:00:00

## Enter email address here for begin/end notifications
#SBATCH --mail-user=shreyas.gaikwad@utexas.edu
#SBATCH --mail-type=begin
#SBATCH --mail-type=end

pytest tests.py
