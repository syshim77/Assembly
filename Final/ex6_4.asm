TITLE ex6_3

comment !
 ����ڷ� ���� 0~100 ���� ������ �Է� �ް� �̿� �ش��ϴ� ������ ����ϴ�
 ���α׷��� �ۼ��϶�.
    ����    ����
   90~100    A
   80~89     B 
   70~79     C
   60~69     D
   0~59	     F
!
Include Irvine32.inc
.data
str1 BYTE "������ �Է��ϼ���.(�����Ϸ��� 0�� �Է��ϼ���) :  ",0
str2 BYTE "������ ������ �����ϴ�. ",0
str3 BYTE "ERROR : 0~100 ���� ���� �־� �ּ���. ",0
str4 BYTE "��Ȯ�� ���� �Է��Ͻ� Ƚ���� ������ �����ϴ�. ",0
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
 ; ����ڰ� 0�� �Է��ߴ��� ���Ͽ� ���α׷� ����
 cmp eax,0
 je quit
 ; ����ڰ� ����ϱ⸦ ���ϴ� ���
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