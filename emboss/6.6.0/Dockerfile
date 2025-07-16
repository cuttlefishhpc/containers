Bootstrap: docker
From: spack/ubuntu-noble:develop
Stage: build

%post
  # Create the manifest file for the installation in /opt/spack-environment
  mkdir /opt/spack-environment && cd /opt/spack-environment
  cat << EOF > spack.yaml
spack:
  specs:
  - emboss@6.6.0

  concretizer:
    unify: true
  config:
    install_tree: /opt/software
  view: /opt/views/view
EOF

  # Install all the required software
  . /opt/spack/share/spack/setup-env.sh
  spack -e . concretize
  spack -e . install
  spack gc -y
  spack env activate --sh -d . >> /opt/spack-environment/environment_modifications.sh

  # Strip the binaries to reduce the size of the image
  find -L /opt/views/view/* -type f -exec readlink -f '{}' \; | \
    xargs file -i | \
    grep 'charset=binary' | \
    grep 'x-executable\|x-archive\|x-sharedlib' | \
    awk -F: '{print $1}' | xargs strip

Bootstrap: docker
From: ubuntu:24.04
Stage: final

%files from build
  /opt/spack-environment /opt
  /opt/software /opt
  /opt/views /opt
  /opt/spack-environment/environment_modifications.sh /opt/spack-environment/environment_modifications.sh

%post

  # Symlink the old view location
  ln -s /opt/views/view /opt/view

  # Modify the environment without relying on sourcing shell specific files at startup
  cat /opt/spack-environment/environment_modifications.sh >> $SINGULARITY_ENVIRONMENT

