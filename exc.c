#include <stdio.h>

void exc(int *p,int *q)
{
	int temp = 0;
	temp = *p;
	*p = *q;
	*q = temp;
}

int main(int argc, int *argv)
{
	int a = 3;
	int b = 5;
	printf("a = %d,b = %d\n",a,b);
	exc(&a,&b);
	printf("a = %d,b = %d\n",a,b);
}
