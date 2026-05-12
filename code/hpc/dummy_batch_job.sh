#!/bin/bash
#SBATCH --partition=devel
#SBATCH --job-name=dummy
#SBATCH --cpus-per-task=1
#SBATCH --mem=8G
#SBATCH --time=00:10:00
#SBATCH --output=dummy.log

echo "Hello $USER, I am $(hostname)"
