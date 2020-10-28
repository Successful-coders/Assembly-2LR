.386
.model flat
;.stack 4096

.data
flenght	dd 0
slenght	dd 0
help dd 0
string1 dd 0
string2 dd 0
pos dd 0
.code

@FUNC@20 proc
	push ebp ;��������� ebp ��� ������
	mov ebp, esp ;������������� ����� �������� ebp

	;����� ������ ������ ������ ���� ������ ����� ������ ������
	cmp edx, ecx
	jb error

	;����� ������ ������ ���� ������ ����
	add flenght, ecx
	cmp flenght, 0
	jbe error

	; ����� ������ ������
	add slenght, edx
	cmp slenght, 0
	jbe error
	add help, edx

	;add string1, [ebp]+4 ������ ��������, ������ ����� �������
 
	;add string2, [ebp]+8 ������� � ������� ����

	;[ebp+16] - pos 
	
	mov esi, [ebp]+12;������ ������
	mov edi, [ebp]+8;������ ������
	xor eax, eax
	xor esp, esp
FindSymbol:
;��������
	mov al,[edi]
	mov cl, [esi]
	cmp al, cl
	je found
	inc esi
	dec slenght
	cmp slenght, 0
	ja FindSymbol
	
	inc edi
	mov esi, [ebp]+12
	add slenght, edx
	add esp ,1
	dec flenght
	cmp flenght, 0
	ja FindSymbol
;�������� ����� ����� ������ �� �����
	pop ebp
	mov eax,1
	ret 20
;�������� ����� �����
found:
	ret 1

	error:
		pop ebp
		mov eax, 0
		ret 12
@FUNC@20 endp
end