TITLE 6-11

INCLUDE Irvine32.inc
BUFMAX = 128
.data
sPrompt  BYTE  "Plain text : ", 0
sEncrypt BYTE  "Cipher text : ", 0
sDecrypt BYTE  "Decrypted : ", 0
buffer   BYTE   BUFMAX+1 DUP(0)
bufSize  DWORD  ?
sUserKey	BYTE "Key : ", 0
userkey		BYTE BUFMAX+1 DUP(0)
userkeysize	DWORD ?
tempKEY		BYTE  ?
bufferindex	DWORD ?
keyindex	DWORD ?

.code
main PROC
	call clrscr
	mov	edx, OFFSET sUserKey
	call WriteString
	mov	ecx, BUFMAX	
	mov	edx, OFFSET userkey
	call ReadString
	mov	userkeysize, eax
	call InputTheString
	call TranslateBuffer
	mov	edx, OFFSET sEncrypt
	call DisplayMessage
	call TranslateBuffer
	mov	edx, OFFSET sDecrypt
	call DisplayMessage
	exit
main ENDP

InputTheString PROC
	pushad
	mov	edx, OFFSET sPrompt
	call WriteString
	mov	ecx, BUFMAX
	mov	edx, OFFSET buffer
	call ReadString
	mov	bufSize, eax
	popad
	ret
InputTheString ENDP

DisplayMessage PROC
	pushad
	call WriteString
	mov	edx, OFFSET buffer
	call WriteString
	call crlf
	popad
	ret
DisplayMessage ENDP

TranslateBuffer PROC
	pushad
	mov	ecx, bufSize
	mov	keyindex, 0
	mov	bufferindex, 0
	L1:
	mov	esi, keyindex
	mov	al, userkey[esi]
	mov	tempKEY, al
	cmp	esi, userkeysize
	je initkey
	jne indexinc
	initkey:
	mov	keyindex, 0
	mov esi, keyindex
	mov al, userkey[esi]
	jmp	continue
	indexinc:
	inc	keyindex
	mov esi, keyindex
	mov al, userkey[esi]
	continue:
	mov	esi, bufferindex
	xor	buffer[esi], al
	inc	bufferindex
	loop L1
	popad
	ret
TranslateBuffer ENDP
END main