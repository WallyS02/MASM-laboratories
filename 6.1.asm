.386
rozkazy SEGMENT use16
ASSUME cs:rozkazy

kwadrat PROC
; przechowanie rejestrów
push ax 
push bx
push cx
push dx
push es
mov ax, 0A000H ; adres pamiêci ekranu dla trybu 13H
mov es, ax
mov bx, cs:adres_piksela
inc cs:zmiana
cmp cs:zmiana, 5
jne bez
mov cs:zmiana, 0
cmp cs:kolor, 0
je bez1
mov cs:kolor, 0
jmp bez
bez1:
cmp cs:ktory, 0
jne ustaw
mov cs:kolor, 14
jmp bez
ustaw:
mov cs:kolor, 4
bez:
mov al, cs:kolor
mov dx, 0
ptl1:
mov ecx, 20
ptl2:
mov es:[bx], al ; wpisanie kodu koloru do pamiêci ekranu
add bx, 1
loop ptl2
add bx, 300 ; 320 - 20
inc dx
cmp dx, 20
jne ptl1
 pop es
 pop dx
 pop cx
 pop bx 
 pop ax
 jmp dword PTR cs:wektor8 
kolor db 14 ; zolty
ktory db 0
zmiana db 0
adres_piksela dw 27670 ; start
wektor8 dd ?
kwadrat ENDP

obsluga_klawiatury PROC
push ax
in al, 60h
cmp al, 19
je r
cmp al, 44
je z
mov cs:licznik, byte ptr 0
jmp res
r:
inc cs:licznik
cmp cs:licznik, 36
jne res
mov cs:ktory, byte ptr 1
jmp res
z:
inc cs:licznik
cmp cs:licznik, 36
jne res
mov cs:ktory, byte ptr 0
res:
pop ax
jmp dword PTR cs:wektor9
wektor9 dd ?
licznik db 0
obsluga_klawiatury ENDP

; INT 10H, funkcja nr 0 ustawia tryb sterownika graficznego
zacznij:
mov ah, 0
mov al, 13H ; nr trybu
int 10H
mov bx, 0
mov es, bx ; zerowanie rejestru ES
mov eax, es:[32] ; odczytanie wektora nr 8
mov cs:wektor8, eax; zapamiêtanie wektora nr 8

mov bx, 0
mov es, bx ; zerowanie rejestru ES
mov eax, es:[36] ; odczytanie wektora nr 8
mov cs:wektor9, eax; zapamiêtanie wektora nr 8

mov ax, SEG kwadrat
mov bx, OFFSET kwadrat
cli ; zablokowanie przerwañ
; zapisanie adresu procedury 'linia' do wektora nr 8
mov es:[32], bx
mov es:[34], ax 
sti ; odblokowanie przerwañ

mov ax, SEG obsluga_klawiatury
mov bx, OFFSET obsluga_klawiatury
cli ; zablokowanie przerwañ
; zapisanie adresu procedury 'linia' do wektora nr 8
mov es:[36], bx
mov es:[38], ax 
sti ; odblokowanie przerwañ

czekaj:
mov ah, 1 ; sprawdzenie czy jest jakiœ znak
int 16h ; w buforze klawiatury
jz czekaj
mov ah, 0
int 16h
cmp al, 'x'
jne czekaj
mov ah, 0 ; funkcja nr 0 ustawia tryb sterownika
mov al, 3H ; nr trybu
int 10H
; odtworzenie oryginalnej zawartoœci wektora nr 8
mov eax, cs:wektor8
mov es:[32], eax 

cli
mov eax, cs:wektor9
mov es:[36], eax 
sti
; zakoñczenie wykonywania programu
mov ax, 4C00H 
int 21H
rozkazy ENDS
stosik SEGMENT stack
db 256 dup (?)
stosik ENDS
END zacznij