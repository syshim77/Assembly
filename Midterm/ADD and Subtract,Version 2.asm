TITLE ADD and Subtract,Version 2
; This program adds and subtracts 32-bit unsinged
; integers and stores the sum in a variable.
INCLUDE Irvine32.inc
.data
val1 DWORD 10000h
val2 DWORD 40000h
val3 DWORD 20000h
finalVal DWORD ?
.code
main PROC
 mov eax,val1
 add eax,val2
 sub eax,val3
 mov finalVal,eax
 call DumpRegs
 exit
main ENDP
END main