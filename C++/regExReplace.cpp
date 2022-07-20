#include <iostream>
#include <string>
#include <regex>
#include <iterator>
using namespace std;
int main () {
   string s ("there is a subsequence in the string\n");
   regex e ("\\b(sub)([^ ]*)");

   cout << regex_replace (s,e,"sub-$2");
  
   string result;
   regex_replace (back_inserter(result), s.begin(), s.end(), e, "$2");
   cout <<"Result:" << result << endl;

   cout << regex_replace (s,e,"$1 and $2",regex_constants::format_no_copy);
   cout << endl;

   return 0;
}