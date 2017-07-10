COMMENT!
1,2,3  --> 3,1,2 순서로 배열변경
!
INCLUDE irvine32.inc
.data
arrayD DWORD 1, 2, 3
size_arrayD=($-arrayD)/4
.code
main PROC
	mov ecx, size_arrayD
	mov esi,0  ;offset
	mov eax, arrayD  ; eax=1
	xchg eax,[arrayD+4]; eax=2, [arrayD+4]=1
	xchg eax,[arrayD+8]; eax=3, [arrayD+4]=2
	mov arrayD, eax
	;call writeint
	;mov eax,[arrayD+4]
	;call writeint
	;mov eax,[arrayD+8]
	;call writeint
   
	;loop 사용
	L1: mov eax, arrayD[esi]
	call writeint
	add esi,4
	loop L1
	call crlf
	call waitmsg
	exit
main ENDP
END main