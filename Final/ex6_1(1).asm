TITLE EX6_1

Comment!
6-1. �迭 �� ���
������ �����ϴ� ���� ���α׷��� �ۼ��϶�.
 �迭�� 64�� ���� ������ ä����
 �迭�� �� ���� ����ϸ鼭 �迭���� ��ü�� ���� ������ �����϶�
 ������ ���� �� sum �� ���� ���
 ���� ���� ������ ����϶�.

!
INCLUDE irvine32.inc
.data
intArray SDWORD 64 DUP(?)
count DWORD 0
.code
main PROC
	call Randomize
	mov esi, OFFSET intArray
	mov ecx, LENGTHOF intArray
	; ���������� �迭 ä���
 L1: 
    call Random32
	call writeint
	call crlf
	mov [esi],eax
	add esi, 4
	loop L1
	; ���� �� ã��
	mov esi, OFFSET intArray
	mov ecx, LENGTHOF intArray
 L2:
    cmp dword ptr [esi],0
	jge L3  ; ������ �ƴϸ� jump
	inc count
 L3:
    add esi,4
	loop L2
	;���� ���� ���� ��� �κ�
	mov eax, count
	call writedec
	call crlf
	call waitmsg
	exit
main ENDP
END main 