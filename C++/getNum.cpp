#include <iostream>
using namespace std;
int main(){
bool yourNum;
cout << "\nElige 0 si Opcion 1" << endl;
cout << "\nElige 1 si Opcion 2" << endl;
cout << "\nYour Number: " << endl;
cin >> yourNum;
if(cin.fail()){
     cin.clear();
     cin.ignore();
    cout << "Invalid" << endl;
}else if (yourNum==0){

cout << "Option 0, Your number is: " <<yourNum << endl;
}
else if (yourNum==1){

cout << "Option 1, Your number is: " <<yourNum << endl;
}
return 0;
}
