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

if [ $# -ge 2 ]; then
	printf "參數錯誤！"
	exit 1
elif [ $# -eq 1 ]; then
	config_file_path="$1"
else
	read -p "請輸入 Astyle 設定檔路徑：" config_file_path
	find "Source code/" -regextype posix-extended -regex '.*\.(c|cpp|cc|h|hpp|hh)$' -print -exec astyle --suffix=none --options="${config_file_path}" {} + 

fi
exit 0