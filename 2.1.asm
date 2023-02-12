.686
.model flat

extern _ExitProcess@4 : proc
extern __write : PROC ; (dwa znaki podkreślenia)
extern __read : PROC ; (dwa znaki podkreślenia)
extern _MessageBoxW@16 : PROC

public _main

.data
indeksy dw 2, 7, 0, 1, 3, 9, -1, -1
napis db 128 dup (?)
napisEnd dw 128 dup (?)
tytul dw 'W', 'y', 'n', 'i', 'k', 0
tekst_pocz db 10, 'Prosz', 0A9h, ' poda', 86h ,' zdanie '
db 'i nacisna', 86h ,' Enter', 10
koniec_t db ?
nowa_linia db 10
liczba_znakow dd ?
pomocnicza dw ?


.code
_main proc
 mov ecx,(OFFSET koniec_t) - (OFFSET tekst_pocz)
 push ecx
 push OFFSET tekst_pocz ; adres tekstu
 push 1 ; nr urządzenia (tu: ekran - nr 1)
 call __write ; wyświetlenie tekstu początkowego
 add esp, 12 ; usuniecie parametrów ze stosu

 push 80 ; maksymalna liczba znaków
 push OFFSET napis
 push 0 ; nr urządzenia (tu: klawiatura - nr 0)
 call __read ; czytanie znaków z klawiatury
 add esp, 12 ; usuniecie parametrów ze stosu

 mov liczba_znakow, eax
 mov ecx, eax ; rejestr ECX pełni rolę licznika obiegów pętli
 mov esi, 0 ; indeks początkowy
 mov edi, 0
ptl: 
 movzx dx, napis[esi]
 mov napisEnd[edi], dx
 jmp dalej

dalej: 
 inc esi
 add edi, 2
 dec ecx
 jnz ptl

 mov edi, 0
ptlIndeksy:
 mov dx, indeksy[edi]
 mov bp, indeksy[edi + 2]
 cmp dx, -1
 je koniecDalej
kontynuuj:
 movzx edx, dx
 movzx ebp, bp
 add edx, edx
 add ebp, ebp
 mov ax, napisEnd[ebp]
 mov pomocnicza, ax
 mov ax, napisEnd[edx]
 mov napisEnd[ebp], ax
 mov ax, pomocnicza
 mov napisEnd[edx], ax
 jmp dalejIndeksy

dalejIndeksy:
 add edi, 4
 jnz ptlIndeksy

koniecDalej:
 cmp bp, -1
 je koniec
 jne kontynuuj

koniec:
 push 0
 push OFFSET tytul
 push OFFSET napisEnd
 push 0
 call _MessageBoxW@16
 add esp, 12 ; usuniecie parametrów ze stosu

push 0
call _ExitProcess@4
_main endp
end
