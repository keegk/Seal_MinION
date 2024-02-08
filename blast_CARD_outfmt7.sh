#!/bin/bash

#SBATCH --job-name="card_xat"
#SBATCH --mail-user=karen.keegan@moredun.ac.uk
#SBATCH --mail-type=END,FAIL
#SBATCH --cpus-per-task=4
#SBATCH --mem=5G
#SBATCH --partition=short

source activate /mnt/shared/scratch/kkeegan/apps/conda/envs/blast

export BLASTDB=$BLASTDB:/mnt/shared/scratch/kkeegan/personal/Databases/CARD/CARDdb/


blastn -query $1 -db CARD_db -out $2 -num_threads 12 -max_target_seqs 10 -outfmt "7 sscinames qacc sacc pident length mismatch gapopen gaps slen qlen qstart qend sstart send evalue staxids"  
