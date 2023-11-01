#!/usr/bin/env bash
# Generate release description text to explain the changes between the
# previous release
#
# Copyright 2023 林博仁(Buo-ren, Lin) <Buo.Ren.Lin@gmail.com>
# SPDX-License-Identifier: CC-BY-SA-4.0

set \
    -o errexit \
    -o nounset

if ! test -v CI; then
    printf \
        'Error: This program should be run under a GitLab CI/GitHub Actions environment.\n' \
        1>&2
    exit 1
fi

# bash - How to get script directory in POSIX sh? - Stack Overflow
# https://stackoverflow.com/questions/29832037/how-to-get-script-directory-in-posix-sh
script_dir="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"
project_dir="${script_dir%/*}"

printf \
    'Info: Determining release description...\n'
git_tag_list="$(git tag --list)"
git_tag_count="$(wc -l <<<"${git_tag_list}")"

detailed_changes_markup="## Detailed changes"$'\n\n'
git_log_opts=(
    --format='format:* %s (%h) - %an'
)

if test -v CI_COMMIT_TAG; then
    release_tag="${CI_COMMIT_TAG}"
fi

if test "${git_tag_count}" -eq 1; then
    if ! detailed_changes_markup+="$(
        git log \
            "${git_log_opts[@]}" \
            "${release_tag}"
        )"; then
        printf \
            'Error: Unable to generate the commit list from Git.\n' \
            1>&2
        exit 2
    fi
else
    if ! sorted_git_tag_list="$(
        sort \
            -V \
            <<<"${git_tag_list}"
        )"; then
        printf \
            'Error: Unable to version-sort the Git tag list.\n' \
            1>&2
        exit 2
    fi
    if ! latest_two_git_tags="$(
        tail \
            -n 2 \
            <<<"${sorted_git_tag_list}"
        )"; then
        printf \
            'Error: Unable to filter out the two latest tags from the Git tag list.\n' \
            1>&2
        exit 2
    fi
    if ! previous_git_tag="$(
        head \
            -n 1 \
            <<<"${latest_two_git_tags}"
        )"; then
        printf \
            'Error: Unable to filter out the previous release tag from the two latest Git tags.\n' \
            1>&2
        exit 2
    fi
    if ! detailed_changes_markup+="$(
        git log \
            "${git_log_opts[@]}" \
            "${previous_git_tag}..${release_tag}"
        )"; then
        printf \
            'Error: Unable to generate the Git commit list between the "%s" tag and the "%s" tag.\n' \
            "${previous_git_tag}" \
            "${release_tag}" \
            1>&2
        exit 2
    fi
fi

detailed_changes_file="${project_dir}/.detailed_changes"
printf \
    'Info: Writing the detailed changes markup to the "%s" file...\n' \
    "${detailed_changes_file}"
if ! \
    printf \
        '%s' \
        "${detailed_changes_markup}" \
        >"${detailed_changes_file}"; then
    printf \
        'Error: Unable to write the detailed changes markup to the "%s" file.\n' \
        "${detailed_changes_file}" \
        1>&2
    exit 2
fi

printf \
    'Info: Operation completed without errors.\n'
