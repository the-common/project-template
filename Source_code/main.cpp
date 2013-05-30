/*
	主程式

	本程式的框架基於「C/C++ program templates」專案
	This program's frame is based on "C/C++ program templates" project
		https://github.com/Vdragon/C_CPP_program_templates
*/
/* 程式所引入(include)之函式庫的標頭(header)檔案
 * Included library headers */
	/* Standard C/C++ library */
    /* for EXIT_* return code definition */
		  #include <stdlib.h>

  /* Vdragons_C_CPP_Libraries_Collection
   * https://github.com/Vdragon/Vdragons_C_CPP_Libraries_Collection */
    /* for pausing program definition */
		  #include "pauseProgram/pauseProgram.h"
    /* for showing software info */
		  #include "showSoftwareInfo/showSoftwareInfo.h"

/* 常數與巨集的定義
 * Definition of constants & macros */

/* 資料類型、enumeration、資料結構與物件類別的定義
 * Definition of data type, enumeration, data structure and class */

/* 函式的宣告（函式雛型）
 * Function declarations (function prototypes)
     用途
     Usage 
       預先告訴編譯器(compiler)子程式的存在 */

/* 全域變數
 * Global Variables */

/* 函式的實作
 * Function implementations */
  int main(int argc, char *argv[]){
  /*用來重新運行程式的label*/
  restart_program:
    showSoftwareInfo("主程式");

    /* 暫停程式運行（於main函式中） */
    if(pauseProgram() == 1){
      goto restart_program;
    }

    return EXIT_SUCCESS;
  }
