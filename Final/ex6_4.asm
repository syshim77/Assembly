TITLE ex6_3

comment !
 사용자로 부터 0~100 사이 점수를 입력 받고 이에 해당하는 학점을 출력하는
 프로그램을 작성하라.
    점수    학점
   90~100    A
   80~89     B 
   70~79     C
   60~69     D
   0~59	     F
!
Include Irvine32.inc
.data
str1 BYTE "점수를 입력하세요.(종료하려면 0을 입력하세요) :  ",0
str2 BYTE "학점은 다음과 같습니다. ",0
str3 BYTE "ERROR : 0~100 사이 값을 넣어 주세요. ",0
str4 BYTE "정확히 값을 입력하신 횟수는 다음과 같습니다. ",0
scorecount DWORD 0
.code
main PROC
	call clrscr
  L1: call processonescore
     jnz L1
	 mov edx, OFFSET str4
    call writestring
	mov eax, scorecount
	call writedec
	call crlf	
  L2: exit
main ENDP
;----------------------------
processonescore PROC
;----------------------------
 pushad
 mov edx, OFFSET str1
 call writestring
 call readint
 call crlf
 .IF eax>100
  mov edx, OFFSET str3
 call writestring
 jmp quit
 .ENDIF
 ; 사용자가 0을 입력했는지 비교하여 프로그램 종료
 cmp eax,0
 je quit
 ; 사용자가 계속하기를 원하는 경우
 .IF eax>=90
	mov al, 'A'
 .ELSEIF eax>=80
	mov al, 'B'
 .ELSEIF eax>=70
	mov al, 'C'
 .ELSEIF eax>=60
	mov al, 'D'
 .ELSE 
	mov al, 'F'
 .ENDIF

 inc scorecount
 mov edx, OFFSET str2
 call writestring
 call writechar
 call crlf
 or al,al  ; clear zero flag 
 quit:
  popad
  ret
processonescore ENDP
END main