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
	 ; Dumpmem �ϱ� ���Ѻκ�
	 mov esi, OFFSET target
	 mov ebx,1
	 mov ecx, SIZEOF target-1
	 call DumpMem
	 ; �̺κ��� ���ڿ��� ǥ���ϱ� ���� �κ�
	 mov edx, OFFSET target
	 call WriteString
	 call Crlf
	 exit
main ENDP
END main