#!/bin/bash

# Example of running python script in a batch mode
#SBATCH -c 4                        # Number of CPU Cores
#SBATCH -p gpus                     # Partition (queue)
#SBATCH --gres gpu:1                # gpu:n, where n = number of GPUs
#SBATCH --mem 12288                 # memory pool for all cores
#SBATCH --output=slurm.%N.%j.log    # Standard output and error log

# Source virtual environment (pip)
source /vol/bitbucket/az620/radiotherapy/.venv/bin/activate

# Set env variables
source /vol/bitbucket/az620/radiotherapy/data/data_vars.sh

# Run python script
python3 inference_4.py