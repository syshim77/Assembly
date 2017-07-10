TITLE TEXTEQU and EQU
INCLUDE Irvine32.inc
continuemsg TEXTEQU <"Do you want to see the answer?">
continuemsg TEXTEQU <"Do you want to see the answer?",0dh,0ah>
x equ 2
y equ 3
val1 equ 1

text1 TEXTEQU %(x+y)
text2 TEXTEQU %(text1+y)
;text3 TEXTEQU y+2  ?
text4 TEXTEQU text2+2
text5 equ text2+2

Result textequ <mov al, text2>
.data
prompt1 BYTE continuemsg
Teststring BYTE 1 DUP("hello",0)
.code
main PROC
	mov eax,0
	mov edx,OFFSET prompt1
	call writestring
	call crlf
	mov al, text1
	call writeint
	mov al, text2
	call writeint
	;mov al, text3
	;call writeint
	mov al, text4
	call writeint
	mov al, text5
	call writeint
	Result   ;  <mov al, text2>
	call writeint
	call crlf
	Result textequ <mov edx, OFFSET Teststring>
	Result
	call writestring
	call crlf
	call waitmsg
	exit
main ENDP
END main 
 