TITLE 6-8

INCLUDE Irvine32.inc
.data
menu		BYTE "MENU",0dh,0ah,"1. x AND y",0dh,0ah,"2. x OR y",0dh,0ah,"3. NOT x",0dh,0ah,"4. x XOR y",0dh,0ah,"5. Exit program",0dh,0ah,0dh,0ah,"Select Number : ",0
input1	BYTE "input x (in hexadecimal):",0
input2	BYTE "input y (in hexadecimal):",0
result	BYTE "result; ",0

.code
main PROC
START:
	mov edx,OFFSET menu
	call WriteString
	call ReadInt
	mov ecx,eax

	cmp ecx,5
	je QUIT
	cmp ecx,0
	jle START
	cmp ecx,5
	jg START

	mov edx,OFFSET input1
	call WriteString
	call ReadHex
	cmp ecx,3
	je NOT_
	
	mov ebx,eax
	mov edx,OFFSET input2
	call WriteString
	call ReadHex
	cmp ecx,1
	je AND_
	cmp ecx,2
	je OR_
	cmp ecx,4
	je XOR_
	
AND_:
	call AND_op
	jmp PRINT_RESULT
OR_:
	call OR_op
	jmp PRINT_RESULT
NOT_:
	call NOT_op
	jmp PRINT_RESULT
XOR_:
	call XOR_op
	jmp PRINT_RESULT

PRINT_RESULT:
	mov edx,OFFSET result
	call WriteString
	call WriteHex
	call crlf
	call crlf
	jmp START

QUIT:
	exit
main ENDP

AND_op PROC
	and eax,ebx
	ret
AND_op ENDP

OR_op PROC
	or eax,ebx
	ret
OR_op ENDP

NOT_op PROC
	not eax
	ret
NOT_op ENDP

XOR_op PROC
	xor eax,ebx
	ret
XOR_op ENDP

END main