#include <stdio.h>

int swap(int tab[], unsigned int n, int pos1, int pos2);

int main()
{
	int tab[] = { 1, 2, 3, 4, 5 };

	int test = swap(tab, 5, 1, 4); // tab = [1, 5, 3, 4, 2] , returned 1
	test = swap(tab, 5, -1, 4);
	test = swap(tab, 5, 1, 5); // tab = [1, 2, 3, 4, 5] , returned 0
	test = swap(tab, 5, 0, 1);
	return 0;
}
