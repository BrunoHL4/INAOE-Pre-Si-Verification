#include <iostream>
#include<stdio.h>

#include<conio.h>
#include <dos.h>
#include <windows.h>
#include<winuser.h>

using namespace std;

void moveCursor(int a,int b)
{
    COORD p;
    p.X=a;
    p.Y=b;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), p);
}

int main()
{
    int x=0,y=0,j=0;
    char lst_chr[100];
    int lst_chr_i=0;
bool col=true;

for(int i=0;;i++)
{
  while(col)
  {
    char chr=getch();
    if(chr=='a'||chr=='b'||chr=='c'||chr=='d'){
        lst_chr_i++;
        lst_chr[lst_chr_i]=chr;
    }


    switch(chr)
    {
      case 'x':
        return 0;
        break;
        
        case '0':
        moveCursor(x,y++);
        cout << " *** ";
        moveCursor(x,y++);
        cout << "*   *";
        moveCursor(x,y++);
        cout << "*   *";
        moveCursor(x,y++);
        cout << "     ";
        moveCursor(x,y++);
        cout << "*   *";
        moveCursor(x,y++);
        cout << "*   *";
        moveCursor(x,y);
        cout << " *** ";
        j++;
        break;
        
        case '1':
        moveCursor(x,y++);
        cout << "     ";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y++);
        cout << "     ";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y);
        cout << "     ";
        j++;
        break;
        
        case '2':
        moveCursor(x,y++);
        cout << " *** ";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y++);
        cout << " *** ";
        moveCursor(x,y++);
        cout << "*    ";
        moveCursor(x,y++);
        cout << "*    ";
        moveCursor(x,y);
        cout << " *** ";
        j++;
        break;
        
        case '3':
        moveCursor(x,y++);
        cout << " *** ";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y++);
        cout << " *** ";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y);
        cout << " *** ";
        j++;
        break;
        
        case '4':
        moveCursor(x,y++);
        cout << "     ";
        moveCursor(x,y++);
        cout << "*   *";
        moveCursor(x,y++);
        cout << "*   *";
        moveCursor(x,y++);
        cout << " *** ";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y);
        cout << "     ";
        j++;
        break;
        
        case '5':
        moveCursor(x,y++);
        cout << " *** ";
        moveCursor(x,y++);
        cout << "*    ";
        moveCursor(x,y++);
        cout << "*    ";
        moveCursor(x,y++);
        cout << " *** ";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y);
        cout << " *** ";
        j++;
        break;
        
        case '6':
        moveCursor(x,y++);
        cout << " *** ";
        moveCursor(x,y++);
        cout << "*    ";
        moveCursor(x,y++);
        cout << "*    ";
        moveCursor(x,y++);
        cout << " *** ";
        moveCursor(x,y++);
        cout << "*   *";
        moveCursor(x,y++);
        cout << "*   *";
        moveCursor(x,y);
        cout << " *** ";
        j++;
        break;
        
        case '7':
        moveCursor(x,y++);
        cout << " *** ";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y++);
        cout << "     ";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y);
        cout << "     ";
        j++;
        break;
        
        case '8':
        moveCursor(x,y++);
        cout << " *** ";
        moveCursor(x,y++);
        cout << "*   *";
        moveCursor(x,y++);
        cout << "*   *";
        moveCursor(x,y++);
        cout << " *** ";
        moveCursor(x,y++);
        cout << "*   *";
        moveCursor(x,y++);
        cout << "*   *";
        moveCursor(x,y);
        cout << " *** ";
        j++;
        break;
        
        case '9':
        moveCursor(x,y++);
        cout << " *** ";
        moveCursor(x,y++);
        cout << "*   *";
        moveCursor(x,y++);
        cout << "*   *";
        moveCursor(x,y++);
        cout << " *** ";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y++);
        cout << "    *";
        moveCursor(x,y);
        cout << "     ";
        j++;
        break;
        
     case 8:
         switch(lst_chr[lst_chr_i]){
              case 'a':
              //here remove if last entered char is a
              break;
           default:
              break;
         }
         lst_chr_i--;
        break;
    case 127:
        cout << "------------------";
        break;
    default:
        break;
    }
    if(chr!=8){
        if(j==10)
        {
          j=0;
          x=j*10;
          y=i*5+5;
          break;
       }

      x=j*10;
      y=i*5;
    }


 }

}


}
