TITLE 6-6

Include Irvine32.inc
.data
str1 BYTE "평균을 입력하세요.(종료하려면 0을 입력하세요) :  ",0
str2 BYTE "학점 수를 입력하세요. : ",0
str3 BYTE "학점은 다음과 같습니다. ",0
str4 BYTE "ERROR : 범위 내의 값을 넣어 주세요. ",0

.code
main PROC
	call clrscr
  L1: call processonescore
     jnz L1
	call crlf	
  L2: exit
main ENDP

processonescore PROC
 pushad
 mov edx, OFFSET str2
 call writestring
 call readint
 .IF eax>30
  mov edx, OFFSET str4
 call writestring
 call crlf
 jmp quit
 .ELSEIF eax<1
  mov edx, OFFSET str4
  call writestring
  call crlf
  jmp quit
 .ENDIF
 mov edx, OFFSET str1
 call writestring
 call readint
 .IF eax>4
  mov edx, OFFSET str4
 call writestring
 jmp quit
 .ENDIF
 cmp eax,0
 je quit
 .IF eax>=4
	mov al, 'A'
 .ELSEIF eax>=3
	mov al, 'B'
 .ELSEIF eax>=2
	mov al, 'C'
 .ELSEIF eax>=1
	mov al, 'D'
 .ELSE 
	mov al, 'F'
 .ENDIF
 mov edx, OFFSET str3
 call writestring
 call writechar
 call crlf
 or al,al  ; clear zero flag 
 quit:
  popad
  ret
processonescore ENDP
END main