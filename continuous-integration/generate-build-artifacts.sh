#!/usr/bin/env bash
# Generate the project build artifacts
#
# Copyright 2024 林博仁(Buo-ren Lin) <buo.ren.lin@gmail.com>
# SPDX-License-Identifier: CC-BY-SA-4.0 OR LicenseRef-Apache-2.0-If-Not-Used-In-Template-Projects
set \
    -o errexit \
    -o nounset

required_commands=(
    realpath
    python3
    git
)
for command in "${required_commands[@]}"; do
    if ! command -v "${command}" >/dev/null; then
        printf \
            'Error: This program requires the "%s" command to be available in your command search PATHs.\n' \
            "${command}" \
            1>&2
        exit 1
    fi
done

script="${BASH_SOURCE[0]}"
if ! script="$(
    realpath \
        --strip \
        "${script}"
    )"; then
    printf \
        'Error: Unable to determine the absolute path of the program.\n' \
        1>&2
    exit 1
fi

script_dir="${script%/*}"
project_dir="${script_dir%/*}"
project_dirname="${project_dir##*/}"

if ! test -e "${script_dir}/venv"; then
    printf \
        'Info: Initializing the Python virtual environment...\n'
    if ! python3 -m venv "${script_dir}/venv"; then
        printf \
            'Error: Unable to initialize the Python virtual environment.\n' \
            1>&2
        exit 2
    fi
fi

printf \
    'Info: Activating the Python virtual environment...\n'
# Out of scope
# shellcheck source=/dev/null
if ! source "${script_dir}/venv/bin/activate"; then
    printf \
        'Error: Unable to activate the Python virtual environment.\n' \
        1>&2
    exit 2
fi

if ! pip --version &>/dev/null; then
    printf \
        'Error: pip command is not functioning properly.\n' \
        1>&2
    exit 2
fi

printf \
    'Info: Installing git-archive-all...\n'
if ! pip show git-archive-all &>/dev/null; then
    if ! pip install git-archive-all; then
        printf \
            'Error: Unable to install git-archive-all.\n' \
            1>&2
        exit 2
    fi
fi

printf \
    'Info: Determining the build datestamp...\n'
if ! datestamp="$(date +%Y%m%d-%H%M%S)"; then
    printf \
        'Error: Unable to determine the build datestamp.\n' \
        1>&2
    exit 2
fi

printf \
    'Info: Determining the project version...\n'
git_describe_opts=(
    --always
    --dirty
    --tags
)
if ! version_describe="$(
    git describe \
        "${git_describe_opts[@]}"
    )"; then
    version_describe="unknown-${datestamp}"
    printf \
        'Warning: Unable to determine the project version, will use "%s" as a fallback.\n' \
        "${version_describe}" \
        1>&2
fi
project_version="${version_describe#v}"

printf \
    'Info: Generating the project archive...\n'
project_id="${CI_PROJECT_NAME:-"${PROJECT_ID:-"${project_dirname}"}"}"
release_id="${project_id}-${project_version}"
git_archive_all_opts=(
    # Add an additional layer of folder for containing the archive
    # contents
    --prefix="${release_id}/"
)
if ! \
    git-archive-all \
        "${git_archive_all_opts[@]}" \
        "${release_id}.tar.gz"; then
    printf \
        'Error: Unable to generate the project archive.\n' \
        1>&2
    exit 2
fi

printf \
    'Info: Operation completed without errors.\n'
