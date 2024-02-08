#!/bin/bash

#SBATCH --job-name="fasta_split"
#SBATCH --partition=medium

split -l 100000 --additional-suffix=.fasta $1
