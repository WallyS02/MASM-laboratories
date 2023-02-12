#include <stdio.h>

#define SIZE 16

void fastMax(short int t_1[], short int t_2[], short int t_wynik[], int n);

int main() {
	short int val1[SIZE] = { 1, -1, 2, -2, 3, -3, 4, -4, 5, -5, 6, -6, 7, -7, -8, 8 };
	short int val2[SIZE] = { -3, -2, -1, 0, 1, 2, 3, 4, 256, -256, 257, -257, 258, -258, 0, 0 };
	short int tab_wynik[SIZE];
	for (int i = 0; i < SIZE; i++) {
		printf("%d ", val1[i]);
	}
	printf("\n");
	for (int i = 0; i < SIZE; i++) {
		printf("%d ", val2[i]);
	}
	printf("\n");
	fastMax(val1, val2, tab_wynik, SIZE);
	for (int i = 0; i < SIZE; i++) {
		printf("%d ", tab_wynik[i]);
	}
	return 0;
}
