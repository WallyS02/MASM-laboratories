.686
.model flat
public _swap
.code
_swap PROC
push ebp ; zapisanie zawartości EBP na stosie
mov ebp, esp ; kopiowanie zawartości ESP do EBP
push esi
push ebx
push edi
mov esi, [ebp+8] ; adres tablicy
mov ecx, [ebp+12] ; liczba elementow
mov edi, [ebp+16] ; pos1
mov ebx, [ebp+20] ; pos2
cmp edi, ecx
jae koniec1
cmp ebx, ecx
jae koniec1
cmp edi, 0
jb koniec1
cmp ebx, 0
jb koniec1

mov al, [esi + 4*edi]
mov dl, [esi + 4*ebx]
mov [esi + 4*edi], dl
mov [esi + 4*ebx], al
jmp koniec2

koniec1:
mov eax, 0
jmp prolog

koniec2:
mov eax, 1

prolog:
pop edi
pop ebx
pop esi
pop ebp
ret
_swap ENDP
END
