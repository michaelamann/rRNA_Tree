#!/bin/bash

#PBS -q default
#PBS -l nodes=1:ppn=8
#PBS -l walltime=4:00:00
#PBS -N x_filter_using_R
#PBS -m ae
#PBS -M mimann@unm.edu


module load r-4.0.4-gcc-10.2.0-python3-dghog6f

cd $PBS_O_WORKDIR

Rscript Filter_rna_genome_files.R