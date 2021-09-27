#!/bin/bash

#PBS -q default
#PBS -l nodes=1:ppn=8
#PBS -l walltime=1:00:00
#PBS -N x_rRNA_downloads
#PBS -m ae
#PBS -M mimann@unm.edu



module load parallel-20170322-gcc-4.8.5-2ycpx7e

cd $PBS_O_WORKDIR

source $(which env_parallel.bash)

src=$PBS_O_WORKDIR

cat $src/asco_genomes.txt $src/asco_rna_from_genomes.txt $src/basidio_rrna_genomes.txt | env_parallel --sshloginfile $PBS_NODEFILE 'wget {} -P $src/fna_files --no-verbose'

cat $src/basidio_rrna_genomes.txt | env_parallel --sshloginfile $PBS_NODEFILE 'wget {} -P $src/fna_files --no-verbose'