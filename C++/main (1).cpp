#include <iostream>
#include <vector>
#include <string.h>

using namespace std;
class lcd7s{
    private:
        
        char caracter;
        
    public:
        vector<vector<char>>fila;
        lcd7s();
        void show(char);
    
    
    
};

lcd7s::lcd7s(){
    
}

void lcd7s::show(char _caracter){
    caracter=_caracter;
    switch(caracter){
        case '0':
             fila =
                {
                    { ' ', '*', '*', '*', ' ' },
                    { '*', ' ', ' ', ' ', '*' },
                    { '*', ' ', ' ', ' ', '*' },
                    { '*', ' ', ' ', ' ', '*' },
                    { '*', ' ', ' ', ' ', '*' },
                    { '*', ' ', ' ', ' ', '*' },
                    { ' ', '*', '*', '*', ' ' },
                };
            break;
        case '1':
             fila =
                {
                    { ' ', ' ', '*', ' ', ' ' },
                    { ' ', ' ', '*', ' ', ' ' },
                    { ' ', ' ', '*', ' ', ' ' },
                    { ' ', ' ', '*', ' ', ' ' },
                    { ' ', ' ', '*', ' ', ' ' },
                    { ' ', ' ', '*', ' ', ' ' },
                    { ' ', ' ', '*', ' ', ' ' },
                };
            break;
        case '2':
            fila =
                {
                    { ' ', '*', '*', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', '*', '*', '*', ' ' },
                    { ' ', '*', ' ', ' ', ' ' },
                    { ' ', '*', ' ', ' ', ' ' },
                    { ' ', '*', '*', '*', ' ' },
                };
        
            break;
        case '3':
            fila =
                {
                    { ' ', '*', '*', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', '*', '*', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', '*', '*', '*', ' ' },
                };
        
            break;
        case '4':
            fila =
                {
                    { ' ', '*', ' ', '*', ' ' },
                    { ' ', '*', ' ', '*', ' ' },
                    { ' ', '*', ' ', '*', ' ' },
                    { ' ', '*', '*', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                };
        
            break;
        case '5':
            fila =
                {
                    { ' ', '*', '*', '*', ' ' },
                    { ' ', '*', ' ', ' ', ' ' },
                    { ' ', '*', ' ', ' ', ' ' },
                    { ' ', '*', '*', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', '*', '*', '*', ' ' },
                };
        
            break;
        case '6':
            fila =
                {
                    { ' ', '*', '*', '*', ' ' },
                    { ' ', '*', ' ', ' ', ' ' },
                    { ' ', '*', ' ', ' ', ' ' },
                    { ' ', '*', '*', '*', ' ' },
                    { ' ', '*', ' ', '*', ' ' },
                    { ' ', '*', ' ', '*', ' ' },
                    { ' ', '*', '*', '*', ' ' },
                };
        
            break;
        case '7':
            fila =
                {
                    { ' ', '*', '*', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                };
        
            break;
        case '8':
            fila =
                {
                    { ' ', '*', '*', '*', ' ' },
                    { ' ', '*', ' ', '*', ' ' },
                    { ' ', '*', ' ', '*', ' ' },
                    { ' ', '*', '*', '*', ' ' },
                    { ' ', '*', ' ', '*', ' ' },
                    { ' ', '*', ' ', '*', ' ' },
                    { ' ', '*', '*', '*', ' ' },
                };
        
            break;
        case '9':
            fila =
                {
                    { ' ', '*', '*', '*', ' ' },
                    { ' ', '*', ' ', '*', ' ' },
                    { ' ', '*', ' ', '*', ' ' },
                    { ' ', '*', '*', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                    { ' ', ' ', ' ', '*', ' ' },
                };
        
            break;
            
    
    }
    
    
}

using namespace std;
char numbers[255];
int main()
{
    cout<<"Ingrese el numero: ";
    cin>>numbers;
    lcd7s lcd1= lcd7s();
    for(int j=0;j<7;j++){
        for(int k=0;k<strlen(numbers);k++){
            lcd1.show(numbers[k]);
            for(int i=0;i<5;i++){
                cout<<lcd1.fila[j][i];
            }
        }
        cout<<"\n";
    }
    lcd1.show('2');
    lcd1.show('3');
    lcd1.show('4');

    return 0;
}