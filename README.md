# MASM-laboratories
Collection of tasks to solve in MASM.

2) 
Załóżmy, że w segmencie danych statycznych istnieje następująca deklaracja
tablica dw 2,7,-1,-1
Napisz program w asemblerze 32 bitowym, tak aby tekst (bez polskich znaków diakrytycznych) wpisany z
klawiatury został ponownie wyświetlony na ekranie za pomocą funkcji MessageBoxW. W wyświetlanym
napisie należy dokonać modyfikacji. Modyfikacja polega na zamianie pozycji znaków w napisie wejściowym.
Pozycje, które mamy zamienić zawarte są jako pary liczb w obszarze tablica. Indeksy numerowane są od 0,
lista indeksów kończy się indeksem -1,-1 .
Przykład dla powyżej zadeklarowanej tablicy
> Ala ma kota
Wynik: Alk ma aota

3)
1. (1pkt) Opracować nową wersję podprogramu wyświetlającego szesnastkowo zawartość rejestru EAX, 
który wyświetli w oknie liczbę w ten sposób, że każda jej cyfra (0-F) będzie w kółku, 
a więc użyte zostaną kody zgodnie z: https://en.wikipedia.org/wiki/Enclosed_Alphanumerics#Block

2. (1pkt) Opracować nową wersję podprogramu wczytującego do rejestru EAX liczbę wprowadzaną w konsoli w systemie szesnastkowym, 
tak, by możliwe było również wprowadzanie liczby w formacie z separatorem (spacją) co dwa znaki, np.:
konsola: 0665B4 -> stan EAX: 000654B4h
konsola: 06 65 B4 -> stan EAX: 000654B4h
konsola: FF F9 AB 4C -> stan EAX: FFF9AB4Ch

4) 1. (1 pkt) Napisać podprogram w 32-bitowym asemblerze przystosowany do wywoływania z poziomu języka C, 
którego prototyp ma postać:

int swap(int tab[], unsigned int n, int pos1, int pos2);

Funkcja ma zamienić miejscami elementy pos1 oraz pos2 tablicy tab, która posiada n elementów. 
Jeśli to się udało (tj. obie pozycje mieszczą się w tablicy), funkcja powinna zwrócić wartość 1, 
a jeśli nie (któraś z tych liczb jest <0 lub >=n), to powinna zwrócić wartość 0. Działanie zademonstrować z poziomu języka C.

Przykłady:

tab = [1, 2, 3, 4, 5]

swap(tab, 5, 1, 4); // tab = [1, 5, 3, 4, 2] , returned 1

swap(tab, 5, 1, 5); // tab = [1, 2, 3, 4, 5] , returned 0



2. (1 pkt) 

Napisać podprogram w 32-bitowym asemblerze przystosowany do wywoływania z poziomu języka C, 
którego prototyp ma postać:

int isPalindrom(wchar_t* strng, unsigned int liczba_znakow);

Funkcja ta ma zwrócić wartość niezerową (jedynkę), jeśli tekst (kodowany w UTF-16) posiadający liczba_znakow znaków, 
wskazywany przez strng, jest palindromem oraz 0, jeśli ten tekst nie jest palindromem. Np.:

wynik = isPalindrom(u"kajak", 5); // wynik = 1

wynik = isPalindrom(u"korek", 5); // wynik = 0

Program ma działać rekurencyjnie, np. wg poniższego pseudokodu:

def isPalindrom(strng, len):
if (len == 0) or (len == 1):
return True
if strng[0] != strng[len-1]:
return False
return isPalindrome(strng[1:-1], len-2)

5) 1. Zaimplementować w 32-bitowym asemblerze funkcję obliczającą dylatację czasu, 
wywoływaną z poziomu języka C o następującym prototypie:

float dylatacja_czasu(unsigned int delta_t_zero, float predkosc);

Wzór na dylatację czasu:

Δt=Δt01−v2c2√,

gdzie c to prędkość światła (przyjmij c=3,00⋅108).

Przykładowo:

wynik = dylatacja_czasu(10, 10000.0f); // wynik = 10.00000

wynik = dylatacja_czasu(10, 200000000.0f); // wynik = 13.41641

wynik = dylatacja_czasu(60, 270000000.0f); // wynik = 137.64944

 

2. Napisać podprogram w 32 bitowym asemblerze przystosowany do wywoływania z poziomu języka C. 
Prototyp podprogramu jest postaci:

void szybki_max(short int t_1[], short int t_2[], short int t_wynik[], int n);

Program zapisze w tablicy t_wynik większe z odpowiadających sobie pozycjami liczb z tablic t1 i t2 (patrz przykład). 
Wszystkie tablice mają rozmiar n, które jest podzielne przez 8. Zaprezentować wynik działania z poziomu języka C. 
Do rozwiązania zadania użyć odpowiedniego rozkazu z grupy PMAXxx. 


Przykład:

short int val1[16] = {1, -1, 2, -2, 3, -3, 4, -4, 5, -5, 6, -6, 7, -7, -8, 8};

short int val2[16] = {-3, -2, -1, 0, 1, 2, 3, 4, 256, -256, 257, -257, 258, -258, 0, 0};

szybki_max(val1, val2, wynik, 16); // -> wynik = {1, -1, 2, 0, 3, 2, 4, 4, 256, -5, 257, -6, 258, -7, 0, 8}



6) 1. Zmodyfikuj program ze stron 15-17 w taki sposób, aby pokazał się kwadrat o boku większym niż 10 pikseli na środku ekranu.

Co trzy kolejne przerwania zegarowe wartość aktualnego koloru wnętrza kwadratu pikselach ma zostać zmieniona (czarny -> żółty). Po kolejnych trzech przerwaniach kolor powinien zostać zrekonstruowany (żółty -> czarny). Uzyskujemy migający żółty kwadrat. Program kończymy w dowolnej chwili naciskając klawisz 'x'.


NOT IMPLEMENTED 2. Zmodyfikuj program z zadania 1 w taki sposób, aby wciśnięcie litery 'r' powodowało podmianę koloru na czerwony (migający czerwony kwadrat), 'g' - podmianę na kolor zielony, a 'y' - na żółty (jak w zad. 1). Odczyt ma nastąpić poprzez wykorzystanie przerwania sprzętowego z klawiatury, nie w pętli głównej programu.
