#include <iostream>
#include <regex>
#include <string>
 using namespace std;
int main()
{
    string target(R"(
    module ejemplo (uno, dos, tres );
     output  a, b, c , d ,
      input [7:0] x, y, w , z );)");
    cout << target << endl;
    smatch sm;
    regex re("\\s*(output|input)\\s+(\\[\\d+:\\d+\\])?(.*)"); // module\\s+(\\w+)\\s*\\((.*)\\);  \\s*(input)\\s+(.*)
    while (regex_search(target ,sm, re)){
        for(auto i=1; i< sm.size();++i){
            cout << "group "<< i<<": " << sm.str(i) << endl;
        }
        target=sm.suffix();
        string suf=sm.str(3);
        int nLeft=suf.size();
        regex re1("\\s*,?\\s*(\\w+)(.*)");
        while (regex_match(suf, sm, re1)){       
            cout << "Sgroup :"<< sm.str(1) << endl;
            suf=sm.str(2);
        }
    }
}