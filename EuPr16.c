#include <stdio.h>

void mulBy2(unsigned char *dig, unsigned char TERMIN_NUM);
unsigned long int calcSum(unsigned char *dig, unsigned char TERMIN_NUM);

int main(int argc, char const *argv[])
{
	if (argc<2){
		printf("Usage: %s <power of 2>\r\n", argv[0]);
		return -1;
	}

	const unsigned char TERMIN_NUM = 99;
	unsigned short int exp;
	sscanf(argv[1], "%hu", &exp);
	unsigned short int numOfDecDigs = (exp+1)/3;

	unsigned char decDigits[numOfDecDigs];
	decDigits[0] = 1;
	decDigits[1] = TERMIN_NUM;

	unsigned short int i;
	for (i = 0; i < exp; i++)
		mulBy2(decDigits, TERMIN_NUM);

	unsigned long int sum = calcSum(decDigits, TERMIN_NUM);

	printf("%lu\r\n", sum);

	return 0;
}

void mulBy2(unsigned char *dig, unsigned char TERMIN_NUM) {
	unsigned char val;
	unsigned char carry = 0;
	while (*dig != TERMIN_NUM) {
		val = *dig * 2 + carry;
		carry = val/10;

		*dig++ = val%10;
	}
	if (carry) *dig++ = carry;
	*dig = TERMIN_NUM;
}

unsigned long int calcSum(unsigned char *dig, unsigned char TERMIN_NUM){
	unsigned long int sum = 0;
	unsigned char i;
	while(*dig!=TERMIN_NUM)
	{
		sum += (unsigned long int) *dig++;
	}
	return sum;
}