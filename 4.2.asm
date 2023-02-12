.686
.model flat

public _isPalindrom

.data

.code
_isPalindrom proc
push ebp
mov ebp, esp
push ebx
mov edx, [ebp+8] ; adres tablicy
mov ecx, [ebp+12] ; liczba znakow
cmp ecx, 0
je koniec1
cmp ecx, 1
je koniec1
mov al, [edx]
mov bl, [edx + 2*ecx - 2]
cmp al, bl
jne koniec2
add edx, 2
sub ecx, 2
push ecx
push edx
call _isPalindrom
pop edx
pop ecx
jmp zwroc
koniec2:
mov eax, 0
jmp zwroc
koniec1:
mov eax, 1
zwroc:
pop ebx
pop ebp
ret
_isPalindrom endp

end
