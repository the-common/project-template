# 軟體建構解決方案/Eclipse CDT 整合式開發環境/<br>Build solutions/Eclipse CDT IDE/
## 這是什麼？<br />What is this?
此為存放 Eclipse CDT 整合式開發環境檔案與其建構產物的目錄

## 本目錄下的項目說明<br />Description of the items under this directory
### [Debug/](Debug/)
### [Release/](Release/)
### [說明文件.md<br>README.md](README.md)
本說明檔案
### [.project](.project)
Eclipse 整合式開發環境專案檔案
### [.cproject](.cproject)
Eclipse CDT 專案檔案
### [.gitignore](.gitignore)
Git 版本控制系統版本追蹤忽略規則

## 以本軟體建構解決方案建構軟體需要額外安裝的軟體
* Eclipse 整合式開發環境
* CDT Eclipse 模組

## 如何以本軟體建構解決方案建構軟體
1. 點擊「檔案(F) > 匯入(I)」選單項目，選取匯入來源(S)中選取「General > 匯入現有的專案至工作區」然後點選「下一步(N)」於「選取根目錄(T)」文字輸入框中填入本目錄的路徑然後點選「完成(F)」將專案匯入到 Eclipse 中
2. 於專案瀏覽器中點兩下本專案開啟專案。
3. 如果目前不在 C/C++ 視景的話切換到該視景，然後點選「專案(P) > 建構專案(B)」建構軟體。
