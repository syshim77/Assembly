TITLE ex4_7
COMMENT !
 eax=-val2+7-val3+val1 계산식 만들기
!
INCLUDE irvine32.inc
.data
val1 SDWORD 8
val2 SDWORD -15
val3 SDWORD 20
.code
main PROC
	mov eax, val2
	neg eax
	add eax,7
	sub eax, val3
	add eax, val1
	call writeint
	call crlf
	call waitmsg
	exit
main ENDP
END main