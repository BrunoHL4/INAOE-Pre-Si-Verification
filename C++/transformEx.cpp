#include <iostream>
#include <vector>
#include <algorithm>
//#include <numeric>

using namespace std;
int increment(int i) { return ++i; }
int sum(int a, int b) { return a+b; }  
int main() { 
vector<int> v1; 
for(int i=1; i<6; i++) v1.push_back (i*i); 
for (int i=1; i<6; i++)
cout<< v1[i-1] << ' ';
cout<<endl;
// v1: 1 4 9 16 25 
vector<int> v2(v1.size()); 
transform(v1.begin(), v1.end(), v2.begin(), increment); 
for (int i=1; i<6; i++)
cout<< v2[i-1] << ' ';
cout<<endl;
// v2: 2 5 10 17 26  
// add the elements of v1 and v2 together, store the result in v1
 
transform(v1.begin(), v1.end(), v2.begin(), v1.begin(), sum); 
// v1: 3 9 19 33 51 //
return 0;
 }