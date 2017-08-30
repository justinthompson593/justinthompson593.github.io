#include <iostream>
#include <string.h>
#include <fstream>
/***********************************************************************
*
* momsPasswords.cpp
*
*	USAGE: 	$ momsPasswords [args]
*
*	DESCR: 	
*
*	OUTPUT:	
***********************************************************************/

using namespace std;



int main(int argc, char* argv[]){

	
	cout << "Enter your " << endl;
	
	
	// parse input
//	for (int i=0; i<argc; i++){
//		// Read file in as string
//		if(strncmp(argv[i],"-fs",3) == 0 && (i+1)<argc){// $ momsPasswords.cpp -fs arg1    Convert to string, send to STDOUT
//			i++;							// next arg is a file want to convert to string
//			ifstream ifs(argv[i]);			// read in file
//											// convert to string fileIn
//			string fileIn((istreambuf_iterator<char>(ifs)),(istreambuf_iterator<char>()));
//			cout << "File: " << argv[i] << endl;
//			cout << "Content: " << fileIn << endl;
//		}
//		if(strncmp(argv[i],"-sf",3) == 0 && (i+2)<argc){// $ momsPasswords.cpp -sf arg1 arg2
//			i++;								// next arg is a string; convert to file 
//			string strIn(argv[i]);				// convert input to str
//			ofstream outFile;					// file handle for output
//			outFile.open(argv[i+1], ios::out);	// change out -> app to append to file instead of overwriting each time
//			if(outFile.is_open()){	
//				outFile << strIn;				// write strIn to file and close
//				outFile.close();}
//			else{/*handle error*/ }
//		}
//		else if(strncmp(argv[i],"-sf",3) == 0 && (i+1)<argc){// $ momsPasswords.cpp -sf
//			i++;								// next arg is a string; convert to file 
//			string strIn(argv[i]);				// convert input to str
//			ofstream outFile;					// file handle for output
//			char outName[] = "momsPasswordsOut.html";	// for a default output name
//			outFile.open(outName, ios::out);	// change out -> app to append to file instead of overwriting each time
//			if(outFile.is_open()){	
//				outFile << strIn;				// write strIn to file and close
//				outFile.close();}
//			else{/*handle error*/ }
//		}
//	}
	return 0;
}
