#!/bin/bash

#SBATCH --job-name="cat_REFSEQ"
#SBATCH --mail-user=karen.keegan@moredun.ac.uk
#SBATCH --mail-type=END,FAIL
#SBATCH --partition=short


dir=$1


cd $dir
xargs cat *.txt > cat_refseq.txt



