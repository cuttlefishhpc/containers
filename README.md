[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.16969199.svg)](https://doi.org/10.5281/zenodo.16969199)

# Containers
This github repo stores the build files required to reproduce the containers used on the Cuttlefish HPC.
Note that the images themselves are publically available for download on https://quay.io/repository/cuttlefishhpc/software
and not included in this repo due to size constraints.

## Citation information
Users of this repository (and https://quay.io/repository/cuttlefishhpc/software) must cite the original software producer
For example, if you use bwa, please cite the original author(s) which made bwa. You can also cite this repository in its
entirety using the doi tagged above or the CITATION.cff file.

## Usage
Each image is designed such that it can be run as if it was a "normal" software install. For example,
to run bwa, simple executing the bwa.sif file with your normal arguments. There is no need to first
boot into the container, find the software installation path, then execute the software.

## Runtime dependencies
To run the resulting images, only apptainer is needed as all other dependencies are pre-built inside
each container.

## Build Dependencies
To rebuild every container, the following dependencies are needed
1. apptainer (https://apptainer.org/)
  - to pull existing images and build new images
2. just (https://github.com/casey/just)
  - for running the commands
  - optional if you instead want to copy and paste the commands from the justfiles
3. miniconda or equivalent (https://anaconda.org/anaconda/conda)
  - this is only needed if you want to rebuild the environment.yml file for specific container
  - building the container itself doesn't require conda as it is already built inside the base image
