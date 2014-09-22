#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <iostream>

int main(){

	printf("\n\n************\nIn main()\n************\n\n"); 

	char buffer[256];
	
	
	printf("Writing to buffer\n");
	sprintf(buffer,"echo \"hello world\"");

	
	printf("\nPassing '%s' to system\n", buffer);
	printf("\n\n");
	
	int exFlg = system(buffer);
	
	printf("\n\n");
	printf("Back in main. System exit code: %d\n",exFlg);
	
	char usrIn[256];
	
	printf("\nEnter something to echo in bash:\n");
	fgets(usrIn,256,stdin);
	
	//Write beginning of bash command to buffer
	sprintf(buffer,"echo ");
	
	//preprocess
	strcat(buffer,"\"");
	
	//add user input
	strcat(buffer,usrIn);
	
	//postprocess
	strcat(buffer,"\"");
	
	printf("\nPassing '%s' to system\n", buffer);
	printf("\n\n");
	
	exFlg = system(buffer);
	
	printf("\n\n");
	printf("Back in main. System exit code: %d\n",exFlg);
	
	printf("\nEnter a command to pass to bash:\n");
	fgets(usrIn,256,stdin);

	printf("\nPassing '%s' to system\n", usrIn);
	printf("\n\n");
	
	exFlg = system(usrIn);

	printf("\n\n");
	printf("Back in main. System exit code: %d\n",exFlg);
	
	
    char directBashIn[] = "curl -o file.m http://courses.washington.edu/am301/matlab/week03/L07_testJacobiFAILS.m";
	printf("\nPassing '%s' to system\n", directBashIn);	
	printf("\n\n");
	
	
	exFlg = system(directBashIn);

	printf("\n\n");
	printf("Back in main. System exit code: %d\n",exFlg);
	
	
	sprintf(directBashIn,"curl -o d1.jpg http://justinthompson593.github.io/Public/data/d1.jpg");
	printf("\nPassing '%s' to system\n", directBashIn);	
	printf("\n\n");
	
	
	exFlg = system(directBashIn);

	printf("\n\n");
	printf("Back in main. System exit code: %d\n",exFlg);
	
	
	
	// char B1[50];
// 	
// 	for(int i = 0; i < 5; i++){
// 	
// 		sprintf(B1,"g++ -o Test%d rec.cpp", i);
// 		system(B1);
// 
// 	}
// 		
// 	char B2[] = "./a.out";
// 	system(B2);

	return 0;
}