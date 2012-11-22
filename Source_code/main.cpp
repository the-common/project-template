/*
main.c
	主程式
	請見本檔案的 header 檔案以得到更多關於本檔案的說明
*/
/*||||| 程式所 include 之函式庫的標頭檔 | Included Library Headers |||||*/
/* Standard C/C++ library definitions */
	#include <stdlib.h>
		/* for EXIT_* return code */
	#include "pauseProgram/Pause_program.h"
		/* for pausing program execution */
	#include "Show_software_info/Show_software_info.h"
		/* for showing software info */
/*||||| 常數與巨集 | Constants & Macros |||||*/

/*||||| Definition of data type, enumeration, data structure and class |||||*/

/*||||| 函式雛型 | Function Prototypes |||||*/

/*||||| 全域變數 | Global Variables |||||*/

/*||||| 主要程式碼 | Main Code |||||*/
int main(int argc, char *argv[]){
/*用來重新運行程式的label*/
restart_program:
	show_software_info("主程式");

	/*暫停程式運行（於main函式中）*/
	if(pauseProgram() == 1){
		goto restart_program;
	}

	return EXIT_SUCCESS;
}
