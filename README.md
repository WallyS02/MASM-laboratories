# MASM-laboratories
Collection of tasks from Computer Architecture laboratories written in MASM.

## Polish instructions
2.1 <br/>
Załóżmy, że w segmencie danych statycznych istnieje następująca deklaracja: <br/>
tablica dw 2,7,-1,-1 <br/>
Napisz program w asemblerze 32 bitowym, tak aby tekst (bez polskich znaków diakrytycznych) wpisany z
klawiatury został ponownie wyświetlony na ekranie za pomocą funkcji MessageBoxW. W wyświetlanym
napisie należy dokonać modyfikacji. Modyfikacja polega na zamianie pozycji znaków w napisie wejściowym.
Pozycje, które mamy zamienić zawarte są jako pary liczb w obszarze tablica. Indeksy numerowane są od 0,
lista indeksów kończy się indeksem -1,-1. <br/>
Przykład dla powyżej zadeklarowanej tablicy: <br/>
\> Ala ma kota <br/>
Wynik: Alk ma aota

3.1 <br/>
Opracować nową wersję podprogramu wyświetlającego szesnastkowo zawartość rejestru EAX, 
który wyświetli w oknie liczbę w ten sposób, że każda jej cyfra (0-F) będzie w kółku, 
a więc użyte zostaną kody zgodnie z: https://en.wikipedia.org/wiki/Enclosed_Alphanumerics#Block.

3.2 <br/>
Opracować nową wersję podprogramu wczytującego do rejestru EAX liczbę wprowadzaną w konsoli w systemie szesnastkowym, 
tak, by możliwe było również wprowadzanie liczby w formacie z separatorem (spacją) co dwa znaki, np.: <br/>
konsola: 0665B4 -> stan EAX: 000654B4h <br/>
konsola: 06 65 B4 -> stan EAX: 000654B4h <br/>
konsola: FF F9 AB 4C -> stan EAX: FFF9AB4Ch

4.1. <br/>
Napisać podprogram w 32-bitowym asemblerze przystosowany do wywoływania z poziomu języka C, którego prototyp ma postać: <br/>

int swap(int tab[], unsigned int n, int pos1, int pos2); <br/>

Funkcja ma zamienić miejscami elementy pos1 oraz pos2 tablicy tab, która posiada n elementów. 
Jeśli to się udało (tj. obie pozycje mieszczą się w tablicy), funkcja powinna zwrócić wartość 1, 
a jeśli nie (któraś z tych liczb jest <0 lub >=n), to powinna zwrócić wartość 0. Działanie zademonstrować z poziomu języka C. <br/>

Przykłady:

tab = [1, 2, 3, 4, 5]

swap(tab, 5, 1, 4); // tab = [1, 5, 3, 4, 2] , returned 1

swap(tab, 5, 1, 5); // tab = [1, 2, 3, 4, 5] , returned 0

4.2 <br/>

Napisać podprogram w 32-bitowym asemblerze przystosowany do wywoływania z poziomu języka C, 
którego prototyp ma postać: <br/>

int isPalindrom(wchar_t* strng, unsigned int liczba_znakow); <br/>

Funkcja ta ma zwrócić wartość niezerową (jedynkę), jeśli tekst (kodowany w UTF-16) posiadający liczba_znakow znaków, 
wskazywany przez strng, jest palindromem oraz 0, jeśli ten tekst nie jest palindromem. Np.: <br/>

wynik = isPalindrom(u"kajak", 5); // wynik = 1

wynik = isPalindrom(u"korek", 5); // wynik = 0

Program ma działać rekurencyjnie, np. wg poniższego pseudokodu:

def isPalindrom(strng, len): <br/>
if (len == 0) or (len == 1): <br/>
return True <br/>
if strng[0] != strng[len-1]: <br/>
return False <br/>
return isPalindrome(strng[1:-1], len-2)

5.1 <br/>
Zaimplementować w 32-bitowym asemblerze funkcję obliczającą dylatację czasu, 
wywoływaną z poziomu języka C o następującym prototypie: <br/>

float dylatacja_czasu(unsigned int delta_t_zero, float predkosc); <br/>

Wzór na dylatację czasu: <br/>

Δt=Δt01−v2c2√, <br/>

gdzie c to prędkość światła (przyjmij c=3,00⋅108). <br/>

Przykładowo: <br/>

wynik = dylatacja_czasu(10, 10000.0f); // wynik = 10.00000

wynik = dylatacja_czasu(10, 200000000.0f); // wynik = 13.41641

wynik = dylatacja_czasu(60, 270000000.0f); // wynik = 137.64944

 

5.2 <br/>
Napisać podprogram w 32 bitowym asemblerze przystosowany do wywoływania z poziomu języka C. <br/>
Prototyp podprogramu jest postaci: <br/>

void szybki_max(short int t_1[], short int t_2[], short int t_wynik[], int n); <br/>

Program zapisze w tablicy t_wynik większe z odpowiadających sobie pozycjami liczb z tablic t1 i t2 (patrz przykład). 
Wszystkie tablice mają rozmiar n, które jest podzielne przez 8. Zaprezentować wynik działania z poziomu języka C. 
Do rozwiązania zadania użyć odpowiedniego rozkazu z grupy PMAXxx. <br/>

Przykład: <br/>

short int val1[16] = {1, -1, 2, -2, 3, -3, 4, -4, 5, -5, 6, -6, 7, -7, -8, 8};

short int val2[16] = {-3, -2, -1, 0, 1, 2, 3, 4, 256, -256, 257, -257, 258, -258, 0, 0};

szybki_max(val1, val2, wynik, 16); // -> wynik = {1, -1, 2, 0, 3, 2, 4, 4, 256, -5, 257, -6, 258, -7, 0, 8}



6.1 <br/>
Zmodyfikuj program ze stron 15-17 w taki sposób, aby pokazał się kwadrat o boku większym niż 10 pikseli na środku ekranu. <br/>

Co trzy kolejne przerwania zegarowe wartość aktualnego koloru wnętrza kwadratu pikselach ma zostać zmieniona (czarny -> żółty). Po kolejnych trzech przerwaniach kolor powinien zostać zrekonstruowany (żółty -> czarny). Uzyskujemy migający żółty kwadrat. Program kończymy w dowolnej chwili naciskając klawisz 'x'.
## English instructions
2.1 <br/>
Assume that the following declaration exists in the static data segment: <br/>
table dw 2,7,-1,-1 <br/>
Write a program in 32-bit assembler so that the text (without Polish diacritics) entered from the
keyboard is displayed on the screen again using the MessageBoxW function. The displayed
text should be modified. The modification consists in changing the position of the characters in the input string.

The positions that we are to change are contained as pairs of numbers in the table area. The indexes are numbered from 0,
the list of indexes ends with the index -1,-1. <br/>
Example for the above declared table: <br/>
\> Ala ma kota <br/>
Result: Alk ma aota

3.1 <br/>
Develop a new version of the subroutine displaying the hexadecimal contents of the EAX register,
which will display a number in the window in such a way that each of its digits (0-F) will be in a circle,
so the codes will be used according to: https://en.wikipedia.org/wiki/Enclosed_Alphanumerics#Block.

3.2 <br/>
Develop a new version of the subroutine that reads a number entered in the console in the hexadecimal system into the EAX register,
so that it is also possible to enter a number in the format with a separator (space) every two characters, e.g.: <br/>
console: 0665B4 -> EAX status: 000654B4h <br/>
console: 06 65 B4 -> EAX status: 000654B4h <br/>
console: FF F9 AB 4C -> EAX status: FFF9AB4Ch

4.1. <br/>
Write a subroutine in 32-bit assembler adapted to be called from the C language, the prototype of which is: <br/>

int swap(int tab[], unsigned int n, int pos1, int pos2); <br/>

The function is to swap the elements pos1 and pos2 of the table tab, which has n elements.

If it succeeds (i.e. both positions fit in the table), the function should return the value 1,
and if not (one of these numbers is <0 or >=n), then it should return the value 0. Demonstrate the operation from the C language level. <br/>

Examples:

tab = [1, 2, 3, 4, 5]

swap(tab, 5, 1, 4); // tab = [1, 5, 3, 4, 2] , returned 1

swap(tab, 5, 1, 5); // tab = [1, 2, 3, 4, 5] , returned 0

4.2 <br/>

Write a subroutine in 32-bit assembler adapted to be called from the C language,
whose prototype is: <br/>

int isPalindrom(wchar_t* strng, unsigned int number_of_characters); <br/>

This function is to return a non-zero value (one) if the text (UTF-16 encoded) with number_of_characters characters,
pointed to by strng, is a palindrome and 0 if this text is not a palindrome. For example: <br/>

result = isPalindrom(u"kajak", 5); // result = 1

result = isPalindrome(u"korek", 5); // result = 0

The program should work recursively, e.g. according to the following pseudocode:

def isPalindrome(strng, len): <br/>
if (len == 0) or (len == 1): <br/>
return True <br/>
if strng[0] != strng[len-1]: <br/>
return False <br/>
return isPalindrome(strng[1:-1], len-2)

5.1 <br/>
Implement a function in a 32-bit assembler that calculates time dilation,
called from the C language with the following prototype: <br/>

float time_dilation(unsigned int delta_t_zero, float speed); <br/>

Time dilation formula: <br/>

Δt=Δt01−v2c2√, <br/>

where c is the speed of light (assume c=3.00⋅108). <br/>

For example: <br/>

result = time_dilation(10, 10000.0f); // result = 10.00000

result = time_dilation(10, 200000000.0f); // result = 13.41641

result = time_dilation(60, 270000000.0f); // result = 137.64944

5.2 <br/>
Write a subroutine in 32-bit assembler adapted to be called from the C language level. <br/>
The prototype of the subroutine is in the form: <br/>

void fast_max(short int t_1[], short int t_2[], short int t_wynik[], int n); <br/>

The program will save in the table t_wynik the larger of the numbers corresponding to each other in positions from tables t1 and t2 (see the example).
All tables have size n, which is divisible by 8. Present the result of the operation from the C language level.
To solve the task, use the appropriate command from the PMAXxx group. <br/>

Example: <br/>

short int val1[16] = {1, -1, 2, -2, 3, -3, 4, -4, 5, -5, 6, -6, 7, -7, -8, 8};

short int val2[16] = {-3, -2, -1, 0, 1, 2, 3, 4, 256, -256, 257, -257, 258, -258, 0, 0};

fast_max(val1, val2, result, 16); // -> result = {1, -1, 2, 0, 3, 2, 4, 4, 256, -5, 257, -6, 258, -7, 0, 8}

6.1 <br/>
Modify the program on pages 15-17 so that a square with a side larger than 10 pixels is displayed in the center of the screen. <br/>

Every three subsequent timer interrupts the value of the current color of the interior of the square pixels is to be changed (black -> yellow). After the next three interrupts the color should be reconstructed (yellow -> black). We get a blinking yellow square. We can end the program at any time by pressing the 'x' key.
