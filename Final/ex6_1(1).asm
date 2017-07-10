TITLE EX6_1

Comment!
6-1. 배열 값 계수
다음을 수행하는 응용 프로그램을 작성하라.
 배열을 64개 난수 정수로 채워라
 배열의 각 값을 출력하면서 배열원소 전체에 대해 루프를 수행하라
 루프가 끝난 후 sum 한 값을 출력
 음수 값의 갯수를 출력하라.

!
INCLUDE irvine32.inc
.data
intArray SDWORD 64 DUP(?)
count DWORD 0
.code
main PROC
	call Randomize
	mov esi, OFFSET intArray
	mov ecx, LENGTHOF intArray
	; 랜덤값으로 배열 채우기
 L1: 
    call Random32
	call writeint
	call crlf
	mov [esi],eax
	add esi, 4
	loop L1
	; 음수 값 찾기
	mov esi, OFFSET intArray
	mov ecx, LENGTHOF intArray
 L2:
    cmp dword ptr [esi],0
	jge L3  ; 음수가 아니면 jump
	inc count
 L3:
    add esi,4
	loop L2
	;음수 값의 갯수 출력 부분
	mov eax, count
	call writedec
	call crlf
	call waitmsg
	exit
main ENDP
END main 