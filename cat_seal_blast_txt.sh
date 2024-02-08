#!/bin/bash
#SBATCH --mail-user=karen.keegan@moredun.ac.uk
#SBATCH --cpus-per-task=12
#SBATCH --mail-type=END,FAIL


dir=$1
out=$2

cd $dir
xargs cat *txt.gz > $out



