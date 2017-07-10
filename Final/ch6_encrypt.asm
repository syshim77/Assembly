INCLUDE irvine32.inc
KEY=239
BUFMAX=128
.data
sPrompt BYTE "Enter the plain text:   ",0
sEncrypt BYTE "Cipher text:    ",0
sDecrypt BYTE "Decrypted:   ",0
buffer BYTE BUFMAX+1  DUP(0)
bufSize DWORD ?
.code
main PROC
	call InputTheString
	call TranslateBuffer
	mov edx, OFFSET sEncrypt
	call DispalyMessage
	call TranslateBuffer
	mov edx, OFFSET sDecrypt
	call DispalyMessage
	call waitmsg
	exit
main ENDP
;------------------------------
InputTheString PROC
;------------------------------
	pushad
	mov edx, OFFSET sPrompt
	call writestring
	mov ecx, BUFMAX
	mov edx, OFFSET buffer 
	call readstring
	mov bufSize,eax
	call crlf
	popad
	ret
InputTheString ENDP
;------------------------------
TranslateBuffer PROC
;------------------------------
	pushad
	mov ecx, bufsize  ; loop counter
	mov esi,0  
  L1:
	xor buffer[esi],KEY
	inc esi
	loop L1
	popad
	ret
TranslateBuffer ENDP
;------------------------------
DispalyMessage PROC
;------------------------------
	pushad
	call writestring
	mov edx, OFFSET buffer
	call writestring
	call crlf
	call crlf
	popad
	ret
DispalyMessage ENDP


END main