TITLE EX 4.6
comment!
	피보나치 행렬 계산..{1,1,2,3,5,8,13}
!
INCLUDE irvine32.inc
.code
main PROC
	mov eax,1
	;call Dumpregs
	call writeint
	call crlf
	mov ebx,0
	mov edx,1
	mov ecx,6
  L1:
    mov eax, ebx   ;eax=ebx+edx
	add eax, edx
	;call dumpregs
	call writeint
	call crlf
	mov ebx, edx
	mov edx, eax
	LOOP L1
	;call writeint
	;call crlf
	call waitmsg
	exit
main ENDP
END main
