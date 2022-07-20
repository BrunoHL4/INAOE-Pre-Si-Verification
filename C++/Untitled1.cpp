#include <iostream>
using namespace std;
int segmentoa=1;
int segmentob=0;
int segmentoc=0;
int segmentod=1;
int segmentoe=1;
int segmentof=1;
int segmentog=0;

int main()
{

if (segmentoa==1)
{
    cout << "  ***  " << endl;
}
if (segmentof==1 && segmentoa==0)
{
    cout << "       " << endl;
    cout << "*" << endl;
    cout << "*" << endl;
}
if (segmentof==1 && segmentoa==1)
{
    cout << "*" << endl;
    cout << "*" << endl;
}
if (segmentoe==1 && segmentof==0 && segmentoa==0 && segmentog==0)
{
	cout << "       " << endl;
	cout << "       " << endl;
	cout << "       " << endl;
    cout << "       " << endl;
    cout << "*" << endl;
    cout << "*" << endl;
}
if (segmentoe==1 && segmentof==1 && segmentoa==0 && segmentog==0)
{
    cout << "       " << endl;
	cout << "*" << endl;
    cout << "*" << endl;
}
if (segmentoe==1 && segmentof==1 && segmentoa==0 && segmentog==0)
{
    cout << "       " << endl;
	cout << "*" << endl;
    cout << "*" << endl;
}









if (segmentod==1 && segmentoa==0 && segmentof==0 && segmentoe==0)
{
	cout << "       " << endl;
    cout << "       " << endl;
    cout << "       " << endl;
    cout << "       " << endl;
    cout << "       " << endl;
    cout << "  ***  " << endl;
}
if (segmentod==1 && segmentoa==1 && segmentof==0 && segmentoe==0)
{
    cout << "       " << endl;
    cout << "       " << endl;
    cout << "       " << endl;
    cout << "       " << endl;
    cout << "  ***  " << endl;
}
if (segmentod==1 && segmentoa==1 && segmentof==1 && segmentoe==0)
{
    cout << "       " << endl;
    cout << "       " << endl;
    cout << "  ***  " << endl;
}
if (segmentod==1 && segmentoa==1 && segmentof==0 && segmentoe==1)
{
    cout << "  ***  " << endl;
}
if (segmentod==1 && segmentoa==1 && segmentof==1 && segmentoe==1)
{
    cout << "  ***  " << endl;
}


}
