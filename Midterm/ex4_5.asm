TITLE ex4_5
comment !
정수배열의 원소를 간접 주소지정과 인덱스 주소지정을 사용한 루프를 사용하여 역순으로 배치

!
INCLUDE irvine32.inc
.data
array DWORD 1,2,3,4,5,6,7,8,9
.code
main PROC
   ; 배열의 처음과 마지막 요소 지정하기 
	mov esi,0
	mov edi, SIZEOF array-TYPE array  ; end of array
	mov ecx, LENGTHOF array/2 ; loop(N/2)  times
  L1:
    mov edx, array[esi]; temp=array[edi]
	mov eax, array[edi]  ; array[esi]=array[edi]
	mov array[esi], eax
	mov array[edi], edx  ;array[edi]=temp
	add esi, TYPE array
	sub edi, TYPE array
	LOOP L1
	; array 출력
	mov esi, OFFSET array
	mov ecx, LENGTHOF array
	mov ebx, TYPE array
	call Dumpmem
	call waitmsg
	exit
main ENDP
END main