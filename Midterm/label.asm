INCLUDE irvine32.inc
; label: ������� �Ҵ���� ũ�� �Ӽ� �ִ°� ����
.data
val16 LABEL word
val32 DWORD 12345678h

LongValue LABEL DWORD
val1 WORD 5678h
val2 WORD 1234h
.code
main PROC
	mov ax, val16  ;ax=?
	mov dx,[val16+2] ; dx=?
	; ���� ������ ���� ū���� ����� �����  label
	mov eax, LongValue
	call Dumpregs
	call waitmsg
	exit
main ENDP
END main