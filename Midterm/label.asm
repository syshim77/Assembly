INCLUDE irvine32.inc
; label: 저장공간 할당없이 크기 속성 주는것 가능
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
	; 작은 정수로 부터 큰정수 만드는 경우의  label
	mov eax, LongValue
	call Dumpregs
	call waitmsg
	exit
main ENDP
END main