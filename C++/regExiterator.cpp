// sregex_iterator constructor
#include <iostream>
#include <string>
#include <regex>
using namespace std;
int main ()
{
//  string s ("( uno, dos, tres, five);");
  string s ("module nombreMod ( uno, dos, tres, five);");

  regex e ("(\\w+)");   // matches words \\s*\\[\\d+:\\d+\\])\\s+

  sregex_iterator rit ( s.begin(), s.end(), e );
  sregex_iterator rend;

  while (rit!=rend) {
    cout << rit->str() << endl;
    ++rit;
  }
}