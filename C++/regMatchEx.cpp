#include <iostream>
#include <regex>
#include <string>
 using namespace std;
int main()
{
    string target("module ejemplo (uno, dos, tres );");
    smatch sm;
     regex re("^\\s*module\\s+(\\w+)\\s*\\((.*)\\s*\\)\\s*;"); // module\\s+(\\w+)\\s*\\((.*)\\);

    regex_match(target,sm, re);
    for(auto i=1; i< sm.size();++i){
        cout << "group "<< i<<": " << sm.str(i) << endl;
    }
    /*
            if (sm.size() >= 2) {
                 ssub_match base_sub_match = sm[1];
                 string base = base_sub_match.str();
                 cout << target << " has a base of " << base 
                 << endl << sm.str(2) <<endl;
            }
    cout << sm.size()<< endl;
    cout << sm.str(1) << endl;
    */
   string suf=sm.str(2);
   int nLeft=suf.size();
   //cout << "suf: " << suf << endl;
    regex re1("\\s*,?\\s*(\\w+)(.*)");
    while (nLeft >0){
        regex_match(suf, sm, re1);
        /*
        for(auto i=1; i< sm.size();++i){
            cout << "Sgroup "<< i<<": " << sm.str(i) << endl;
        }
        */
       cout << "Sgroup :"<< sm.str(1) << endl;
        suf=sm.str(2);
        nLeft=suf.size();
 //       cout << "suf: " << suf << " size: " <<nLeft <<endl;
    }
    /*
     cout << "entire match: " << sm.str() << endl
              << "group #1: " << sm.str(1) << endl
              << "subffix " << sm.suffix() << endl;
*/

}