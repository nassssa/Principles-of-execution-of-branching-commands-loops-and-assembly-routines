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
M1 dd 21545,30788,44355,22050; � ��� 
M2 dd 20 dup (0); ������ ������ ��� ����� 

.code
ExitProcess PROTO STDCALL :DWORD
Start:
mov ebx, 0
mov ecx, 4
ti:	
mov eax, M1[ebx]; ������ �
add eax, 1
mov M2[ebx], eax; ���������� ���������� ��������� � ������ ������
add ebx, 4
loop ti; ��������� ���� 4 ����
mov ebx, 4
mov ecx, 3
mov eax, M2[0]; ���������� � X`
t1:
mov edx, M2[ebx]
add eax, edx; X`+Y`+Z`+Q`
add ebx, 4
loop t1
mov L, eax
mov ebx, M2[0]
and eax, ebx
mov S1, eax; �������� ��������� 1 ������
mov eax, L
mov ebx, M2[4]
and eax, ebx
mov S2, eax; �������� ��������� 2 ������
mov eax, S1
mov ebx, S2
sub eax,ebx; �������� ��������� - ��������� ������
mov M, eax
cmp eax,	37403
jge t2; ���� �������� ������
jl t3; ���� ������
mov eax, M
t2:
mov edx, 0
mov ebx, 2
div ebx
sub eax, N
mov R, eax; ���������� ��������� R
jmp t4
t3:
mov edx, 0
mov eax, M2[12]
mov ebx, 2
div ebx
mov edx, M
sub edx, eax
mov R, edx; ���������� ��������� R
t4:
mov eax, R
test eax, 1
jz t5; ������
jnz t6; ��������
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
