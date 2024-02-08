#!/bin/bash

#SBATCH --job-name="xat"
#SBATCH --mail-user=karen.keegan@moredun.ac.uk
#SBATCH --mail-type=END,FAIL
#SBATCH --cpus-per-task=32
#SBATCH --mem=20G
#SBATCH --partition=short

source activate /mnt/shared/scratch/kkeegan/apps/conda/envs/blast
export BLASTDB=$BLASTDB:/mnt/shared/scratch/kkeegan/personal/Databases/Refseq/



blastn -query $1 -db bacterial_refseq_db -out $2 -num_threads 12 -max_target_seqs 10 -outfmt "7 sscinames qacc sacc pident length mismatch gapopen gaps slen qlen qstart qend sstart send evalue staxids"  
