# containers
Build files required to reproduce the containers used on cuttlefish. Note the images themselves are not included here for size reasons.

# Dependencies
1. apptainer (https://apptainer.org/)
  - to pull existing images and build new images
2. just (https://github.com/casey/just)
  - for running the commands
  - optional if you just want to copy and paste the commands from the justfiles
3. miniconda or equivalent (https://anaconda.org/anaconda/conda)
  - this is only needed if you want to rebuild the environment.yml file for a container
  - building the container itself doesn't require conda as it is already built inside the base image
