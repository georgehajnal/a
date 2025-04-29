#include <iostream>
#include <fstream>
#include <windows.h>
#define maxx 1024
using namespace std;
ifstream in("input");

char tape[30000], str[maxx];
int ptr;
void banner() {

    cout<<endl;
    cout<<"b                                         "<<endl;
    cout<<"b                                         "<<endl;
    cout<<"b                                         "<<endl;
    cout<<"b                a                        "<<endl;
    cout<<"b                                         "<<endl;
    cout<<"b                                         "<<endl;
    cout<<"b                                         "<<endl;
    cout<<"b                                         "<<endl;
    cout<<"b                                         "<<endl;
    cout<<endl;
}
void bf(char input[maxx])
{
	char c;
	int i, g;

	for (i=0;input[i]!= 0;++i)
	{
		c=input[i];
		switch(c)
		{
			case '>':
				++ptr;
				break;
			case '<':
				--ptr;
				break;
			case '+':
				++tape[ptr];
				break;
			case '-':
				--tape[ptr];
				break;
			case '.':
				cout<<tape[ptr];
				break;
			case ',':
				tape[ptr] = getchar();
				break;
			case '[':
				if (tape[ptr]==0)
				{
					g=1;
					while (g>0)
					{
						c=input[++i];
						if (c=='[')
							g++;
						else if (c==']')
							g--;
					}
				}
				break;
			case ']':
				if (tape[ptr])
				{
					g=1;
					while (g>0)
					{
						c=input[--i];
						if (c=='[')
							g--;
						else if (c==']')
							g++;
					}
				}
		}
	}
}

int main()
{
    in.get(str, maxx);
    banner();
    cout<<"1. normal bf"<<endl;
    cout<<"2. "<<endl;
    cout<<"3. help"<<endl;
    cout<<endl;
    cout<<"Optiune: ";
    int ccc;
    cin>>ccc;
    system("cls");

    if (ccc==3) {cout<<"pune programul in input si foloseste 1 sau 2"<<endl; return 0;}

    /*
	bf(str);
	cout<<endl;
    */
	return 0;
}
