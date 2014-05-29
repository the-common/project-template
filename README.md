## 內容未初始化說明<br />Content not-initialized note
如果您看到此段文字代表本檔案尚未被專案開發者自訂為他自己的版本，內容僅供參考。如果您是此專案的開發者請修改成自己需要的內容並移除此段落  
If you see this paragraph means that this file is NOT customized to the project devloper's version and the content is for reference only.  If you're this project's developer please customize this file's content then remove this paragraph.

C 或 C++ 程式語言專案範本<br />C or C++ project template
[https://github.com/Vdragon/C_CPP_project_template](https://github.com/Vdragon/C_CPP_project_template)

# 〈專案名稱〉<br />&lt;Project_name&gt;

## 這是什麼？<br />What is this?

## 檔案與目錄說明<br />File and directory description
* Tools/
	* 專案相關的一些工具
* Source_code/
    * 軟體的來源程式碼  
      Software's source code
* Object_code/
    * 軟體的目標程式碼
    * 目前因為建構產物皆可 out of source 建構在各自專屬的目錄中已不建議使用
* Library_headers/
	* 專案使用的第三方函式庫之標頭(header)檔搜尋目錄
* Libraries/
	* 專案使用的第三方函式庫搜尋目錄
	* ${Target or configuration name}/
* Translations/
    * 軟體介面翻譯的資料
* Build_artifacts/
	* 軟體的建構中間產物
	* 目前因為建構產物皆可 out of source 建構在各自專屬的目錄中已不建議使用
* Build/
    * 建構好的軟體  
      Built software
    * ${Target or configuration name}/
    * 目前因為建構產物皆可 out of source 建構在各自專屬的目錄中已不建議使用
* IDE_*/
    * 跟 * 整合式開發環境(IDE)相關的檔案與建構產物
* Toolchain_*/
	* 跟 * 工具鍊(toolchain)相關的檔案與建構產物
* Resources/
	* 跟欲建構的程式無關的檔案
* Documentation/
	* 專案的其他說明文件
* Coding_style_configuration/
	* 程式碼撰寫風格設定檔
* Templates/
	* 可能會用到的檔案範本
* README.md
    * 本說明文件  
      This documentation

## 如何使用？<br />How to use it?
1. 將程式碼封存檔下載下來並解壓縮
2. 將 C_CPP_project_template 目錄改名為您的專案名稱
3. 將上述目錄內的 .git 目錄（Git 版本控制系統的目錄）移除，將專案相關檔案改名為您的專案名稱
4. 開啟專案，於專案的屬性設定將專案的名稱改為您的專案名稱
5. Start coding :)

## 授權條款<br />License
This project is licensed as CC0.
To the extent possible under law, Vdragon(pika1021@gmail.com) has waived all copyright and related or neighboring rights to Ｃ或Ｃ＋＋專案範本 | C or CPP project template. This work is published from: 台灣(Taiwan). 

## 已知問題<br />Known issues
請瀏覽本專案的問題追蹤系統。  
Please browse our project's issue tracker.  
[https://github.com/Vdragon/C_CPP_project_template/issues](https://github.com/Vdragon/C_CPP_project_template/issues)