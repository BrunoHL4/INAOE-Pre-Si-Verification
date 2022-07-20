#include <iostream>
#include <string>
#include <regex>
 using namespace std;
int main()
{
    // Simple regular expression matching
    const  string fnames[] = {"foo.txt", "bar.txt", "baz.dat", "zoidberg"};
    const  regex txt_regex("[a-z]+\\.txt");
 
    for (const auto &fname : fnames) {
         cout << fname << ": " <<  regex_match(fname, txt_regex) << endl;
    }   
 //----------------------------------------------
    // Extraction of a sub-match
    const  regex base_regex("([a-z]+)\\.txt");
     smatch base_match;
 
    for (const auto &fname : fnames) {
        if ( regex_match(fname, base_match, base_regex)) {
            // The first sub_match is the whole string; the next
            // sub_match is the first parenthesized expression.
            if (base_match.size() == 2) {
                 ssub_match base_sub_match = base_match[1];
                 string base = base_sub_match.str();
                 cout << fname << " has a base of " << base << '\n';
            }
        }
    }
 //----------------------------------------------
    // Extraction of several sub-matches
    const  regex pieces_regex("([a-z]+)\\.([a-z]+)");
     smatch pieces_match;
 
    for (const auto &fname : fnames) {
        if ( regex_match(fname, pieces_match, pieces_regex)) {
             cout << fname << endl;
            for (size_t i = 0; i < pieces_match.size(); ++i) {
                 ssub_match sub_match = pieces_match[i];
                 string piece = sub_match.str();
                 cout << "  submatch " << i << ": " << piece << endl;
            }   
        }   
    }   
}