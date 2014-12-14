#!/bin/bash
# 移除 Generic Software Project Template 原本的 Git 程式碼倉庫
rm -rf .git/
./Tools/renameProject.bash.sh
exit 0