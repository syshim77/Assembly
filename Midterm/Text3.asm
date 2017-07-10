include irvine32.inc
continuemsg TEXTEQU <"Do you want to see the answer?">
continuemsg TEXTEQU <"Do you want to see the answer?", 0dh, 0ah>
cal_size TEXTEQU <"Size of array?">
rowsize=5
count TEXTEQU %(rowsize*2)
move TEXTEQU <mov>
setupAL TEXTEQU <move al, count>
.data
prompt1 BYTE continuemsg
.code
main PROC
	mov eax, 0
	mov edx, OFFSET prompt1
	call writestring
	call crlf
	setupAL
	call writeint
	call crlf
	call waitmsg
	exit
main ENDP
END main