help:
    just --list

default:
    just oras-upload-all

oras-upload file:
    #!/bin/bash 

    # Extract name and version from the path
    file="{{file}}"
    name=$(basename "$(dirname "$(dirname "$file")")")
    version=$(basename "$(dirname "$file")")
    echo $name $version

    # Read the build.def file and extract the build version
    build_version=$(grep -Po 'Version\s*"\K[^"]+' "$name"/"$version"/build.def)
    if [[ -z "${build_version}" ]]; then
        echo "Unable to find build version for ${name}/${version}"
        exit 1
    fi

    # Construct the linked name
    release_name="${name}-v${version}-b${build_version}"

    # Push to quay
    apptainer push "$file" oras://quay.io/cuttlefishhpc/software:${release_name}

oras-upload-all:
    #!/bin/bash

    # Iterate over each file in the directory
    for file in */*/final.sif; do
        # Extract name and version from the path
        name=$(basename "$(dirname "$(dirname "$file")")")
        version=$(basename "$(dirname "$file")")

        # Read the build.def file and extract the build version
        build_version=$(grep -Po 'Version\s*"\K[^"]+' "$name"/"$version"/build.def)
        if [[ -z "${build_version}" ]]; then
            echo "Unable to find build version for ${name}/${version}"
            exit 1
        fi

        # Construct the linked name
        release_name="${name}-v${version}-b${build_version}"

        # Push to quay
        apptainer push "$file" oras://quay.io/cuttlefishhpc/software:${release_name}
    done
