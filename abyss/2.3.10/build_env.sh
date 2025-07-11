#!/bin/bash

module load conda

# Set a temporary environment name
ENV_NAME="tmp_env_abyss"

# Create the environment
conda create -y -n $ENV_NAME abyss pigz zsh samtools arcs tigmint bowtie bowtie2

# Activate the environment
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate $ENV_NAME

# Export the environment
conda env export --name $ENV_NAME > environment.yml

# Deactivate and remove the environment
conda deactivate
conda remove -y --name $ENV_NAME --all

echo "Temporary environment $ENV_NAME created, exported to environment.yml, and deleted."

