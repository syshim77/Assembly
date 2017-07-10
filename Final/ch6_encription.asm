TITLE ch6_encryption program

INCLUDE irvine32.inc
KEY=239
BUFMAX=128  ;최대 버퍼크기
.data
sPrompt BYTE "Enter the plain text.",0
sEncrypt BYTE "Cipher text :           ",0
sDecrypt BYTE "Decrypted:            ",0
buffer BYTE BUFMAX+1 DUP(0)
bufsize DWORD ?
.code
main PROC
	call InputTheString
	call TranslateBuffer  ; 암호화
	mov edx, OFFSET sEncrypt  ;암호화 메세지 안내
	call DispalyMessage
	call TranslateBuffer   ; 복호화
	mov edx, OFFSET sDecrypt
	call DispalyMessage
	call waitmsg
	exit
main ENDP
;++++++++++++++++++++++++++++++
InputTheString PROC
;+++++++++++++++++++++++++++++
	pushad
	mov edx, OFFSET sPrompt
	call Writestring
	mov ecx, BUFMAX
	mov edx, OFFSET buffer  ; point to the buffer
	call Readstring
	mov bufsize,eax  ; 길이저장
	call crlf
	popad
	ret
InputTheString ENDP

;++++++++++++++++++++++++++++++
TranslateBuffer PROC
;+++++++++++++++++++++++++++++
	pushad
	mov ecx, bufsize
	mov esi,0 ;index 0
  L1:
    xor buffer[esi],KEY
	inc esi
	loop L1
	popad
	ret
TranslateBuffer ENDP
;++++++++++++++++++++++++++++++
DispalyMessage PROC
;+++++++++++++++++++++++++++++
	pushad
	call writestring
	mov edx, OFFSET buffer 
	call writestring
	call crlf
	popad
	ret
DispalyMessage ENDP
END main