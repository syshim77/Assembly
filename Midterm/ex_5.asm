TITLE ch. 4_5 Exercise

Comment ! EX 4-5 �迭�� ���� �����迭�� ���Ҹ� ���� �ּ������� �ε��� �ּ������� ����� ������ ����Ͽ� �������� ��ġ

!

INCLUDE Irvine32.inc

.data

array DWORD 1,2,3,4,5,6,7,8,9

.code

main PROC   ; point to the first and last array elements

  mov esi,0 ; array�� ����  

mov edi, SIZEOF array - TYPE array  ; end of array  

mov ecx, LENGTHOF array/2  ; loop (N/2) times   

L1:   ; array[esi]�� array[edi]�� ���� ��ȯ     

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
