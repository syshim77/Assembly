INCLUDE irvine32.inc
.data
source BYTE "This is the source string",0
target BYTE SIZEOF source DUP(0)
.code
main PROC
	 mov esi, OFFSET target -2
	 mov edi, OFFSET target
	 mov ecx, SIZEOF source-1
 L1: mov al,[esi]
     mov [edi],al
	 dec esi
	 inc edi
	 loop L1
	 ; Dumpmem 하기 위한부분
	 mov esi, OFFSET target
	 mov ebx,1
	 mov ecx, SIZEOF target-1
	 call DumpMem
	 ; 이부분은 문자열을 표시하기 위한 부분
	 mov edx, OFFSET target
	 call WriteString
	 call Crlf
	 exit
main ENDP
END main