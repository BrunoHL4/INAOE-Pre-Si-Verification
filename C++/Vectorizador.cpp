#include <iostream>
#include <string>
#include <vector>
using namespace std;
string module="module buses(inputintp,input[5:0] entrada0,prueba,output[1:0] salida,salida4,input [3:0] entrada1,input [2:0] entrada2,prueba2,output sal);//comentarios";
vector<string> inputs;  //vector de entradas
vector<string> outputs; //vector de salidas

vector<int> bitsint;       //vector con la cantidad de bits por entrada
vector<int> bitsout;        //vector con la cantidad de bits por salida

vector<string> bitrgint;       //vector con rango de buses de entrada
vector<string> bitrgout;       //vector con rango de buses de salida

vector<string> intouts;     //Vector con los nombres de las entradas y salidas sin tomar en cuenta el tamaño del bus

int main()
{
    
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
        
        if(instruction.substr(0,5)=="input"){
            instruction.replace(0,5,"reg ");//se reemplaza palabra "input" por "reg"
            inputs.push_back(instruction);//se agrega a vector
            linout=true; //bandera fue input
        }
        else if(instruction.substr(0,6)=="output"){
            instruction.replace(0,6,"wire ");//se reemplaza palabra "output" por "wire"
            outputs.push_back(instruction);//se agrega a vector
            linout=false; //bandera fue output
            
        }
        else{           //si los primeros caracteres no son ni input ni output
        
                //acceder a vector output o input
                //copiar ultimo elemento del vector
                //borrar nombre de variable y sobreescribir nuevo nombre
                //agregar a vector
            if(linout){ //si la ultima variable fue input
                string temp=inputs.back();
                temp=temp.substr(0,temp.find(']')+1);
                temp+=" "+instruction; //concatenar nombre de la variable y sus valores
                inputs.push_back(temp);
            }
            else {      //si la ultima variable fue output
                string temp=outputs.back();
                temp=temp.substr(0,temp.find(']')+1);
                temp+=" "+instruction; //concatenar nombre de la variable y sus valores
                outputs.push_back(temp);
            }
        }
        
    }
    
    //obtener rangos de bus entradas
    for(int i=0;i<inputs.size();i++){ //recorrer todo el vector de entradas
        if(inputs.at(i).find('[')!=string::npos){//si se encuentra caracter "["
            string st;
            int posi=inputs.at(i).find('[');
            int posf=inputs.at(i).find(']');
            st=inputs.at(i).substr(posi+1,posf-posi-1); //se extraen los caracteres entr los "[ ]"
            
            bitrgint.push_back(st);//se agrega a vector de rangos
            
            string nombre;//variable donde se almacenara el nombre de la entrada
            nombre=inputs.at(i).substr(posf+1,inputs.at(i).length());//se obtiene el nombre de la entrada
            intouts.push_back(nombre);//se agrega el nombre de la entrada a vector
            
            //obtener tamaño en entero de cada bus
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
            string nombre;//variable donde se almacenara el nombre de la entrada
            nombre=inputs.at(i).substr(3,inputs.at(i).length());//se obtiene el nombre de la entrada
            intouts.push_back(nombre);//se agrega el nombre de la entrada a vector
        }
    }
    
    //obtener rangos de bus salidas
    for(int i=0;i<outputs.size();i++){ //recorrer todo el vector de salidas
        if(outputs.at(i).find('[')!=string::npos){
            string st;
            int posi=outputs.at(i).find('[');
            int posf=outputs.at(i).find(']');
            st=outputs.at(i).substr(posi+1,posf-posi-1);//se extraen los caracteres entr los "[ ]"
            bitrgout.push_back(st); //se agrega a vector de rangos
            
            
            string nombre;//variable donde se almacenara el nombre de la salida
            nombre=outputs.at(i).substr(posf+1,outputs.at(i).length());//se obtiene el nombre de la salida
            intouts.push_back(nombre);//se agrega el nombre de la salida a vector
            
            ////obtener tamaño en entero de cada bus
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
        else{//si no se encuentra caracter "["
            bitrgout.push_back("1");
            bitsout.push_back(1);
            string nombre;//variable donde se almacenara el nombre de la salida
            nombre=outputs.at(i).substr(4,outputs.at(i).length());//se obtiene el nombre de la salida
            intouts.push_back(nombre);//se agrega el nombre de la salida a vector
        }
    }
    
    for(int i=0;i<intouts.size();i++){ //eliminar espacios en nombres de variables
        while(intouts.at(i).find(' ')!=string::npos){
            intouts.at(i).erase(intouts.at(i).find(' '),1);
        
        }
    }

    return 0;
}