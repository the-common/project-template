#!/bin/bash
read -p "請輸入新的專案名稱：" NAME_PROJECT
sed --in-place "s/C_CPP_project_template/${NAME_PROJECT}/g" CMakeLists.txt
sed --in-place "s/C_CPP_project_template/${NAME_PROJECT}/g" Source_code/main.cpp
sed --in-place "s/C_CPP_project_template/${NAME_PROJECT}/g" CMakeLists.txt
sed --in-place "s/C_CPP_project_template/${NAME_PROJECT}/g" IDE_Eclipse_CDT/.*project
sed --in-place "s/C_CPP_project_template/${NAME_PROJECT}/g" IDE_Code__Blocks/C_CPP_project_template.cbp
mv IDE_Code__Blocks/C_CPP_project_template.cbp "IDE_Code__Blocks/${NAME_PROJECT}.cbp"
sed --in-place "s/C_CPP_project_template/${NAME_PROJECT}/g" IDE_CodeLite/C_CPP_project_template.project
mv IDE_CodeLite/C_CPP_project_template.project "IDE_CodeLite/${NAME_PROJECT}.project"
exit 0