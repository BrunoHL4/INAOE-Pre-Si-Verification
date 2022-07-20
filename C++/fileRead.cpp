// print the content of a text file.
#include <iostream>     // std::cout
#include <fstream>      // std::ifstream
using namespace std;
//-------------------------------------
int main () {
  ifstream ifs;

  ifs.open ("test.txt", ifstream::in);
  char c = ifs.get();

  while (ifs.good()) {
    cout << c;
    c = ifs.get();
  }

  ifs.close();
  return 0;
}