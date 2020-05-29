; Program: Greatest_Common_Divisor (Chapter 7, Pr 6)
; Description: Calculate GCD using two methods
; Student:     Gabriel Warkentin
; Date:        03/24/2020
; Class:       CSCI 241
; Instructor:  Mr. Ding

INCLUDE Irvine32.inc

.data

msg1 BYTE "Enter 1st 32 bit number: ",0
msg2 BYTE "Enter 2nd 32 bit number: ",0
msg3 BYTE "Method 1 ",0
msg4 BYTE "Method 2 "
msg5 BYTE "greatest common divisor is: ",0


.code
main10 PROC

	mov edx, OFFSET msg1
	call GetGoodPosInt
	mov ebx, eax
	mov edx, OFFSET msg2
	call GetGoodPosInt
	mov ecx, eax			; save so we can try both methods with one input

	mov edx, OFFSET msg3
	call WriteString
	mov edx, OFFSET msg5
	call WriteString
	call CalcGcd1
	call WriteDec
	call CrLf

	mov eax, ecx			; recall 2nd input, first is back because of "USES ebx"
	mov edx, OFFSET msg4
	call WriteString
	call CalcGcd2
	call WriteDec
	call CrLf

	exit
main10 ENDP

;------------------------------------------------------------
GetGoodPosInt PROC
; Get a signed int from user, trying again if bad input
; Converts to unsigned
; Receives: edx = string to print (allow repeats showing which var)
; Returns: eax = signed Int
;------------------------------------------------------------
L0:
	call WriteString
	call ReadInt
	jo L0					; bad value, try again
	test eax, eax
	jz L0					; zero, try again
	jns L1
	neg eax					; convert negs to pos
L1:
	ret
GetGoodPosInt ENDP

;------------------------------------------------------------
CalcGcd1 PROC USES ebx
; Finds greatest common denominator for two unsigned ints
; Converts to unsigned
; Receives: eax, ebx = two unsigned 32 bit ints
; Returns: eax = GCD
;------------------------------------------------------------
L0:
	mov edx, 0
	div ebx
	mov eax, ebx
	mov ebx, edx
	test ebx, ebx
	jnz L0
	ret
CalcGcd1 ENDP

;------------------------------------------------------------
CalcGcd2 PROC USES ebx
; Finds greatest common denominator for two unsigned ints
; Converts to unsigned
; Receives: eax, ebx = two unsigned 32 bit ints
; Returns: eax = GCD
;------------------------------------------------------------
L0:
	cmp eax, ebx
	je L2
	ja L1
	sub ebx, eax
	jmp L0
L1:
	sub eax, ebx
	jmp L0
L2:
	ret
CalcGcd2 ENDP

END ; main10