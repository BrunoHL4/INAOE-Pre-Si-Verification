#include <iostream>
#include <iomanip>
#include <bitset>
using namespace std;
 
int main() {
    int c{85};
    cout <<"A = "<< right << setw(10) << setfill(' ') << oct<< c <<" in octal"<<endl;
    cout << left << setw(15) << setfill('-')  << '+' 
         << setw(21) << setfill('-') << '+' << '+' << endl;
   return 0;
}