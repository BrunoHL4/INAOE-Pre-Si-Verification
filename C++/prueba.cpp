#include <iostream>
#include <fstream>
#include <math.h>

using namespace std;

int main() {
	
	//Pruebas: Estos arreglos son los que vienen del código de Jose Alberto//

	std::string arr[3] = {"Input1","Input2","Input3"};
	std::string out[1] = {"Output1"};
    int c_array[] = {1,2,2};
    
    
    //Tamaño de entradas y salidas: Cambiar nombres de acuerdo a los que vienen del codigo de Jose Alberto
    int size_array = sizeof c_array/sizeof c_array[0];//Tamaño de inputs
    int size_array_o = sizeof out/sizeof out[0];//Tamaño de outputs
    
    int limite=64;
    int sumatoria=0;//Queda Igual
    int i=0;//Queda igual
    
    for (int i = 0; i < size_array; i++) {
    int numeroActual = c_array[i];//Cambiar a arreglo de inputs
    sumatoria = sumatoria + numeroActual;
	}
   
    int pot= pow(2,sumatoria);//Queda igual
    int test= pot/2;
    
 //De aquí en adelante solo cambiar nombre de archivo a como lo tienes   TAMBIEN cambiar el nombre de size_array por el nombre de array de inputs y size_array_o por el de outputs
    if (pot<=limite){ 

ofstream archivo;
	
	archivo.open("pruebaC.txt",ios::out);
	
	if (archivo.fail()){
		cout<<"Error";
		exit(1);
	}
	
	for (int i = 0; i < size_array; i++) {
	
	archivo<<arr[i]; 
	archivo<<"<=0;\n";  
	}
	archivo<<"\n"; 
	
	archivo<<"$monitor(";
	archivo<<'\u0022';
	for (int i = 0; i < size_array; i++) {
	
	archivo<<arr[i]; 
	archivo<<"=%b ";  
	}
	for (int i = 0; i < size_array_o; i++) {
	
	archivo<<out[i]; 
	archivo<<"=%b ";  
	}
	archivo<<'\u0022';

	for (int i = 0; i < size_array; i++) {
	archivo<<",";
	archivo<<arr[i]; 
	  
	}
	for (int i = 0; i < size_array_o; i++) {
	archivo<<",";
	archivo<<out[i]; 
	  
	}
	archivo<<");\n";
	
	archivo<<"for (i=0;i<";
	archivo<<pot;
	archivo<<";i=i+1)\n";
	archivo<<"begin\n";
	archivo<<"{";
	archivo<<arr[0];
	
	for (int i = 1; i < size_array; i++) {
	
	archivo<<",";
	archivo<<arr[i];  
	}
	
	archivo<<"}=i;\n";
	archivo<<"#10;\n";
	archivo<<"end\n";
	
	
	archivo.close();
}

else if (pot>limite)
{
ofstream archivo;
	
	archivo.open("pruebaC.txt",ios::out);
	
	if (archivo.fail()){
		cout<<"Error";
		exit(1);
	}
	
	for (int i = 0; i < size_array; i++) {
	
	archivo<<arr[i]; 
	archivo<<"<=0;\n";  
	}
	archivo<<"\n"; 
	
	archivo<<"$monitor(";
	archivo<<'\u0022';
	for (int i = 0; i < size_array; i++) {
	
	archivo<<arr[i]; 
	archivo<<"=%b ";  
	}
	for (int i = 0; i < size_array_o; i++) {
	
	archivo<<out[i]; 
	archivo<<"=%b ";  
	}
	archivo<<'\u0022';

	for (int i = 0; i < size_array; i++) {
	archivo<<",";
	archivo<<arr[i]; 
	  
	}
	for (int i = 0; i < size_array_o; i++) {
	archivo<<",";
	archivo<<out[i]; 
	  
	}
	archivo<<");\n";
	
	archivo<<"for (i=0;i<";
	archivo<<test;
	archivo<<";i=i+1)\n";
	archivo<<"begin\n";
	archivo<<"{";
	archivo<<arr[0];
	
	for (int i = 1; i < size_array; i++) {
	
	archivo<<",";
	archivo<<arr[i];  
	}
	
	archivo<<"}=i;\n";
	archivo<<"#10;\n";
	archivo<<"end\n";
	
	archivo<<"for (i=";
	archivo<<pot-10;	
	archivo<<";i<";
	archivo<<pot;
	archivo<<";i=i+1)\n";
	archivo<<"begin\n";
	archivo<<"{";
	archivo<<arr[0];
	
	for (int i = 1; i < size_array; i++) {
	
	archivo<<",";
	archivo<<arr[i];  
	}
	
	archivo<<"}=i;\n";
	archivo<<"#10;\n";
	archivo<<"end\n";
	
	
	archivo.close();
}
 	return 0;
}
