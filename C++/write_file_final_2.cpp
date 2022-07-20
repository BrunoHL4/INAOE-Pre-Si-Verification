// basic file operations
#include <iostream>
#include <fstream>

#include <string>
#include <vector>
#include <math.h>
using namespace std;


string module_name;
///////////////////////////////////////////////////////////////////////////////////////  josue
string lectura() {
    ifstream archivo;
    string texto;                                      //Se crea el string Texto
    archivo.open("prueba_mux_design.txt", ios::in);       //Se abre el archivo en modo lectura
    string Prueba;                                     //Se crea la variable global Prueba
    string Apend;
    if (archivo.fail()) {                              //Si no se puede abrir el archivo
        cout << "No se pudo abrir el archivo";         //Se manda el mensaje
        exit(1);                                 //Se sale del programa
    }
    while (!archivo.eof()) {                          //Mientras no sea el final del archivo
        getline(archivo, texto);               //Se obtiene el texto
        if (texto.find("//")!=string::npos){       //Se emplea if para quitar los comentarios dentro del texto
            int t1 = texto.length();                  //Se busca encontra el tamaño de cada linea de texto, para quiatr los comentarios en los lugares necesarios.
            int ecom = texto.find("//");            //
            texto.erase(ecom,t1-ecom);
        }
        if (texto.find('`')!=string::npos){       //Se emplea if para quitar los comentarios dentro del texto
            int t1 = texto.length();                  //Se busca encontra el tamaño de cada linea de texto, para quiatr los comentarios en los lugares necesarios.
            int ecom = texto.find('`');            //
            texto.erase(ecom,t1-ecom);
        }
        if (texto.find('#')!=string::npos){       //Se emplea if para quitar los comentarios dentro del texto
            int t1 = texto.length();                  //Se busca encontra el tamaño de cada linea de texto, para quiatr los comentarios en los lugares necesarios.
            int ecom = texto.find('#');            //
            texto.erase(ecom,t1-ecom);
        }

        Prueba += texto;                              //Se concatena el texto
    }
    archivo.close();                                  //Se cierra el archivo

    string text = Prueba;
    string temp=Prueba.substr(Prueba.find("module"),Prueba.find('('));
    temp.erase(0,Prueba.find("module")+6);
    module_name.append(temp);
    int a = Prueba.find("(");                       //Se encuentran los corchetes
    //cout << a << endl;
    int b = a + 1;
    int c = Prueba.find(")", a);
    //cout << c << endl;

                                        //Se asigna el valor del texto utilizable a un string
    for (int i = a; i <= c; i++) {
        Apend.push_back(Prueba[i]);
    }

    //Para quitar el texto wire y reg, se realiza lo siguiente
    while(Apend.find(" wire ")!=string::npos){
        int e = Apend.find(" wire ");
        Apend.erase(e,6);
    }

    while(Apend.find(" wire[")!=string::npos){
        int e = Apend.find(" wire[");
        Apend.erase(e,5);
    }

    while(Apend.find(" reg ")!=string::npos){
        int f = Apend.find(" reg ");
        Apend.erase(f,5);
    }

    while(Apend.find(" reg[")!=string::npos){
        int f = Apend.find(" reg[");
        Apend.erase(f,4);
    }
    
  return Apend;


}
/////////////////////////////////////////////////////////////////////////////////////// jose
string module=lectura();

vector<string> inputs;  //vector de entradas
vector<string> outputs; //vector de salidas

vector<int> bitsint;       //vector con la cantidad de bits por entrada
vector<int> bitsout;        //vector con la cantidad de bits por salida

vector<string> bitrgint;       //vector con rango de buses de entrada
vector<string> bitrgout;       //vector con rango de buses de salida
string inouts="";
int main()
{
	cout<<module;
	
    int par=module.find('(');
    string t=module.substr(par+1,module.find(")")-par-1);//se toma lo que esta entre parentesis y se pega en variable t
    
    bool linout=false;    //true si la ultima variable due intput o false si la ultima variable fue output
    
    while(t.length()>0){ //extraer todas las instrucciones del string
        string instruction="";//creamos string para almacenar la instruccion
        
        if(t.find(',')!=string::npos){
            instruction=t.substr(0,t.find(','));//se toma como instruccion desde el primer caracter hasta la coma
            
            t.erase(0,t.find(',')+1);//se elimina la instruccion incluyendo la coma
        }
        else{
            instruction=t; //se toma como instruccion todo lo que quede en el string
            t.erase(0,t.back());//se elimina el string
        }
        
        if(instruction.find("input")!=-1){
            instruction.replace(0,instruction.find("input")+5,"reg ");//se reemplaza palabra "input" por "reg"
            inputs.push_back(instruction);//se agrega a vector
            string temp=instruction;
            temp.replace(0,(temp.find(']')+1),"");
            if (temp.substr(0,3)=="reg")temp.replace(0,3,"");
            inouts+=temp;
            inouts+=",";
            linout=true; //bandera fue input
        }
        else if(instruction.find("output")!=-1){
            instruction.replace(0,instruction.find("output")+6,"wire ");//se reemplaza palabra "output" por "wire"
            outputs.push_back(instruction);//se agrega a vector
            string temp=instruction;
            temp.replace(0,(temp.find(']')+1),"");
            if (temp.substr(0,4)=="wire")temp.replace(0,4,"");
            inouts+=temp;
            inouts+=",";
            linout=false; //bandera fue output
            
        }
        else{           //si los primeros caracteres no son ni input ni output
        
                //acceder a vector output o input
                //copiar ultimo elemento del vector
                //borrar nombre de variable y sobreescribir nuevo nombre
                //agregar a vector
            if(linout){ //si la ultima variable fue input
                string temp=inputs.back();
//////////////////////////////////////////////////////
                if(temp.find(']')!=string::npos){
                    temp=temp.substr(0,temp.find(']')+1);
                }
                else{
                    temp=temp.substr(0,2);
                }
//////////////////////////////////////////// 


                if(temp.find(']')!=-1) temp=temp.substr(0,temp.find(']')+1);
                else temp="reg ";
                inouts+=instruction;
                inouts+=",";
                temp+=" "+instruction; //concatenar nombre de la variable y sus valores
                inputs.push_back(temp);
            }
            else {      //si la ultima variable fue output


                string temp=outputs.back();
                temp=temp.substr(0,temp.find(']')+1);
                //////////////////////
                if(temp.find(']')!=string::npos){
                    temp=temp.substr(0,temp.find(']')+1);
                }
                else{
                    temp="wire ";
                }
              ///////////////////////
                inouts+=instruction;
                inouts+=",";
                temp+=" "+instruction; //concatenar nombre de la variable y sus valores
                outputs.push_back(temp);
            }
        
        }
      

    }
    inouts.replace(inouts.length()-1,inouts.length(),"");
    //obtener rangos de bus entradas
    for(int i=0;i<inputs.size();i++){ //recorrer todo el vector de entradas
        if(inputs.at(i).find('[')!=string::npos){//si se encuentra caracter "["
            string st;
            int posi=inputs.at(i).find('[');
            int posf=inputs.at(i).find(']');
            st=inputs.at(i).substr(posi+1,posf-posi-1); //se extraen los caracteres entr los "[ ]"
            
            bitrgint.push_back(st);//se agrega a vector de rangos
            
            //obtener tamaño en entero de cad bus
            int rango=0;//variable donde se almacenara el rango
            int r1=stoi(st.substr(0,st.find(':')));
            int r2=stoi(st.substr(st.find(':')+1,st.back()));
            
            if(r1>r2){ //si el numero a la izquierda es mayor al de la derecha
                rango=r1-r2+1;
                bitsint.push_back(rango);
                
            }
            else{ //si el numero a la izquierda es menor al de la derecha
                rango=r2-r1+1;
                bitsint.push_back(rango);
            }

        }
        else{                           //si no se encuentra caracter "["
            bitrgint.push_back("1"); //se asume que el rango es 1
            bitsint.push_back(1);   //se asume que el rango es 1
        }
    }
    
    //obtener rangos de bus salidas
    for(int i=0;i<outputs.size();i++){ //recorrer todo el vector de salidas
        if(outputs.at(i).find('[')!=string::npos){
            string st;
            int posi=outputs.at(i).find('[');
            int posf=outputs.at(i).find(']');
            st=outputs.at(i).substr(posi+1,posf-posi-1);//se extraen los caracteres entr los "[ ]"
            bitrgout.push_back(st);
            
            //
            int rango=0;//variable donde se almacenara el rango
            int r1=stoi(st.substr(0,st.find(':')));
            int r2=stoi(st.substr(st.find(':')+1,st.back()));
            
            if(r1>r2){ //si el numero a la izquierda es mayor al de la derecha
                rango=r1-r2+1;
                bitsout.push_back(rango);
                
            }
            else{ //si el numero a la izquierda es menor al de la derecha
                rango=r2-r1+1;
                bitsout.push_back(rango);
            }
            //
        }
        else{
            bitrgout.push_back("1");
            bitsout.push_back(1);
        }
    }
    //obtener string de variables 
    
/////////////////////////////////////////////////////////////////////////////////////// bruno
    int combinaciones=0;
    string input_comb;
    vector<string> arr= inputs;
     for (int i=0; i<arr.size(); i++) {
        arr[i].erase(0,arr[i].find("reg")+3);
        if(arr[i].find(']')!=-1)arr[i].erase(0,arr[i].find(']')+1);
        input_comb.append(arr[i]);
        input_comb.append(",");
    }
    input_comb.erase(input_comb.length()-1,input_comb.length());

    for (int i=0; i<bitsint.size(); i++) {
        combinaciones+=bitsint[i];
    }
    combinaciones=pow (2, combinaciones);
    if (combinaciones>64)combinaciones=64;
///////////////////////////////////////////////////////////////////////////////////////

  ofstream myfile;
  myfile.open ("testBench.txt");
  myfile << "`timescale 1ns/100ps\n";

  myfile <<"module automatic_TB ();\n";
  myfile << "/*        variables          */\n";

  for(int i=0;i<inputs.size();i++){
    myfile << inputs[i]<<";\n";
  }                                                         
    for(int i=0;i<outputs.size();i++){
    myfile <<  outputs[i]  <<";\n";
  }
  myfile << "\n";
  myfile << module_name <<"\n";  //module name
  myfile << "DUT("<< inouts <<");\n";  /// module variables
  myfile << "initial begin\n";
  myfile << "$dumpvars; $dumpfile(\"dump.vcd\");\n";
  myfile << "\n$monitor(\"";
  for (int i=0;i<inputs.size();i++) myfile << "%b ";
  for (int i=0;i<outputs.size();i++) myfile << "%b ";
  myfile << "\",";
  myfile << inouts;
  myfile << ");\n";
  myfile << "\nfor(int i=0;i<"<<combinaciones<<";i++)begin";
  myfile << "\n     {"<<input_comb<<"}=i;";
  myfile << "\n      #1;";
  myfile << "\nend";
  myfile << "\n";
  myfile << "\n";
  myfile << "\n";
  myfile << "$finish();\n";
  myfile << "end\n";
  myfile << "endmodule\n";
  myfile << "/*  ---------------module end------------------       */\n";
  myfile << "\n";


  myfile.close();
  return 0;
}