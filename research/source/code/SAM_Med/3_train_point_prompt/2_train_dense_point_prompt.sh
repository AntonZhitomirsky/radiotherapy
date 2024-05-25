#!/bin/bash

# Example of running python script in a batch mode
#SBATCH -c 16                            # Number of CPU Cores
#SBATCH -p gpus                          # Partition (queue)
#SBATCH --gres gpu:1                     # gpu:n, where n = number of GPUs
#SBATCH --mem 30G                        # memory pool for all cores
#SBATCH --output=logs/slurm.%N.%j.log    # Standard output and error log
#SBATCH --nodelist lory                  # SLURM node

#SBATCH --job-name=MEDSAM.finetune

# --nodelist lory           # SLURM node
# --nodelist loki          	# SLURM node

# Get the directory of the script
SOURCE_DIR=$(git rev-parse --show-toplevel)

# Check if $1 variable is empty
if [ -z "$1" ]; then
    echo "Error: ANATOMY_NAME is not provided."
    return -1
fi

# Load the virtual environment
source ${SOURCE_DIR}/.venv/bin/activate
# source ${SOURCE_DIR}/data/data_vars.sh

# Convert Python Script
jupyter nbconvert --to script '2_train_dense_point_prompt.ipynb'
echo "Converted Python Script"

# Run python script
python3 2_train_dense_point_prompt.py --anatomy $1 --model_training dense_point_lowres --epochs 100 --batch_size=4 --lowres True