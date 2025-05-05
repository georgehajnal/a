#include <iostream>
#include <fstream>
#include <windows.h>
#include <cstring>
#include <sstream>
#define maxx 10000
using namespace std;
ifstream in("input");

char tape[30000], str[maxx], v[maxx];
int ptr;
string cuv;

void banner() {
    cout<<endl;
    cout<<"                  ,,          ,..."<<endl;
    cout<<"                 *MM        .d' **"<<endl;
    cout<<"                  MM        dM`   "<<endl;
    cout<<"`7M'    ,A    `MF'MM,dMMb. mMMmm  "<<endl;
    cout<<"  VA   ,VAA   ,V  MM    `Mb MM    "<<endl;
    cout<<"   VA ,V  VA ,V   MM     M8 MM    "<<endl;
    cout<<"    VVV    VVV    MM.   ,M9 MM    "<<endl;
    cout<<"     W      W     P^YbmdP'.JMML.  "<<endl;
    cout<<endl;
    cout<<"Version 1.0"<<endl;
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
				cin>>tape[ptr];
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
    cout<<"2. word bf"<<endl;
    cout<<"3. wbf to bf"<<endl;
    cout<<"4. help"<<endl;
    cout<<"5. quit"<<endl;
    cout<<endl;
    cout<<"Optiune: ";
    int ccc;
    cin>>ccc;
    system("cls");

    if (ccc==4) {cout<<"pune programul in input si foloseste 1 sau 2"<<endl; return 0;}
    if (ccc==5) {return 0;}
    if (ccc==1) {
        bf(str);
        cout<<endl;
    }
    if (ccc==2) {
        int h = -1;
        istringstream iss(str);
        char word[10];
        while(iss >> word) {
            int n = strlen(word);
            int sum = 0;
            for (int q=0;q<n;q++) {
                sum+=word[q];
            }
            sum = sum % 8;
            switch(sum) {
                case 0:
                v[++h]='>';
                break;
                case 1:
                v[++h]='<';
                break;
                case 2:
                v[++h]='+';
                break;
                case 3:
                v[++h]='-';
                break;
                case 4:
                v[++h]='.';
                break;
                case 5:
                v[++h]=',';
                break;
                case 6:
                v[++h]='[';
                break;
                case 7:
                v[++h]=']';
                break;
            }
        }
        bf(v);

    }
    if (ccc==3) {
        istringstream iss(str);
        char word[10];
        while(iss >> word) {
            int n = strlen(word);
            int sum = 0;
            for (int q=0;q<n;q++) {
                sum+=word[q];
            }
            sum = sum % 8;
            switch(sum) {
                case 0:
                cout<<'>';
                break;
                case 1:
                cout<<'<';
                break;
                case 2:
                cout<<'+';
                break;
                case 3:
                cout<<'-';
                break;
                case 4:
                cout<<'.';
                break;
                case 5:
                cout<<',';
                break;
                case 6:
                cout<<'[';
                break;
                case 7:
                cout<<']';
                break;
            }
        }
    }
	return 0;
}
