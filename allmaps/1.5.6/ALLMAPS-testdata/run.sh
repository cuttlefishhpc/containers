#!/bin/bash

# Prepare ALLMAPS input


#python -m jcvi.assembly.allmaps merge JMMale.csv JMFemale.csv -o JM-2.bed -w weights.txt
$1 merge JMMale.csv JMFemale.csv -o JM-2.bed -w weights.txt

# Run ALLMAPS
#python -m jcvi.assembly.allmaps path JM-2.bed scaffolds.fasta -w weights.txt
$1 path JM-2.bed scaffolds.fasta -w weights.txt
