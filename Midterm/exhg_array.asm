include irvine32.inc
.data
arrayD DWORD 1,2,3
.code
main PROC
	mov eax, arrayD
	xchg eax,[arrayD+4]
	xchg eax,[arrayD+8]
	mov arrayD, eax
	call writeint
	mov eax,[arrayD+4]
	call writeint
	mov eax,[arrayD+8]
	call writeint
	call crlf
	call waitmsg
	exit
main ENDP
END main