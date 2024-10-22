#!/bin/bash

#SBATCH --job-name="gs_array"
#SBATCH --mail-user=karen.keegan@moredun.ac.uk
#SBATCH --mail-type=END,FAIL
#SBATCH --cpus-per-task=2
#SBATCH --mem=12G
#SBATCH --partition=medium
#SBATCH --array=0-196

source activate blast

export BLASTDB=$BLASTDB:/mnt/shared/apps/databases/ncbi/

cd $1
FILES=(*.fasta)
OUTDIR=$2

blastn -query ${FILES[$SLURM_ARRAY_TASK_ID]} -db nt -out $2_$SLURM_JOB_ID.$SLURM_ARRAY_TASK_ID.txt -num_threads 12 -max_target_seqs 10 -outfmt "7 sscinames qacc sacc pident length mismatch gapopen gaps slen qlen qstart qend sstart send evalue staxids bitscore"

