#include <iostream>
#include <vector>
#include <numeric>
using namespace std;

int main() { 
   vector<int> v; 
   const int START = 1, END = 10; 
   for( int i = START; i <= END; ++i )
      v.push_back(i);
   int sum = accumulate( v.begin(), v.end(), 0 );
   cout << "sum from " << START << " to " << END << " is " << sum << '\n';
   return 0;
 }