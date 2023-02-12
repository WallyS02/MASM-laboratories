.686
.model flat

extern _ExitProcess@4 : proc
extern __write : proc
extern __read : proc
extern _MessageBoxW@16 : PROC

public _main

.data
dekoder db '0123456789ABCDEF'
obszar db 12 dup (?)
magazyn dw 12 dup (?)
tytul dw 'W', 'y', 'n', 'i', 'k', 0
dziesiec dd 10 ; mnożnik

.code

wyswietl_EAX_hex PROC
; wyświetlanie zawartości rejestru EAX
; w postaci liczby szesnastkowej
pusha ; przechowanie rejestrów
 
; rezerwacja 12 bajtów na stosie (poprzez zmniejszenie
; rejestru ESP) przeznaczonych na tymczasowe przechowanie
; cyfr szesnastkowych wyświetlanej liczby
sub esp, 12
mov edi, esp ; adres zarezerwowanego obszaru
; pamięci
; przygotowanie konwersji 
mov ecx, 8 ; liczba obiegów pętli konwersji
mov esi, 1 ; indeks początkowy używany przy
; zapisie cyfr
; pętla konwersji
ptl3hex: 
; przesunięcie cykliczne (obrót) rejestru EAX o 4 bity w lewo
; w szczególności, w pierwszym obiegu pętli bity nr 31 - 28
; rejestru EAX zostaną przesunięte na pozycje 3 - 0
rol eax, 4
; wyodrębnienie 4 najmłodszych bitów i odczytanie z tablicy
; 'dekoder' odpowiadającej im cyfry w zapisie szesnastkowym
mov ebx, eax ; kopiowanie EAX do EBX
and ebx, 0000000FH ; zerowanie bitów 31 - 4 rej.EBX
mov dl, dekoder[ebx] ; pobranie cyfry z tablicy 
; przesłanie cyfry do obszaru roboczego
mov [edi][esi], dl
inc esi ;inkrementacja modyfikatora
loop ptl3hex ; sterowanie pętlą
 
; wpisanie znaku nowego wiersza przed i po cyfrach
mov byte PTR [edi][0], 10
mov byte PTR [edi][9], 10

;mov ebp, 1
;ptlZera:
; cmp byte PTR [edi + ebp], 48
; je zamiana
; jne przejdzDoUnicode
; jmp dalej
;
;zamiana:
; sub byte PTR [edi + ebp], 16
; jmp dalej
;
;dalej:
; inc ebp
; cmp ebp, 9
; je przejdzDoUnicode
; jnz ptlZera

przejdzDoUnicode:
 mov ebp, 0
 mov esi, 1
ptlUnicode:
 mov cl, [edi + esi]
 cmp cl, '0'
 jb litera
 cmp cl, '9'
 ja litera
 cmp cl, '0'
 je zero
 sub cl, '0'
 dec cl
 mov dx, 2460h
 movzx cx, cl
 add dx, cx
 mov magazyn[ebp], dx
 jmp dalejUnicode
zero:
 mov dx, 24FFh
 mov magazyn[ebp], dx
 jmp dalejUnicode
litera:
 mov dx, 24B6h
 sub cl, 'A'
 movzx cx, cl
 add dx, cx
 mov magazyn[ebp], dx
dalejUnicode:
 inc esi
 add ebp, 2
 cmp esi, 9
 je zakonczPetle
 jnz ptlUnicode

zakonczPetle:
 push 0
 push OFFSET tytul
 push OFFSET magazyn
 push 0
 call _MessageBoxW@16
 add esp, 12
 
popa ; odtworzenie rejestrów
ret ; powrót z podprogramu
wyswietl_EAX_hex ENDP

_main proc
mov eax, 062ACF14h
call wyswietl_EAX_hex
push 0
call _ExitProcess@4
_main endp
end
