#!/usr/bin/env bash
# Create GitLab project release
#
# Copyright 2023 林博仁(Buo-ren, Lin) <Buo.Ren.Lin@gmail.com>
# SPDX-License-Identifier: CC-BY-SA-4.0

set \
    -o errexit \
    -o nounset

if ! test CI_PROJECT_ID; then
    printf \
        'Error: This program should be run under a GitLab CI environment.\n' \
        1>&2
    exit 1
fi

printf \
    'Info: Determining release description...\n'
git_tag_list="$(git tag --list)"
git_tag_count="$(wc -l <<<"${git_tag_list}")"

release_description="## Detailed changes"$'\n\n'
git_log_opts=(
    --format='format:* %s (%h) - %an'
)

if test "${git_tag_count}" -eq 1; then
    release_description+="$(
        git log \
            "${git_log_opts[@]}" \
            "${CI_COMMIT_TAG}"
    )"
else
    sorted_git_tag_list="$(
        sort \
            -V \
            <<<"${git_tag_list}"
    )"
    latest_two_git_tags="$(
        tail \
            -n 2 \
            <<<"${sorted_git_tag_list}"
    )"
    previous_git_tag="$(
        head \
            -n 1 \
            <<<"${latest_two_git_tags}"
    )"
    release_description+="$(
        git log \
            "${git_log_opts[@]}" \
            "${previous_git_tag}..${CI_COMMIT_TAG}"
    )"
fi

printf \
    'Info: Determining release version...\n'
release_version="${CI_COMMIT_TAG#v}"

# bash - How to get script directory in POSIX sh? - Stack Overflow
# https://stackoverflow.com/questions/29832037/how-to-get-script-directory-in-posix-sh
script_dir="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"
project_dir="${script_dir%/*}"

printf \
    'Info: Determining release details...\n'
release_cli_create_opts=(
    --name "${CI_PROJECT_TITLE} ${release_version}"
    --tag-name "${CI_COMMIT_TAG}"
    --description "${release_description}"
)

shopt -s nullglob
for file in "${project_dir}/${CI_PROJECT_NAME}-"*; do
    filename="${file##*/}"
    package_registry_url="${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/packages/generic/${CI_PROJECT_NAME}/${release_version}/${filename}"

    release_cli_create_opts+=(
        --assets-link "{\"name\": \"${filename}\", \"url\": \"${package_registry_url}\"}"
    )
done

printf \
    'Info: Creating the GitLab release...\n'
if ! \
    release-cli create \
        "${release_cli_create_opts[@]}"; then
    printf \
        'Error: Unable to create the GitLab release.\n' \
        1>&2
    exit 2
fi

printf \
    'Info: Operation completed without errors.\n'
