#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <iostream>

int main(){

	char u_password[] = "myPassword";

	printf("\nEnter password:\n:");
	
	char usrIn[sizeof(u_password)];
	
	fgets(usrIn,sizeof(u_password),stdin);
	
	if(strcmp(u_password,usrIn)){
		printf("\ninvalid password\n");
	}
	else{
	
		static const char fileName[] = "sample.txt";
   		FILE *file = fopen(fileName, "r");
   		if (file != NULL)
   		{
      		char line [256]; /* or other suitable maximum line size */
      		while ( fgets(line, sizeof line, file) != NULL ) /* read a line */
		      {
		         fputs(line,stdout); /* write the line */
		      }
	      fclose(file);
	   }
	   else
	   {
    	  printf("Invalid File Name"); 
	   }	
		
		printf("\n");
	
	}

	printf("Enter file to read: ");
	char fileNameBuf[256];
	fgets(fileNameBuf,sizeof(fileNameBuf),stdin);
	FILE *file2 = fopen(fileNameBuf,"r");
	
	printf("Printing contents of %s",fileNameBuf);

	if (file2 != NULL)
   		{
      		char line [256]; /* or other suitable maximum line size */
      		while ( fgets(line, sizeof line, file2) != NULL ) /* read a line */
		      {
		         fputs(line,stdout); /* write the line */
		      }
	      fclose(file2);
	   }
	else
	   {
    	  printf("Invalid File Name"); 
	   }	
		
		printf("\n");


	


	printf("\n\n");
	printf("End of main\n");
	return 0;
}

//***********************REFERENCE BELOW*******************************
	// printf("\n\n************\nIn main()\n************\n\n"); 
// 
// 	char buffer[256];
// 	
// 	
// 	printf("Writing to buffer\n");
// 	sprintf(buffer,"echo \"hello world\"");
// 
// 	
// 	printf("\nPassing '%s' to system\n", buffer);
// 	printf("\n\n");
// 	
// 	int exFlg = system(buffer);
// 	
// 	printf("\n\n");
// 	printf("Back in main. System exit code: %d\n",exFlg);
// 	
// 	char usrIn[256];
// 	
// 	printf("\nEnter something to echo in bash:\n");
// 	fgets(usrIn,256,stdin);
// 	
// 	//Write beginning of bash command to buffer
// 	sprintf(buffer,"echo ");
// 	
// 	//preprocess
// 	strcat(buffer,"\"");
// 	
// 	//add user input
// 	strcat(buffer,usrIn);
// 	
// 	//postprocess
// 	strcat(buffer,"\"");
// 	
// 	printf("\nPassing '%s' to system\n", buffer);
// 	printf("\n\n");
// 	
// 	exFlg = system(buffer);
// 	
// 	printf("\n\n");
// 	printf("Back in main. System exit code: %d\n",exFlg);
// 	
// 	printf("\nEnter a command to pass to bash:\n");
// 	fgets(usrIn,256,stdin);
// 
// 	printf("\nPassing '%s' to system\n", usrIn);
// 	printf("\n\n");
// 	
// 	exFlg = system(usrIn);
// 
// 	printf("\n\n");
// 	printf("Back in main. System exit code: %d\n",exFlg);
// 	
// 	
//     char directBashIn[] = "curl -o file.m http://courses.washington.edu/am301/matlab/week03/L07_testJacobiFAILS.m";
// 	printf("\nPassing '%s' to system\n", directBashIn);	
// 	printf("\n\n");
// 	
// 	
// 	exFlg = system(directBashIn);
// 
// 	printf("\n\n");
// 	printf("Back in main. System exit code: %d\n",exFlg);
// 	
// 	
// 	sprintf(directBashIn,"curl -o d1.jpg http://justinthompson593.github.io/Public/data/d1.jpg");
// 	printf("\nPassing '%s' to system\n", directBashIn);	
// 	printf("\n\n");
// 	
// 	
// 	exFlg = system(directBashIn);
// 
// 	printf("\n\n");
// 	printf("Back in main. System exit code: %d\n",exFlg);
// 	
