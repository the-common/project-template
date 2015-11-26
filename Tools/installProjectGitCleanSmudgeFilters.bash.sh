#!/bin/bash
######## File scope variable definitions ########
# idea from http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/
readonly PROGRAM_NAME="$(basename $0)"
readonly PROGRAM_DIRECTORY="$(readlink -m $(dirname $0))"
readonly PROGRAM_ARGUMENT_ORIGINAL_LIST="$@"
readonly PROGRAM_ARGUMENT_ORIGINAL_NUMBER=$#
readonly project_root_path="${PROGRAM_DIRECTORY}/.."

######## File scope variable definitions ended ########

######## Included files ########
source "${project_root_path}/Tools/checkIllegalUsage.bash.source.sh"
######## Included files ended ########

checkIllegalUsage
git config filter.apply_coding_style.clean "astyle --options=\"Coding style configurations/Project_specified_coding_style.astylerc\""
git config filter.apply_coding_style.smudge "cat | head --lines=-1"
printf "Git clean 與 smudge 過濾器安裝完成。\n"
exit 0
