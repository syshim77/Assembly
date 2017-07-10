TITLE 6_3

INCLUDE irvine32.inc
.data
str1 BYTE "성적값을 입력하세요.    ",0
str2 BYTE "등급은 다음과 같습니다.    ",0
.code
main PROC
	call clrscr
	mov edx,OFFSET str1
	call writestring
	call readint
	call crlf
	.IF eax >= 90
		mov al, 'A'
	.ELSEIF eax >= 80
		mov al, 'B'
	.ELSEIF eax >= 70
		mov al, 'C'
	.ELSEIF eax >= 60
		mov al, 'D'
	.ELSE 
		mov al, 'F'
	.ENDIF
	mov edx,OFFSET str2
	call writestring
	call writechar
	call crlf
	call waitmsg
	exit
main ENDP
END main