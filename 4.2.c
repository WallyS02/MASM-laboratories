#include <stdio.h>

int isPalindrom(wchar_t* strng, unsigned int liczba_znakow);

int main() {
	int wynik = isPalindrom(u"kajak", 5); // wynik = 1
	wynik = isPalindrom(u"korek", 5); // wynik = 0
	wynik = isPalindrom(u"kobylybok", 9);
	return 0;
}
