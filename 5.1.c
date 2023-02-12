#include <stdio.h>

float timeDilation(unsigned int delta, float speed);

int main() {
	float wynik = timeDilation(10, 10000.0f); //wynik = 10.00000
	printf("%f\n", wynik);
	wynik = timeDilation(10, 200000000.0f); //wynik = 13.41641
	printf("%f\n", wynik);
	wynik = timeDilation(60, 270000000.0f); //wynik = 137.64944
	printf("%f\n", wynik);
	return 0;
}
