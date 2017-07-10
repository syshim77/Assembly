include irvine32.inc
cal_size TEXTEQU <"Size of array?">
.data
list BYTE 10,20,30,40
listsize=($-list)
prompt1 BYTE cal_size
.code
main PROC
	call clrscr
	mov eax,0
	mov edx, OFFSET prompt1
	call writestring
	call crlf
	mov eax, listsize
	call writeint
	call crlf
	call waitmsg
	 exit
main ENDP
END main