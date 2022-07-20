#include <iostream>     // cout
#include <algorithm>    // count
//--------------
// count (InputIterator first, InputIterator last, const T& val)
//--------------
#include <vector>       // vector
#include <array>        // array
using namespace std;
int main () {
  // counting elements in array:
  array<int,8> myints{10,20,30,30,20,10,10,20};   // 8 elements
  cout << myints.size() << endl;
  
  int mycount = count (myints.begin(), myints.end(), 10);
  cout << "10 appears " << mycount << " times.\n";

  // counting elements in container:
  vector<int> myvector (myints.begin(), myints.end());
  mycount = count (myvector.begin(), myvector.end(), 20);
  cout << "20 appears " << mycount  << " times.\n";
  mycount = count (myvector.begin(), myvector.end(), 30);
  cout << "30 appears " << mycount  << " times.\n";

  return 0;
}