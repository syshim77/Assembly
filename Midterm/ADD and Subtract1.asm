TITLE ADD and Substract
; ù��° ���ϱ� ���� ���α׷�
INCLUDE Irvine32.inc
.code
main PROC
 mov eax, 10000h
 add eax, 40000h
 sub eax, 20000h
 call Dumpregs
 call waitmsg
 exit
main ENDP
END main