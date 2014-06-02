## 「[C 或 C++ 程式語言專案範本](https://github.com/Vdragon/C_CPP_project_template)」內容未初始化說明<br />"[C or C++ project template](https://github.com/Vdragon/C_CPP_project_template)" content not-initialized note
如果您看到此段文字代表本檔案尚未被專案開發者自訂為他自己的版本，內容僅供參考。如果您是此專案的開發者請修改成自己需要的內容並移除下方水平線之上的所有內容。  
If you see this paragraph means that this file is NOT customized to the project devloper's version and the content is for reference only.  If you're this project's developer please customize this file's content then remove all of the contents up from the horizontal line.

### 軟體建構依賴關係<br />Software build dependency
本專案需要下列函式庫以便建構：

* [Ｖ字龍的C、C++程式語言函式庫收集<br />Vdragons C CPP Libraries Collection](https://github.com/Vdragon/Vdragons_C_CPP_Libraries_Collection)
	* VCCL_showSoftwareInfo
	* VCCL_printSomething
	* VCCL_Error_C
	* VCCL_pauseProgram 

請將函式庫、函式庫標頭檔(library headers)安裝到系統預設搜索目錄，或是放在 Libraries/ 、Library_headers/ 子目錄中再進行軟體建構。

### 如何使用？<br />How to use it?
1. 將程式碼封存檔下載下來並解封裝
2. 將 C_CPP_project_template 目錄改名為您的專案名稱
3. 以專案根目錄作為當前工作目錄(current working directory)在終端機中執行 bash Tools/initializeProject.bash.sh 初始化專案
4.將本軟體所需要的函式庫與函式庫標頭檔放到 Libraries/ 與 Library_headers/ 目錄中
5. Start coding :)

### 授權條款<br />License
This project template is licensed as CC0.
To the extent possible under law, Vdragon(pika1021@gmail.com) has waived all copyright and related or neighboring rights to Ｃ或Ｃ＋＋專案範本 | C or CPP project template. This work is published from: 台灣(Taiwan). 

### 已知問題<br />Known issues
請瀏覽本專案的問題追蹤系統。  
Please browse our project's issue tracker.  
[https://github.com/Vdragon/C_CPP_project_template/issues](https://github.com/Vdragon/C_CPP_project_template/issues)

-------------------------------------
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

## 授權條款<br />License

## 常見問題與解答<br />Frequently Asked Questions and answers
