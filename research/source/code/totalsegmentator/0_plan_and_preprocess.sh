#!/bin/bash

# Example of running python script in a batch mode
#SBATCH -c 4                        # Number of CPU Cores
#SBATCH -p gpus                     # Partition (queue)
#SBATCH --gres gpu:1                # gpu:n, where n = number of GPUs
#SBATCH --mem 12288                 # memory pool for all cores
#SBATCH --nodelist loki          	# SLURM node
#SBATCH --output=slurm.%N.%j.log    # Standard output and error log

source /vol/bitbucket/az620/radiotherapy/.venv/bin/activate

# source /vol/bitbucket/az620/radiotherapy/data/data_vars.sh

jupyter nbconvert --to script '0_plan_and_preprocess.ipynb'
ipython3 0_plan_and_preprocess.py 