TITLE 6-9

INCLUDE irvine32.inc
.data
str1 BYTE "Print text with random color...", 0
.code
main PROC
	mov ecx, 20
	L1:
	call randomize
	call random_color
	mov edx, OFFSET str1
	call writestring
	call crlf
	loop L1
	exit
main ENDP

random_color PROC
	mov eax, 9
	call RandomRange
	.IF eax<=2
	mov eax, white
	call settextcolor
	.ELSEIF eax==3
	mov eax, blue
	call settextcolor
	.ELSE
	mov eax, green
	call settextcolor
	.ENDIF
	ret
random_color ENDP

END main