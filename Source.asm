.686
.model flat,stdcall
.stack 100h

.data
L dd ?
M dd ?
S1 dd ?
S2 dd ?
R dd ?
N dd 12B9h
M1 dd 21545,30788,44355,22050; в дес 
M2 dd 20 dup (0); пустой массив для чисел 

.code
ExitProcess PROTO STDCALL :DWORD
Start:
mov ebx, 0
mov ecx, 4
ti:	
mov eax, M1[ebx]; Задаем Х
add eax, 1
mov M2[ebx], eax; Записываем полученный результат в другой массив
add ebx, 4
loop ti; Повторяем цикл 4 раза
mov ebx, 4
mov ecx, 3
mov eax, M2[0]; Обращаемся к X`
t1:
mov edx, M2[ebx]
add eax, edx; X`+Y`+Z`+Q`
add ebx, 4
loop t1
mov L, eax
mov ebx, M2[0]
and eax, ebx
mov S1, eax; Получаем результат 1 скобки
mov eax, L
mov ebx, M2[4]
and eax, ebx
mov S2, eax; Получаем результат 2 скобки
mov eax, S1
mov ebx, S2
sub eax,ebx; Получаем результат - вычитание скобок
mov M, eax
cmp eax,	37403
jge t2; Если значение больше
jl t3; Если меньше
mov eax, M
t2:
mov edx, 0
mov ebx, 2
div ebx
sub eax, N
mov R, eax; Записываем результат R
jmp t4
t3:
mov edx, 0
mov eax, M2[12]
mov ebx, 2
div ebx
mov edx, M
sub edx, eax
mov R, edx; Записываем результат R
t4:
mov eax, R
test eax, 1
jz t5; четное
jnz t6; нечетное
t5:
mov edx, 159
or eax, edx
jmp exit
t6:
mov edx, 1
sub eax, edx
mov R, eax

exit:
Invoke ExitProcess,1
End Start
