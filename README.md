## 「[通用軟體專案範本](https://github.com/Vdragon/Generic_Software_Project_Template)」內容未初始化說明<br />"[Generic Software Project Template](https://github.com/Vdragon/Generic_Software_Project_Template)" content not-initialized note
如果您看到此段文字代表本檔案尚未被專案開發者自訂為他自己的版本，內容僅供參考。如果您是此專案的開發者請修改成自己需要的內容並移除下方水平線之上的所有內容。  
If you see this paragraph means that this file is NOT customized to the project devloper's version and the content is for reference only.  If you're this project's developer please customize this file's content then remove all of the contents up from the horizontal line.

### 如何使用？<br />How to use it?
1. 將程式碼封存檔下載下來並解封裝
2. 將 Generic_Software_Project_Template 目錄改名為您的專案名稱
3. 以專案根目錄作為當前工作目錄(current working directory)在終端機中執行 bash Tools/initializeProject.bash.sh 初始化專案
4. 依照您要開發的軟體類型將需要的檔案放到他們該在的目錄中
	* 比方說，將本軟體所需要的函式庫與函式庫標頭檔放到 Libraries/ 與 Library headers/ 目錄中
	* 您可以移除您不會用到的目錄
5. 開始設計軟體 :)

### 授權條款<br />License
This project template is licensed as CC0.
To the extent possible under law, Vdragon(Vdragon.Taiwan@gmail.com) has waived all copyright and related or neighboring rights to 通用軟體專案範本(Generic Software Project Template). This work is published from: 台灣(Taiwan). 

### 已知問題<br />Known issues
請瀏覽本專案的問題追蹤系統。  
Please browse our project's issue tracker.  
[https://github.com/Vdragon/Generic_Software_Project_Template/issues](https://github.com/Vdragon/Generic_Software_Project_Template/issues)

-------------------------------------
# 〈專案名稱〉<br />&lt;Project_name&gt;

## 這是什麼？<br />What is this?

## 本專案的智慧財產授權條款<br />Intellectual property license of this project

## 如何建構專案？<br />How to build the project?
本專案支援多種軟體建構方式，請參考[軟體建構解決方案/](Build solutions/)目錄的說明文件。

## 本目錄下的檔案與目錄說明<br />Description of files and directories under this directory
* Source code/
    * 軟體的來源程式碼  
      Software's source code
* [軟體建構解決方案/<br />Build solutions/](Build solutions/)
* 3rd party software/
	* This directory stores 3rd party software used by this project
* Tools/
	* 專案相關的一些工具
* [Library headers/](Library headers/)
	* 專案使用的第三方函式庫之標頭(header)檔搜尋目錄
* Libraries/
	* 專案使用的第三方函式庫搜尋目錄
	* ${Target or configuration name}/
* Resources/
	* 軟體會使用到但是非程式的資源
* Documentation/
	* 專案的其他說明文件
* Coding style configuration/
	* 程式碼撰寫風格設定檔
* Git hooks/
	* 專案使用的 Git 版本控制系統掛勾程式(hook)
* [專案說明文件.md<br />README.md](README.md)
	* 本說明文件  
	  This documentation

## 常見問題與解答<br />Frequently Asked Questions and answers

## 如何對本專案做出貢獻<br />How to contribute to this project
### 回報問題與改善建議<br />Report issues and improvement suggestions
* 發現問題或是有改善本專案的建議的話請到[本專案的問題追蹤系統(issue tracker)](../../issues)建檔回報

### 貢獻本專案內容
* 要貢獻內容的話歡迎克隆(clone)本專案的版本倉庫至您的電腦中，建立並切換至一個新的 Git 分支(branch)完成編輯後提交(commit)為一個新版本，推送到您的 GitHub 版本倉庫再跟我們的版本倉庫發出拉取請求(pull request)

### 宣傳本專案給別人

### 翻譯本專案內容
如果您熟悉其他語言，歡迎將本專案之內容翻譯為不同的語言
