#!/bin/bash
#SBATCH --job-name="CARD_parse_15.2.24"
#SBATCH --cpus-per-task=2
#SBATCH --mail-user=karen.keegan@moredun.ac.uk
#SBATCH --mail-type=END,FAIL
#SBATCH --partition=short


source activate /mnt/shared/scratch/kkeegan/apps/conda/envs/R_env

Rscript parsefilter_blasttable_v2.1.R $1 $2 90 1E-12 5 200
