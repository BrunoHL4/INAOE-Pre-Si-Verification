#include <iostream> // std::cout
#include <fstream> // std::ifstream
#include <string>
#include <list>
using namespace std;
//-------------------------------------
int main()
{
    ifstream myFile;
    myFile.open("test.txt");
    string line;

    list<string> lines;
    list<string>::iterator i_lines;

    while (myFile.good())
    {
        getline(myFile, line);
        lines.push_back(line);
        cout << line << endl;
    }

    return 0;
}
