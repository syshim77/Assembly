TITLE Chapter 7 Exercise 4                             (ch07_04.asm)

Comment !
ror rol 등을 이용한 암호화.

key BYTE -2, 4, 1, 0, -3, 5, 2, -4, -4, 6

!

INCLUDE Irvine32.inc

.data
key BYTE -2, 4, 1, 0, -3, 5, 2, -4, -4, 6
keySize = $ - key
plainText BYTE "이 문장이 암호화 되어 나타나고 다시 복호화 되어 나타납니다.",0

.code
main PROC
	call Clrscr
	mov  edx,OFFSET plainText	; display the decoded text
	call	WriteString
	call Crlf

	mov  esi,OFFSET plainText
	
L1:	mov  ecx,keySize
	mov  edi,OFFSET key
	call Encode			; encode 10 bytes
	jnz	L1				; continue if ZF not set

	mov  edx,OFFSET plainText	; display the decoded text
	call	WriteString
	call Crlf

; Optional: decode the string by reversing the rotations	

	mov  esi,OFFSET plainText
	
L2:	mov  ecx,keySize
	mov  edi,OFFSET key
	call Decode			; decode 10 bytes
	jnz	L2				; continue if ZF not set

	mov  edx,OFFSET plainText	; display the decoded text
	call	WriteString
	call Crlf
	
	exit
main ENDP

;-----------------------------------------------------
Encode PROC
; Encode a string by rotating each byte in a different
; direction and amount.
; Receives: ECX = key length, ESI = addr of the plainText,
;           EDI = addr of the key
; Returns: ZF = 1 if the end of string was found
;-----------------------------------------------------

L1:	push ecx				; save loop count
	cmp  BYTE PTR[esi],0	; end of string?
	je	L4				; yes: quit with ZF=1

	mov	cl,[edi]			; key byte
	cmp  cl,0				; if positive, skip to L2
	jge  L2
	rol  BYTE PTR[esi],cl	; else, rotate left
	jmp	L3
L2:	ror	BYTE PTR[esi],cl	; rotate right

L3:	inc	esi				; next plaintext byte
	inc	edi				; next key byte
	pop	ecx				; restore loop count
	loop L1
	
	; Clear the zero flag to indicate that we have
	; not yet reached the end of the string.
	or	eax,1
	jmp	L5

L4:	pop	ecx				; ecx was left on the stack
L5:	ret
Encode ENDP


;-----------------------------------------------------
Decode PROC
; Decode a string by rotating each byte in a different
; direction and amount.
; Receives: ECX = key length, ESI = addr of the plainText,
;           EDI = addr of the key
; Returns: ZF = 1 if the end of string was found
;-----------------------------------------------------

L1:	push ecx				; save loop count
	cmp  BYTE PTR[esi],0	; end of string?
	je	L4				; yes: quit with ZF=1

	mov	cl,[edi]			; key byte
	cmp  cl,0				; if positive, skip to L2
	jge  L2
	ror  BYTE PTR[esi],cl	; else, rotate right
	jmp	L3
L2:	rol	BYTE PTR[esi],cl	; rotate left

L3:	inc	esi				; next plaintext byte
	inc	edi				; next key byte
	pop	ecx				; restore loop count
	loop L1
	
	; Clear the zero flag to indicate that we have
	; not yet reached the end of the string.
	or	eax,1
	jmp	L5

L4:	pop	ecx				; ecx was left on the stack
L5:	ret
Decode ENDP







END main