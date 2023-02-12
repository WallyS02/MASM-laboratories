.686
.model flat

public _timeDilation

.data
lightSpeed dd 300000000.0

.code

_timeDilation proc
push ebp
mov ebp, esp
finit

fild dword ptr [ebp+8]
fld1
fld dword ptr [ebp+12]
fmul st(0), st(0)
fld lightSpeed
fmul st(0), st(0)
fdiv
fsub
fsqrt
fdiv
pop ebp
ret
_timeDilation endp

end
