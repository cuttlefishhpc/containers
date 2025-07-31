help:
    just --list

default:
    just oras-upload

oras-upload:
    #!/bin/bash

    # Iterate over each file in the directory
    for file in */*/final.sif; do
        # Extract name and version from the path
        name=$(basename "$(dirname "$(dirname "$file")")")
        version=$(basename "$(dirname "$file")")

        # Construct the linked name
        release_name="${name}-${version}"

        # Push to quay
        apptainer push "$file" oras://quay.io/cuttlefishhpc/software:${release_name}
    done
