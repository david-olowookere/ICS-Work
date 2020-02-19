;
; CS1022 Introduction to Computing II 2019/2020
; Lab 1B - Bubble Sort
;

N	EQU	10

	AREA	globals, DATA, READWRITE

; N word-size values

SORTED	SPACE	N*4		; N words (4 bytes each)


	AREA	RESET, CODE, READONLY
	ENTRY


	;
	; copy the test data into RAM
	;

	LDR	R4, =SORTED
	LDR	R5, =UNSORT
	LDR	R6, =0
whInit
	CMP	R6, #N
	BHS	eWhInit
	LDR	R7, [R5, R6, LSL #2]
	STR	R7, [R4, R6, LSL #2]
	ADD	R6, R6, #1
	B	whInit
eWhInit

	LDR	R4, =SORTED
	LDR	R5, =UNSORT
doWhile	
	LDR R6, =0				; boolean swapped = false;
	LDR R7, =1				; i = 1;
forLoop
	CMP	R7, #N
	BHS	endForLoop
	SUB	R7, R7, #1
	LDR	R8, [R4, R7, LSL #2]
	ADD	R7, R7, #1
	LDR R9, [R4, R7, LSL #2]
	CMP R8, R9
	BLS	dontSwap
	SUB	R7, R7, #1
	STR	R9, [R4, R7, LSL #2]
	ADD	R7, R7, #1
	STR R8, [R4, R7, LSL #2]
	LDR	R6, =1
dontSwap
	ADD R7, R7, #1			; i++;
	B forLoop
endForLoop
	
	CMP R6, #0
	BNE	doWhile				; } while (swapped)
stop	B stop

UNSORT	DCD	9,3,0,1,6,2,4,7,8,5

	END
