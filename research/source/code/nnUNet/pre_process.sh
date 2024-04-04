#!/bin/bash

#SBATCH -c 4                        # Number of CPU Cores
#SBATCH -p gpus                     # Partition (queue)
#SBATCH --gres gpu:1                # gpu:n, where n = number of GPUs
#SBATCH --mem 12288                 # memory pool for all cores
#SBATCH --nodelist lory          	# SLURM node
#SBATCH --output=slurm.%N.%j.log    # Standard output and error log
#SBATCH −−mail−user=az620           # required to send email notifcations

source /vol/biomedic3/bglocker/ugproj2324/az620/radiotherapy/.venv/bin/activate

source /vol/biomedic3/bglocker/ugproj2324/az620/radiotherapy/data/data_vars.sh

nnUNetv2_plan_and_preprocess -d 1 --verify_dataset_integrity
nnUNetv2_plan_and_preprocess -d 2 --verify_dataset_integrity
nnUNetv2_plan_and_preprocess -d 3 --verify_dataset_integrity
nnUNetv2_plan_and_preprocess -d 4 --verify_dataset_integrity
nnUNetv2_plan_and_preprocess -d 5 --verify_dataset_integrity
nnUNetv2_plan_and_preprocess -d 6 --verify_dataset_integrity