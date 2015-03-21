#include <iostream>
#include <cstdlib>
#include <new>
using namespace std;

bool is_prime(const unsigned long int &x) {
	unsigned long int fctr=7;
	if (!(x%2) || !(x%3) || !(x%5)) return false;
	unsigned long int boundr=x/2;
	while (fctr<boundr) {
		if (x%fctr==0) return false;
		fctr+=2;
	}
	return true;
}

inline void show_result(const unsigned long int &prime, int ind)
	{cout<<"The "<<ind<<"-th prime is _"<<prime<<"_";}

int main(int argc, char *argv[]) {
	if(argc<2)
	{cout<<"Wrong number of arguments ("<<argc<<").\r\n I need a prime's index.\r\nTerminating...";return -1;}
	
	int indOfPrime=atoi(argv[1]);
	unsigned short int *frstSix=new unsigned short int[6] {2,3,5,7,11,13};
	if (indOfPrime<7) {
		show_result(*(frstSix+indOfPrime-1),indOfPrime);
		return 0;
	}
	delete[] frstSix;
	
	int i=7;
	unsigned long int candidate=17;
	while(i<indOfPrime) {
		candidate+=2;
		if (is_prime(candidate)) i++;
	}
	show_result(candidate,indOfPrime);
	return 0;
}