#!/usr/bin/env bash
# Deploy a environment suitable for development.
#
# Copyright 2025 林博仁(Buo-ren Lin) <buo.ren.lin@gmail.com>
# SPDX-License-Identifier: CC-BY-SA-4.0+ OR LicenseRef-Apache-2.0-If-Not-Used-In-Template-Projects

printf \
    'Info: Configuring the defensive interpreter behaviors...\n'
set_opts=(
    # Terminate script execution when an unhandled error occurs
    -o errexit
    -o errtrace

    # Terminate script execution when an unset parameter variable is
    # referenced
    -o nounset
)
if ! set "${set_opts[@]}"; then
    printf \
        'Error: Unable to configure the defensive interpreter behaviors.\n' \
        1>&2
    exit 1
fi

printf \
    'Info: Checking the existence of the required commands...\n'
required_commands=(
    realpath
    stat
)
flag_required_command_check_failed=false
for command in "${required_commands[@]}"; do
    if ! command -v "${command}" >/dev/null; then
        flag_required_command_check_failed=true
        printf \
            'Error: This program requires the "%s" command to be available in your command search PATHs.\n' \
            "${command}" \
            1>&2
    fi
done
if test "${flag_required_command_check_failed}" == true; then
    printf \
        'Error: Required command check failed, please check your installation.\n' \
        1>&2
    exit 1
fi

printf \
    'Info: Configuring the convenience variables...\n'
if test -v BASH_SOURCE; then
    # Convenience variables may not need to be referenced
    # shellcheck disable=SC2034
    {
        printf \
            'Info: Determining the absolute path of the program...\n'
        if ! script="$(
            realpath \
                --strip \
                "${BASH_SOURCE[0]}"
            )"; then
            printf \
                'Error: Unable to determine the absolute path of the program.\n' \
                1>&2
            exit 1
        fi
        script_dir="${script%/*}"
        script_filename="${script##*/}"
        script_name="${script_filename%%.*}"
    }
fi
# Convenience variables may not need to be referenced
# shellcheck disable=SC2034
{
    script_basecommand="${0}"
    script_args=("${@}")
}

printf \
    'Info: Setting the ERR trap...\n'
trap_err(){
    printf \
        'Error: The program prematurely terminated due to an unhandled error.\n' \
        1>&2
    exit 99
}
if ! trap trap_err ERR; then
    printf \
        'Error: Unable to set the ERR trap.\n' \
        1>&2
    exit 1
fi

printf \
    'Info: Loading common function definitions...\n'
functions_file="${script_dir}/functions.sh"
# shellcheck source=SCRIPTDIR/functions.sh
if ! source "${functions_file}"; then
    printf \
        'Error: Unable to load the common function definitions file.\n' \
        1>&2
    exit 1
fi

if ! distro_id=$(get_distro_identifier); then
    printf \
        'Error: Unable to query the operating system distribution identifier.\n' \
        1>&2
    exit 1
fi

if ! distro_categories=$(get_distro_categories); then
    printf \
        'Error: Unable to query the operating system distribution categories.\n' \
        1>&2
    exit 1
fi

printf \
    'Info: Checking the existence of the OS distro-specific required commands...\n'
if ! check_distro_specific_required_commands \
    "${distro_id}" \
    "${distro_categories}"; then
    printf \
        'Error: Required command check failed for the current distribution.\n' \
        1>&2
    exit 1
fi

if ! check_running_user; then
    exit 1
fi

if ! refresh_package_manager_local_cache \
    "${distro_id}" \
    "${distro_categories}"; then
    printf \
        'Error: Unable to refresh the local package manager cache for the current distribution.\n' \
        1>&2
    exit 1
fi

if test "${distro_id}" == 'ubuntu'; then
    if ! check_distro_packages_installed curl; then
        if ! install_distro_packages curl; then
            printf \
                'Error: Unable to install the required packages for the switch_ubuntu_local_mirror function.\n' \
                1>&2
            exit 2
        fi
    fi

    if ! switch_ubuntu_local_mirror; then
        printf \
            'Error: Unable to switch Ubuntu software sources to local mirror.\n' \
            1>&2
        exit 1
    fi
fi

required_packages=(
    # Required for the workarounding Git's "detected dubious ownership..." error
    git
)
if test "${#required_packages[@]}" -gt 0; then
    if ! check_distro_packages_installed "${required_packages[@]}"; then
        if ! install_distro_packages "${required_packages[@]}"; then
            printf \
                'Error: Unable to install the required packages for the current distribution.\n' \
                1>&2
            exit 2
        fi
    fi
fi

project_dir="${script_dir%/*}"
project_git_dir="${project_dir}/.git"
if ! project_git_dir_uid="$(stat --format '%u' "${project_git_dir}")"; then
    printf \
        'Error: Unable to query the owner user ID of the project Git directory.\n' \
        1>&2
    exit 1
fi

if test "${project_git_dir_uid}" != "${SUDO_UID:-"${UID}"}"; then
    printf \
        "Warning: Working around Git's \"detected dubious ownership...\" error...\\n" \
        1>&2
    if test -v SUDO_UID \
        && ! sudo -u "${SUDO_UID}" git config --global --get safe.directory &>/dev/null; then
        if ! sudo -u "${SUDO_UID}" git config --global --add safe.directory "${project_dir}"; then
            printf \
                "Error: Unable to workaround Git's \"detected dubious ownership...\" error.\\n" \
                1>&2
            exit 2
        fi
    else
        if ! git config --global --get safe.directory &>/dev/null; then
            if ! git config --global --add safe.directory "${project_dir}"; then
                printf \
                    "Error: Unable to workaround Git's \"detected dubious ownership...\" error.\\n" \
                    1>&2
                exit 2
            fi
        fi
    fi
fi

printf \
    'Info: Operation completed without errors.\n'
