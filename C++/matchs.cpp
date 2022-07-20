#include <iostream>
#include <regex>
#include <string>
 using namespace std;
int main()
{
    string target("module ejemplo (uno, dos, tres );");
    smatch sm;
 
    regex re1("^\\s*module\\s+(\\w+)");
    regex_search(target, sm, re1);
     cout << "entire match: " << sm.str(0) << '\n'
              << "submatch #1: " << sm.str(1) << '\n'
              << "subffix " << sm.suffix() <<endl;

    string target2 = sm.suffix();
    regex re2("(\\w+)");
    regex_search(target2, sm, re2);
     cout << "Num of matches : " << sm.size() << endl;
     cout << "entire match: " << sm.str(0) << '\n'
              << "submatch #1: " << sm.str(1) << '\n'
              << "suffix : " << sm.suffix() << '\n' ;
target2 =sm.suffix();              
 regex_search(target2, sm, re2);
      cout << "Num- of matches : " << sm.size() << endl;
   cout      << "submatch #1: " << sm.str(1) << '\n'
              << "suffix : " << sm.suffix() << '\n' ;
target2 =sm.suffix();              
 regex_search(target2, sm, re2);
      cout << "Num-3 of matches : " << sm.size() << endl;
   cout      << "submatch #1: " << sm.str(1) << '\n'
              << "suffix : " << sm.suffix() << '\n' ;

}