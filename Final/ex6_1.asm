TITLE EX6_1 Counting Array Values
Include Irvine32.inc
.data
intArray SDWORD 50 DUP(?)
count DWORD 0
.code
main PROC
	call Randomize
	;Array�� ���������� ä���
	mov esi, OFFSET intArray
	mov ecx, LENGTHOF intArray
L1: call Random32
	call Writeint
	call crlf
	mov [esi], eax
	add esi,4
	loop L1
	; ������ ã��
	mov esi, OFFSET intArray
	mov ecx, LENGTHOF intArray
L2:
    cmp dword ptr [esi],0  ; 0�� ��
	jge L3
	inc count
L3:
    add esi,4
	loop L2
	mov eax, count
	call writedec
	call crlf
	exit
main ENDP
END main