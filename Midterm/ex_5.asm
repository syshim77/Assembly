TITLE ch. 4_5 Exercise

Comment ! EX 4-5 배열의 역순 정수배열의 원소를 간접 주소지정과 인덱스 주소지정을 사용한 루프를 사용하여 역순으로 배치

!

INCLUDE Irvine32.inc

.data

array DWORD 1,2,3,4,5,6,7,8,9

.code

main PROC   ; point to the first and last array elements

  mov esi,0 ; array의 시작  

mov edi, SIZEOF array - TYPE array  ; end of array  

mov ecx, LENGTHOF array/2  ; loop (N/2) times   

L1:   ; array[esi]와 array[edi]를 서로 교환     

mov edx, array[esi]  ;temp=array[esi]  

mov eax, array[edi]  ;

array[esi]=array[edi]  

mov array[esi], eax  

mov array[edi], edx  ;

array[edi]=temp  

add esi, TYPE array  

sub edi, TYPE array  

loop L1  

mov esi, OFFSET array  

mov ecx, LENGTHOF array  

mov ebx, TYPE array  

call Dumpmem  

exit

main ENDP

END main
