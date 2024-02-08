#!/bin/bash
#SBATCH --mail-user=karen.keegan@moredun.ac.uk
#SBATCH --mail-type=END,FAIL

out=$1
db=$2

wget ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/assembly_summary_refseq.txt
awk -F "\t" '$12=="Complete Genome" && $11=="latest"{print $20}' assembly_summary_refseq.txt > ftpdirpaths
awk 'BEGIN{FS=OFS="/";filesuffix="genomic.fna.gz"}{ftpdir=$0;asm=$10;file=asm"_"filesuffix;print ftpdir,file}' ftpdirpaths > ftpfilepaths
wget -i ftpfilepaths
gunzip *.gz
cat *.fna > $1

makeblastdb -in $1 -out $2 -dbtype nucl -parse_seqids


