; Generated with JAvaScript to ASSembly COmpiler, JASSCO v0. Boria Labs 2025.
; Directives -------------------------------------------------
        org 25000               ; initial code address
        jp mai_cod              ; jumps to main code

; Variable declarations --------------------------------------
        sta_ck2 defw 24500      ; auxiliary stack address
eS_   equ 0                   ; (VariableDeclarator) constant integer
wP_   equ 5                   ; (VariableDeclarator) constant integer
wN_   equ 17                   ; (VariableDeclarator) constant integer
wB_   equ 25                   ; (VariableDeclarator) constant integer
wR_   equ 41                   ; (VariableDeclarator) constant integer
wQ_   equ 57                   ; (VariableDeclarator) constant integer
wK_   equ 65                   ; (VariableDeclarator) constant integer
bP_   equ 7                   ; (VariableDeclarator) constant integer
bN_   equ 19                   ; (VariableDeclarator) constant integer
bB_   equ 27                   ; (VariableDeclarator) constant integer
bR_   equ 43                   ; (VariableDeclarator) constant integer
bQ_   equ 59                   ; (VariableDeclarator) constant integer
bK_   equ 67                   ; (VariableDeclarator) constant integer
pieces_   defw 13                  ; (VariableDeclarator) dictionary
        defw 0, " "              ; (VariableDeclarator) dictionary, strings
        defw 7, "p"              ; (VariableDeclarator) dictionary, strings
        defw 19, "n"              ; (VariableDeclarator) dictionary, strings
        defw 27, "b"              ; (VariableDeclarator) dictionary, strings
        defw 43, "r"              ; (VariableDeclarator) dictionary, strings
        defw 59, "q"              ; (VariableDeclarator) dictionary, strings
        defw 67, "k"              ; (VariableDeclarator) dictionary, strings
        defw 5, "P"              ; (VariableDeclarator) dictionary, strings
        defw 17, "N"              ; (VariableDeclarator) dictionary, strings
        defw 25, "B"              ; (VariableDeclarator) dictionary, strings
        defw 41, "R"              ; (VariableDeclarator) dictionary, strings
        defw 57, "Q"              ; (VariableDeclarator) dictionary, strings
        defw 65, "K"              ; (VariableDeclarator) dictionary, strings
board_   defb 128, 1               ; (VariableDeclarator) integer matrix (cols, rows)
        defw 43, 19, 27, 59, 67, 27, 19, 43, 0, 0, 0, 0, 0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 41, 17, 25, 57, 65, 25, 17, 41, 0, 0, 0, 0, 0, 0, 0, 0    ; matrix declaration
vector_pointers_   defw 6                  ; (VariableDeclarator) dictionary
        defw 135, 250              ; (VariableDeclarator) dictionary, integers
        defw 147, 244              ; (VariableDeclarator) dictionary, integers
        defw 155, 251              ; (VariableDeclarator) dictionary, integers
        defw 171, 241              ; (VariableDeclarator) dictionary, integers
        defw 187, 249              ; (VariableDeclarator) dictionary, integers
        defw 195, 249              ; (VariableDeclarator) dictionary, integers
vector_lists_   defb 13, 1               ; (VariableDeclarator) integer matrix (cols, rows)
        defw 1, 16, 0, 14, 31, 18, 33, 0, 1, 16, 15, 17, 0    ; matrix declaration
im_dkey_   defb 0, 0            ; (VariableDeclarator) empty string
        defs 32, 0xFF           ;
dkey_   defw 0                  ; (VariableDeclarator) dkey_ is a pointer
best_move_   defb 2, 1              ; (VariableDeclarator) empty matrix (cols, rows)
        defs 4                 ; space reserved for the array/matrix
best_score_   defw 0                  ; (VariableDeclarator) variable int/bool
move_list_   defb 2, 64              ; (VariableDeclarator) empty matrix (cols, rows)
        defs 256                 ; space reserved for the array/matrix
attacks_   defb 128, 1              ; (VariableDeclarator) empty matrix (cols, rows)
        defs 256                 ; space reserved for the array/matrix
user_move_length_   defw 0                  ; (VariableDeclarator) variable int/bool
user_move_   defb 4, 1              ; (VariableDeclarator) empty matrix (cols, rows)
        defs 8                 ; space reserved for the array/matrix
source_sq_   defw 0                  ; (VariableDeclarator) variable int/bool
target_sq_   defw 0                  ; (VariableDeclarator) variable int/bool
keyd_   defw 0                  ; (VariableDeclarator) variable int/bool
file_   defw 0                  ; (VariableDeclarator) variable int/bool
rank_   defw 0                  ; (VariableDeclarator) variable int/bool
char_file_   defw 0                ; (FunctionDeclaration) literal int/bool
char_rank_   defw 0                ; (FunctionDeclaration) literal int/bool
dark_   defw 0                  ; (VariableDeclarator) variable int/bool
piece_   defw 0                  ; (VariableDeclarator) variable int/bool
sq_   defw 0                  ; (VariableDeclarator) variable int/bool
key_   defw 0                ; (FunctionDeclaration) literal int/bool
stn_021 defb 6, 0, "Mated!"        ; (Literal) string
vector_pointer_   defw 0                  ; (VariableDeclarator) variable int/bool
spiece_   defw 0                  ; (VariableDeclarator) variable int/bool
number_of_moves_   defw 0                  ; (VariableDeclarator) variable int/bool
vector_offset_   defw 1                  ; (VariableDeclarator) variable int/bool
direction_   defw 1                  ; (VariableDeclarator) variable int/bool
offset_count_   defw 0                  ; (VariableDeclarator) variable int/bool
stn_067 defb 6, 0, "Move #"        ; (Literal) string
stn_068 defb 2, 0, ": "        ; (Literal) string
stn_069 defb 2, 0, ", "        ; (Literal) string
stn_095 defb 14, 0, "Move selection"        ; (Literal) string
i_   defw 0                  ; (VariableDeclarator) variable int/bool
valuation_   defw 127                  ; (VariableDeclarator) variable int/bool
stn_113 defb 20, 0, "White is checkmated!"        ; (Literal) string
keydown_activation defw 1               ; (CallExpression) add/remove flag

; Include files ----------------------------------------------
; File: io.asc. Basic Input/Output library for ZX Spectrum

; set_env: configure environment for the specific computer
; if nothing is needed, jut leave ret
set_env ld a,2		; upper screen
  	call 5633	; open channel
	ret

; prt_str: prints string in screen
; DE= string content, BC= length
prt_str ld a,2			; upper screen
    	call 5633     	; open channel
    	pop ix			; <<< pop return address
    	pop de			; <<< variable content address
    	pop bc			; <<< variable address
    	ld a, (de)		; get length byte 1
    	ld c, a			;
    	inc de			;
    	ld a, (de)		; get length byte 2
    	ld b, a			;
    	inc de			;
 
		push ix			; >>> push return address
		call 8252		; print our string
		ret				;

; prt_num: prints 16-bit number in screen	
; DE= string content, BC= length
prt_num	ld a,2			; upper screen
		call 5633		; open channel
		pop ix			; <<< pop return address
		pop bc			; <<< pop number value
		pop de			; <<< pop number length

		bit 7, b		; check sign
		jr z, prt_ski	; if 0, skip
		ld a, "-"		; load "-" sign
		rst 16			; print "-"
		ld hl, 0		; 
		sbc hl, bc		; negate: HL= -BC
		push hl			; >>> push result
		pop bc			; <<< pop result
	
prt_ski
		push ix			; >>> push return address
		call 11563		; 
		call 11747		; top of calculator stack
    	ret				;

; prt_chr: prints 1 char in screen	
; DE= string content, BC= length
prt_chr	;ld a,2			; upper screen
		;call 5633		; open channel
		pop ix			; <<< pop return address
		pop bc			; <<< pop number value
		pop de			; <<< pop number length, unused
		
		ld a, c			;
		rst 16			; call rom routine
		push ix			; >>> push return address
		ret				;
    	
; rea_kbd: reads keyboard and returns string in variable
rea_kbd	; initialize registers
		pop ix			; <<< pop return address
		pop hl			; <<< variable value, unused
		pop hl			; <<< variable address
    	ld e, (hl)		;
    	inc hl			;
    	ld d, (hl)		;
		push de			; >>> save initial position
		ld bc, 0		; character count

pre_loo	; read from keyboard
		ld hl, 0x5C08	; LASTKEY system variable

		; prepare cursor and lastkey
		ld a, 0x5F		; print underscore
		rst 16			;
		ld a, 8			; go back 1 character
		rst 16			;

		xor a			; A=0
		ld (hl), a		; reset LASTKEY, two birds with 1 stone

kbd_loo	; loop
		add a, (hl)		; load latest value of LASTKEY.
		jr z, kbd_loo        	; loop until a key is pressed.

		; detect delete
		cp 0x0C			;
		jr nz, rea_con		;

		; del action only if current length > 0
		ld hl, 0		; 
		sbc hl, bc		;
		jr z, pre_loo		;

		; delete action
		dec de			; -1 in position
		dec bc			; -1 in length
		ld a, 0x20		; 
		rst 16			;
		ld a, 8			; go back
		rst 16			;
		ld a, 8			; go back
		rst 16			;

		jr pre_loo

		; save pressed key and print
rea_con	; detect CR to exit
		cp 0x0D			; detect <cr>
		jr z, rea_exi	;ld (de), a		; save char in string
		
		inc de			; +1 position
		inc bc			; +1 length
		
		; check max length to exit
		;ld hl, str_max	; 
		;sbc hl, bc		;
		;jr z, rea_exi	;
		
		ld (de), a		; save character
		rst 16			; print it
		
		jr pre_loo

rea_exi	; exit
		ld a, c			; low BC byte, current length
		pop de			; <<< pop initial string address
		ld (de), a		; save string length
		
		ld a, 0x0D		; print <cr>
		rst 16			;
				
		push ix			; >>> push return address
		ret
				
; str2int: converts ascii digit strings to integer, no checks for non-numbers		
str2int	pop ix			; <<< pop return address
		pop de			; <<< pop length, unused
		pop de			; <<< pop address
		ld a, (de)		; string length
		inc de
		ld hl, 0		; reset total
		ld b, a			; counter

dig_loo	push bc			; >>> push counter
						; x10
		add hl, hl		; HL x2
		push hl			; >>> push HL x2
		add hl, hl		; HL x4
		add hl, hl		; HL x8
		pop bc			; <<< BC=HLx2
		add hl, bc		; HL x10

		ld a, (de)		; load character
		sub '0'			; make it decimal
		ld b, 0			; B(C)=0
		ld c, a			; (B)C= digit
		add hl, bc		; Total=  Total + digit
		inc de			; next digit
				
		pop bc			; <<< pop counter
		djnz dig_loo	; repeat for every digit

		push hl			; >>> push total
		push ix			; >>> push return address
		ret

; cls_rom: calls zx spectrum clearscreen routine
cls_rom	call 3503		; rom address for zx cls routine
		ret				;
; File: math.asc. Basic math library for Z80

; mul_16b: 16-bit multiplication (Stack(HL)=BCxDE)
mul_16b	pop ix					; 16-bit multiplication
        pop bc                  ; 
        pop de                  ;
        ld hl, 0                ;
	 	ld a, b                 ;
        ld b, 16                ;
mul_loo add hl ,hl              ;
        sla c                   ;
        rla                     ;
        jr nc, mul_nad          ;
        add hl, de              ;
mul_nad djnz mul_loo            ;
        push hl                 ;
        push ix					;
        ret						;
        
; div_16b: 16-bit division (stack(BC)= BC/DE, stack(HL)= remainder)              
div_16b	pop ix				; <<< retrun address
        pop de         		; <<< divisor
        pop bc				; <<< dividend
	
div_sig xor a            	; clear A before using it
		xor b            	; XOR most significant bit of dividend (bc) with divisor (de)
		xor d            	; now a non-zero result means different signs
		push af          	; >>> store sign flag (0 = positive, 1 = negative)
	
div_si1	bit 7, b			; check dividend sign
		jr z, div_si2		;
		ld hl, 0			;
		xor a				; 
		sbc hl, bc			; negate: HL= -BC
		push hl				; >>> push result
		pop bc				; <<< pop result

div_si2	bit 7, d			; check divisor sign
		jr z, div_pre		;
		ld hl, 0			;
		xor a				; 
		sbc hl, de			; negate: HL= -de
		push hl				; >>> push result
		pop de				; <<< pop result

div_pre	ld hl, 0			;
		ld a, b				;
		ld b, 8				; loop 8 times
	
div_lo1 rla					; division outer loop
		adc hl,	hl			;
		sbc hl,	de			;
		jr nc, div_na1		;
		add hl, de			;
div_na1 djnz div_lo1		;
		rla					;
		cpl					;
		ld b, a				;
		ld a, c				;
		ld c, b				;
		ld b, 8				;
div_lo2	rla					;
		adc hl, hl			;
		sbc hl, de			;
		jr nc, div_na2		;
		add hl, de			;
div_na2 djnz div_lo2		;
		rla					;
		cpl					;
		ld b, c				; result to bc
		ld c, a				;
	
		pop af				; <<< sign in A	
		bit 7, a			; 
		jr z, div_ski		; if Z, result +, skip
	
		ld hl, 0			; if sign in negative, negate result
		xor a				;
		sbc hl, bc			; negate: HL= -BC
		push hl				; >>> push result
		pop bc				; <<< pop result
	
div_ski	push hl				; >>> remainder
	push bc					; >>> quotient
	push ix					; >>> return address
	ret						;
		
; rnd_16b: 16-bit (not 0-1) pseudo-random number generator
; BC and stack= 16-bit random number
rnd_16b pop ix					;
		ld a, r            		; generate psuedo-random using R register content
		add a, a				;
		ld b, a            		;
		ld a, r            		;
		xor b					;
		ld c, a            		;
		push bc                 ; >>> push bogus address, unused")
		push bc                 ; >>> push value") 
		push ix					; >>> return address
		ret						;
    
    
; File: graph.asc. Basic graph library for ZX Spectrum

; dra_lin: draw a line in the screen
; from de = end1 (d = x-axis, e = y-axis)
; to   hl = end2 (h = x-axis, l = y-axis)
dra_lin	call plo_poi
	push hl

	; calculate hl = centre pixel
	ld a, l				; sum y coords
	add a, e			;	
	rra					; divide by 2
	ld l, a				; result to L
	ld a, h				; sum x coords
	add a, d			;
	rra					; divide by 2
	ld h, a				; result to H
						; DE= end1, HL = center

	; if de (end1) = hl (centre) then we're done
	or a				;
	sbc hl, de			; subtract
	jr z, exi_lin		; same point?
	add hl, de			; restore HL= middle point
	
	ex de, hl			; DE= center, HL= end1
	call dra_lin    	; first half
	ex (sp), hl			; DE= center, HL= end2, (SP)= end1
	ex de, hl			; second half
	call dra_lin    	; DE = end2, HL = center
	
	ex de,hl			; DE = center, HL = end2
	pop de				; DE = end1, HL = end1
	ret

exi_lin	pop hl			;
	ret					;

; plo_poi: plot point in screen
; D=x E=y
; target: 0 1 0 y7 y6 y2 y1 y0  |  y5 y4 y3 x7 x7 x5 x4 x3
plo_poi
	push hl				; save registers
	push de				;
	
	; skip every 2nd point (5B)
	;ld a, d			; mix X an Y
	;add a, e			;
	;rra				; check bit 0
	;jr nc, lincon
	
	; transpose y to quadrant 1
	ld a, 192			; screen height
	sub e				; Y' = screen height - Y
	ld e, a				; Y'

	; y2-y1-y0 (7B)
	ld a, e				; A= yyyyyyyy
	and %00000111   	; A= 00000yyy
	ld l, a				; L= 00000bbb
	
	or %01000000    	; A= 01000yyy
	ld h, a         	; H= 01000yyy
	
	; y7-y6 (8B)
	ld a, e         	; A= yyyyyyyy
	rrca            	; 
	rrca				;
	rrca				; A= 000yyyyy
	and %00011000   	; A= 000yy000
	or h            	; A= 010yyyyy
	ld h, a				; H= 010yyyyy
	
	; y5-y4-y3 (6B)
	ld a, e				; A= yyyyyyyy
	rlca            	; 
	rlca				; A= yyyyyy00
	and %11100000   	; A= yyy00000
	ld l, a				; A= yyy00000
	
	; x7-x6-x5-x4-x3 (8B)
	ld a, d				; A= xxxxxxxx
	rrca            	; 
	rrca				;
	rrca				; A= 000xxxxx 
	and %00011111  		; mask out bits, rrca takes carry
	or l            	; A= yyyxxxxx
	ld l, a          	; store in l
	
	; x2-x1-x0, find bit in byte via lookup (11B)
	ld a, d				; A= xxxxxbbb
	and %00000111		; A= 00000bbb
	
	ld de, pixlis		; point at bit list
	add a, e			; point at base + x 3-bit indicator
	ld e, a				;
	ld a, (de)			; read bit value
	or (hl)				; A= 000b0000 || screen
	ld (hl), a			; back to memory screen

lincon	pop de			; recover registers
	pop hl				;
	ret

pixlis					; pending: it might overflow if sitting at the end of a page.
defb %10000000
defb %01000000
defb %00100000
defb %00010000
defb %00001000
defb %00000100
defb %00000010
defb %00000001

; cle_scr: clear screen 
; unrolling code using a faster than regular method.
cle_scr	
	ld (stack + 1), sp  	; store current stack pointer
	ld hl, &0000           	; this value will be stored on stack
	ld sp, &4000 + &1800	; 16384 + 6144
	ld b, l            	; set B to 0. it causes that DJNZ will repeat 256 times

loop1	push hl             	; store HL on stack (2 bytes)
	push hl             	; 2B x 12 pushes
	push hl             	; 
	push hl			;
	push hl			;
	push hl			;
	push hl			;
	push hl			;
	push hl			;
	push hl			;
	push hl			;
	push hl			;
	djnz loop1          	; inner loop repeats 256 times

stack	ld sp, 0            	; 0  overwritten by first instruction
	ret

; Program code -----------------------------------------------





        ld hl, board_          ; (VariableDeclarator) array/matrix assignment
        inc hl                  ; skip dimensions
        inc hl                  ;

        ld de, 43                ; (Literal) literal int: * 43 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 19                ; (Literal) literal int: * 19 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 27                ; (Literal) literal int: * 27 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 59                ; (Literal) literal int: * 59 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 67                ; (Literal) literal int: * 67 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 27                ; (Literal) literal int: * 27 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 19                ; (Literal) literal int: * 19 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 43                ; (Literal) literal int: * 43 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 7                ; (Literal) literal int: * 7 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 7                ; (Literal) literal int: * 7 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 7                ; (Literal) literal int: * 7 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 7                ; (Literal) literal int: * 7 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 7                ; (Literal) literal int: * 7 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 7                ; (Literal) literal int: * 7 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 7                ; (Literal) literal int: * 7 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 7                ; (Literal) literal int: * 7 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 5                ; (Literal) literal int: * 5 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 5                ; (Literal) literal int: * 5 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 5                ; (Literal) literal int: * 5 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 5                ; (Literal) literal int: * 5 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 5                ; (Literal) literal int: * 5 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 5                ; (Literal) literal int: * 5 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 5                ; (Literal) literal int: * 5 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 5                ; (Literal) literal int: * 5 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 41                ; (Literal) literal int: * 41 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 17                ; (Literal) literal int: * 17 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 25                ; (Literal) literal int: * 25 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 57                ; (Literal) literal int: * 57 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 65                ; (Literal) literal int: * 65 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 25                ; (Literal) literal int: * 25 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 17                ; (Literal) literal int: * 17 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 41                ; (Literal) literal int: * 41 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

                                ; (VariableDeclarator) board_, end of...

        ld hl, vector_lists_          ; (VariableDeclarator) array/matrix assignment
        inc hl                  ; skip dimensions
        inc hl                  ;

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 16                ; (Literal) literal int: * 16 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 14                ; (Literal) literal int: * 14 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 31                ; (Literal) literal int: * 31 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 18                ; (Literal) literal int: * 18 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 33                ; (Literal) literal int: * 33 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 16                ; (Literal) literal int: * 16 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 15                ; (Literal) literal int: * 15 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 17                ; (Literal) literal int: * 17 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

                                ; (VariableDeclarator) vector_lists_, end of...

                                ; (VariableDeclarator) * = * string array
        ld de, im_dkey_         ; * dkey_ *
        ld hl, dkey_            ;
        ld (hl), e              ; immutable address to pointer variable
        inc hl                  ;
        ld (hl), d              ;

                                ; (VariableDeclarator) * best_score_ *
                                ; (Identifier) variable * best_score_ *
        ld hl, best_score_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (best_score_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

                                ; (VariableDeclarator) * user_move_length_ *
                                ; (Identifier) variable * user_move_length_ *
        ld hl, user_move_length_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (user_move_length_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

                                ; (VariableDeclarator) * source_sq_ *
                                ; (Identifier) variable * source_sq_ *
        ld hl, source_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (source_sq_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

                                ; (VariableDeclarator) * target_sq_ *
                                ; (Identifier) variable * target_sq_ *
        ld hl, target_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

                                ; (VariableDeclarator) * keyd_ *
                                ; (Identifier) variable * keyd_ *
        ld hl, keyd_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (keyd_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

                                ; (VariableDeclarator) * file_ *
                                ; (Identifier) variable * file_ *
        ld hl, file_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (file_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

                                ; (VariableDeclarator) * rank_ *
                                ; (Identifier) variable * rank_ *
        ld hl, rank_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (rank_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

; (FunctionDeclaration) Function: parseSquare_
parseSquare_                        ; (FunctionDeclaration) *** parseSquare_ ***
                                ; save return address
        ld hl, sta_ck2          ; needed in recursion cases
        ld e, (hl)              ; address pointed in DE
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; de= sta_ck2, hl= stack pointer
        pop bc                  ; <<< pop return address
        ld (hl), c              ;
        inc hl                  ;
        ld (hl), b              ;
        ld hl, sta_ck2          ;
        inc (hl)                ;
        inc (hl)                ; end of return address preps

                                ; (FunctionDeclaration) collect arguments
        ld hl, char_file_            ; argument *** char_file_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

        ld hl, char_rank_            ; argument *** char_rank_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

                                ; (FunctionDeclaration) function body
                                ; (Identifier) variable * file_ *
        ld hl, file_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (file_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * char_file_ *
        ld hl, char_file_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (char_file_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 97                ; (Literal) literal int: * 97 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * - * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        xor a                    ;
        sbc hl, bc              ; (BinaryExpression) 16-bit subtraction
        push hl                 ; >>> bogus record address, unused
        push hl                 ; >>> record value
                                ; (BinaryExpression) end of...

                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Identifier) variable * rank_ *
        ld hl, rank_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (rank_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 7                ; (Literal) literal int: * 7 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * char_rank_ *
        ld hl, char_rank_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (char_rank_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 49                ; (Literal) literal int: * 49 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * - * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        xor a                    ;
        sbc hl, bc              ; (BinaryExpression) 16-bit subtraction
        push hl                 ; >>> bogus record address, unused
        push hl                 ; >>> record value
                                ; (BinaryExpression) end of...

                                ; (BinaryExpression) * - * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        xor a                    ;
        sbc hl, bc              ; (BinaryExpression) 16-bit subtraction
        push hl                 ; >>> bogus record address, unused
        push hl                 ; >>> record value
                                ; (BinaryExpression) end of...

                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (ReturnStatement) return expression
                                ; (Identifier) variable * rank_ *
        ld hl, rank_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (rank_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 16                ; (Literal) literal int: * 16 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * * * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        push hl                 ; >>> operand left
        push bc                 ; >>> operand right
        call mul_16b            ; (BinaryExpression) 16-bit multiplication
        pop hl                  ; <<< pop result
        push hl                 ; >>> bogus record address, unused
        push hl                 ; >>> record value
                                ; (BinaryExpression) end of...

                                ; (Identifier) variable * file_ *
        ld hl, file_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (file_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (BinaryExpression) * + * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        add hl, bc              ; (BinaryExpression) 16-bit addition
        push hl                 ; >>> bogus record address, unused
        push hl                 ; >>> record value
                                ; (BinaryExpression) end of...


                                ; (ReturnStatement) restore return address
        ld hl, sta_ck2          ; update stack2 pointer
        ld e, (hl)              ; pick stack pointer
        inc hl                  ; update pointer
        ld d, (hl)              ; pick stack pointer
        ex de, hl               ; de= sta_ck2, hl= stack pointer
        dec hl                  ;
        ld b, (hl)              ; get return address from stack
        dec hl                  ;
        ld c, (hl)              ;
        push bc                 ; >>> push return address
        ld hl, sta_ck2          ;
        dec (hl)                ;
        dec (hl)                ;
        ret                     ; return from function

fst_001                         ; (FunctionDeclaration) recover return address (general)
        ld hl, sta_ck2          ; update stack2 pointer
        ld e, (hl)              ; pick stack pointer
        inc hl                  ; update pointer
        ld d, (hl)              ; pick stack pointer
        ex de, hl               ; de= sta_ck2, hl= stack pointer
        dec hl                  ;
        ld b, (hl)              ; get return address from stack
        dec hl                  ;
        ld c, (hl)              ;
        push bc                 ; >>> push return address
        ld hl, sta_ck2          ;
        dec (hl)                ;
        dec (hl)                ; end of return address restore
fex_000 ret                     ; (FunctionDeclaration) end of...


; (FunctionDeclaration) Function: renderBoard_
renderBoard_                        ; (FunctionDeclaration) *** renderBoard_ ***
                                ; save return address
        ld hl, sta_ck2          ; needed in recursion cases
        ld e, (hl)              ; address pointed in DE
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; de= sta_ck2, hl= stack pointer
        pop bc                  ; <<< pop return address
        ld (hl), c              ;
        inc hl                  ;
        ld (hl), b              ;
        ld hl, sta_ck2          ;
        inc (hl)                ;
        inc (hl)                ; end of return address preps

                                ; (FunctionDeclaration) collect arguments
                                ; (FunctionDeclaration) function body
                                ; (VariableDeclarator) * dark_ *
                                ; (Identifier) variable * dark_ *
        ld hl, dark_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (dark_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

                                ; (VariableDeclarator) * piece_ *
                                ; (Identifier) variable * piece_ *
        ld hl, piece_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (piece_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

                                ; (VariableDeclarator) * sq_ *
                                ; (Identifier) variable * sq_ *
        ld hl, sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (sq_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

        call cls_rom            ; (CallExpression) clear screen

                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * sq_ *
        ld hl, sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (sq_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

for_003                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * sq_ *
        ld hl, sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (sq_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 128                ; (Literal) literal int: * 128 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * < * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: <
        ld de, 0                ; assume condition=false
        xor a                   ;
        sbc hl, bc              ;
        jp nc, les_006          ; if >=, false -> change
        inc e                   ; condition=true
les_006 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_004           ;

                                ; (ForStatement) 3. body -------------
                                ; (IfStatement) ***expression==0*** test
                                ; (Identifier) variable * sq_ *
        ld hl, sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (sq_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 8                ; (Literal) literal int: * 8 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * & * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld a, h                 ; MSB
        and b                   ;
        ld d, a                 ;
        ld a, l                 ; LSB
        and c                   ;
        ld e, a                 ;
        push de                 ; >>> bogus record address, unused
        push de                 ; >>> record value
                                ; (BinaryExpression) end of...

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * == * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_009           ; if =, true -> skip change
        dec e                   ; condition=false
equ_009 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_007           ;
                                ; (Identifier) variable * piece_ *
        ld hl, piece_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (piece_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * pieces_ *
        ld hl, pieces_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (pieces_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * sq_ *
        ld hl, sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (MemberExpression) dictionary access
        pop hl                  ; <<< pop value to search
        pop de                  ; <<< pop value address, unused
        pop de                  ; <<< pop dictionary size
        ld b, e                 ; count through the dictionary, DE is free
        pop ix                  ; <<< pop dictionary address

dic_010 inc ix                  ; skip size
        inc ix                  ;
        ld e, (ix+0)            ; read key, byte 1, from dictionary
        ld d, (ix+1)            ; read key, byte 2
        inc ix                  ; skip key, byte 2
        inc ix                  ; skip value
        xor a                   ;
        push hl                 ; >>> value to search
        sbc hl, de              ; compare search value with key
        pop hl                  ; <<< pop value to search
        jr z, dfo_011           ;
        djnz dic_010            ;

        ld de, 0                ; if not found, value= 0
        ld bc, 0                ; if not found, address= 0
        push bc                 ; >>> push value address
        push de                 ; >>> push value
        jr dex_012              ; skip match

dfo_011 ld e, (ix+0)            ; read value, byte 1, from dictionary
        ld d, (ix+1)            ; read value, byte 2
        push ix                 ; >>> push value address
        push de                 ; >>> push value 
dex_012                         ; (MemberExpression) exit dictionary access

                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Identifier) variable * dark_ *
        ld hl, dark_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (dark_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (AssignmentExpression) * ^= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        ld a, h                 ; MSB
        xor b                   ;
        ld d, a                 ;
        ld a, l                 ; LSB
        xor c                   ;
        ld e, a                 ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

        ld de, 19                ; (Literal) literal int: * 19 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_chr            ; (CallExpression) print char

                                ; (Identifier) variable * dark_ *
        ld hl, dark_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (dark_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_chr            ; (CallExpression) print char

                                ; (Identifier) variable * piece_ *
        ld hl, piece_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (piece_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_chr            ; (CallExpression) print char


        jp ski_008              ; (IfStatement) ***expression==0*** skips else
els_007                         ; else

        ld de, 13                ; (Literal) literal int: * 13 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_chr            ; (CallExpression) print char


                                ; (Identifier) variable * dark_ *
        ld hl, dark_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (dark_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (AssignmentExpression) * ^= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        ld a, h                 ; MSB
        xor b                   ;
        ld d, a                 ;
        ld a, l                 ; LSB
        xor c                   ;
        ld e, a                 ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Identifier) variable * sq_ *
        ld hl, sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (sq_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 7                ; (Literal) literal int: * 7 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (AssignmentExpression) * += * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        add hl, bc              ; HL has the result
        ex de, hl               ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

ski_008                         ; (IfStatement) ***expression==0*** end of...

fup_005                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * sq_ *
        ld hl, sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_003
fex_004                         ; (ForStatement) end of...

fst_013                         ; (FunctionDeclaration) recover return address (general)
        ld hl, sta_ck2          ; update stack2 pointer
        ld e, (hl)              ; pick stack pointer
        inc hl                  ; update pointer
        ld d, (hl)              ; pick stack pointer
        ex de, hl               ; de= sta_ck2, hl= stack pointer
        dec hl                  ;
        ld b, (hl)              ; get return address from stack
        dec hl                  ;
        ld c, (hl)              ;
        push bc                 ; >>> push return address
        ld hl, sta_ck2          ;
        dec (hl)                ;
        dec (hl)                ; end of return address restore
fex_002 ret                     ; (FunctionDeclaration) end of...


; (FunctionDeclaration) Function: userInput_
userInput_                        ; (FunctionDeclaration) *** userInput_ ***
                                ; save return address
        ld hl, sta_ck2          ; needed in recursion cases
        ld e, (hl)              ; address pointed in DE
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; de= sta_ck2, hl= stack pointer
        pop bc                  ; <<< pop return address
        ld (hl), c              ;
        inc hl                  ;
        ld (hl), b              ;
        ld hl, sta_ck2          ;
        inc (hl)                ;
        inc (hl)                ; end of return address preps

                                ; (FunctionDeclaration) collect arguments
        ld hl, key_            ; argument *** key_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

                                ; (FunctionDeclaration) function body
                                ; (AssignmentExpression) * = * value to array assignment
                                ; (Identifier) variable * key_ *
        ld hl, key_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (key_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * user_move_ *
        ld hl, user_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (user_move_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * user_move_length_ *
        ld hl, user_move_length_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (user_move_length_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        pop bc                  ; <<< pop right array value, unused
        pop hl                  ; <<< pop right array address
        pop de                  ; <<< pop right array value
        pop bc                  ; <<< pop right array address, unused
        ld (hl), e              ; write LSB
        inc hl                  ; next
        ld (hl), d              ; write MSB
        inc hl                  ; next


                                ; (Identifier) variable * user_move_length_ *
        ld hl, user_move_length_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (user_move_length_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

                                ; (Identifier) variable * key_ *
        ld hl, key_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (key_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_chr            ; (CallExpression) print char


                                ; (IfStatement) ***expression==4*** test
                                ; (Identifier) variable * user_move_length_ *
        ld hl, user_move_length_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (user_move_length_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 4                ; (Literal) literal int: * 4 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * == * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_017           ; if =, true -> skip change
        dec e                   ; condition=false
equ_017 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_015           ;
                                ; (Identifier) variable * user_move_length_ *
        ld hl, user_move_length_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (user_move_length_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Identifier) variable * source_sq_ *
        ld hl, source_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (source_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (CallExpression): regular call prep ***parseSquare_***

                                ; (Identifier) variable * user_move_ *
        ld hl, user_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (user_move_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (Identifier) variable * user_move_ *
        ld hl, user_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (user_move_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        call parseSquare_            ; (CallExpression): call ***parseSquare_***

                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Identifier) variable * target_sq_ *
        ld hl, target_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (CallExpression): regular call prep ***parseSquare_***

                                ; (Identifier) variable * user_move_ *
        ld hl, user_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (user_move_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 3                ; (Literal) literal int: * 3 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (Identifier) variable * user_move_ *
        ld hl, user_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (user_move_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        call parseSquare_            ; (CallExpression): call ***parseSquare_***

                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (IfStatement) ***expression==expression*** test
                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * target_sq_ *
        ld hl, target_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (Identifier) constant * bK_ *
        ld hl, bK_            ; variable content
        push hl                 ; >>> push variable address (bogus)
        push hl                 ; >>> push variable content

                                ; (BinaryExpression) * == * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_020           ; if =, true -> skip change
        dec e                   ; condition=false
equ_020 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_018           ;
                                ; (Literal) * 'Mated!' *
        ld hl, stn_021          ; literal string address
        ld de, 6                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        ld hl, keydown_activation           ; (CallExpression) keydown deactivate feature
        ld (hl), 0              ; A=0



                                ; (ReturnStatement) return expression

                                ; (ReturnStatement) restore return address
        ld hl, sta_ck2          ; update stack2 pointer
        ld e, (hl)              ; pick stack pointer
        inc hl                  ; update pointer
        ld d, (hl)              ; pick stack pointer
        ex de, hl               ; de= sta_ck2, hl= stack pointer
        dec hl                  ;
        ld b, (hl)              ; get return address from stack
        dec hl                  ;
        ld c, (hl)              ;
        push bc                 ; >>> push return address
        ld hl, sta_ck2          ;
        dec (hl)                ;
        dec (hl)                ;
        ret                     ; return from function

        jp ski_019              ; (IfStatement) ***expression==expression*** skips else
els_018                         ; else

                                ; (AssignmentExpression) * = * value to array assignment
                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * source_sq_ *
        ld hl, source_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (source_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * target_sq_ *
        ld hl, target_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        pop bc                  ; <<< pop right array value, unused
        pop hl                  ; <<< pop right array address
        pop de                  ; <<< pop right array value
        pop bc                  ; <<< pop right array address, unused
        ld (hl), e              ; write LSB
        inc hl                  ; next
        ld (hl), d              ; write MSB
        inc hl                  ; next


                                ; (AssignmentExpression) * = * value to array assignment
        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * source_sq_ *
        ld hl, source_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (source_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        pop bc                  ; <<< pop right array value, unused
        pop hl                  ; <<< pop right array address
        pop de                  ; <<< pop right array value
        pop bc                  ; <<< pop right array address, unused
        ld (hl), e              ; write LSB
        inc hl                  ; next
        ld (hl), d              ; write MSB
        inc hl                  ; next


                                ; (CallExpression): regular call prep ***renderBoard_***

        call renderBoard_            ; (CallExpression): call ***renderBoard_***

                                ; (CallExpression): regular call prep ***search_***

        call search_            ; (CallExpression): call ***search_***

ski_019                         ; (IfStatement) ***expression==expression*** end of...

        jp ski_016              ; (IfStatement) ***expression==4*** skips else
els_015                         ; else

ski_016                         ; (IfStatement) ***expression==4*** end of...

fst_022                         ; (FunctionDeclaration) recover return address (general)
        ld hl, sta_ck2          ; update stack2 pointer
        ld e, (hl)              ; pick stack pointer
        inc hl                  ; update pointer
        ld d, (hl)              ; pick stack pointer
        ex de, hl               ; de= sta_ck2, hl= stack pointer
        dec hl                  ;
        ld b, (hl)              ; get return address from stack
        dec hl                  ;
        ld c, (hl)              ;
        push bc                 ; >>> push return address
        ld hl, sta_ck2          ;
        dec (hl)                ;
        dec (hl)                ; end of return address restore
fex_014 ret                     ; (FunctionDeclaration) end of...


; (FunctionDeclaration) Function: search_
search_                        ; (FunctionDeclaration) *** search_ ***
                                ; save return address
        ld hl, sta_ck2          ; needed in recursion cases
        ld e, (hl)              ; address pointed in DE
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; de= sta_ck2, hl= stack pointer
        pop bc                  ; <<< pop return address
        ld (hl), c              ;
        inc hl                  ;
        ld (hl), b              ;
        ld hl, sta_ck2          ;
        inc (hl)                ;
        inc (hl)                ; end of return address preps

                                ; (FunctionDeclaration) collect arguments
                                ; (FunctionDeclaration) function body
                                ; (Identifier) variable * best_score_ *
        ld hl, best_score_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (best_score_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (AssignmentExpression) * = * value to array assignment
        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * best_move_ *
        ld hl, best_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (best_move_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        pop bc                  ; <<< pop right array value, unused
        pop hl                  ; <<< pop right array address
        pop de                  ; <<< pop right array value
        pop bc                  ; <<< pop right array address, unused
        ld (hl), e              ; write LSB
        inc hl                  ; next
        ld (hl), d              ; write MSB
        inc hl                  ; next


                                ; (AssignmentExpression) * = * value to array assignment
        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * best_move_ *
        ld hl, best_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (best_move_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        pop bc                  ; <<< pop right array value, unused
        pop hl                  ; <<< pop right array address
        pop de                  ; <<< pop right array value
        pop bc                  ; <<< pop right array address, unused
        ld (hl), e              ; write LSB
        inc hl                  ; next
        ld (hl), d              ; write MSB
        inc hl                  ; next


                                ; (VariableDeclarator) * vector_pointer_ *
                                ; (Identifier) variable * vector_pointer_ *
        ld hl, vector_pointer_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_pointer_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

                                ; (VariableDeclarator) * spiece_ *
                                ; (Identifier) variable * spiece_ *
        ld hl, spiece_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (spiece_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

                                ; (VariableDeclarator) * number_of_moves_ *
                                ; (Identifier) variable * number_of_moves_ *
        ld hl, number_of_moves_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (number_of_moves_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

                                ; (Identifier) variable * attacks_ *
        ld hl, attacks_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (attacks_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (CallExpression) Array *** fill ***
        pop hl                  ; <<< pop array content, unused
        pop hl                  ; <<< pop array address

        ld b, (hl)              ; prepare counter
        inc hl                  ; skip header
        inc hl                  ; skip header
flo_024 ld (hl), 0              ; prepare counter
        inc hl                  ; skip header
        djnz flo_024            ; loop 

                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * source_sq_ *
        ld hl, source_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (source_sq_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

for_025                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * source_sq_ *
        ld hl, source_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (source_sq_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 128                ; (Literal) literal int: * 128 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * < * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: <
        ld de, 0                ; assume condition=false
        xor a                   ;
        sbc hl, bc              ;
        jp nc, les_028          ; if >=, false -> change
        inc e                   ; condition=true
les_028 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_026           ;

                                ; (ForStatement) 3. body -------------
                                ; (IfStatement) ***expression==0*** test
                                ; (Identifier) variable * source_sq_ *
        ld hl, source_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (source_sq_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 8                ; (Literal) literal int: * 8 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * & * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld a, h                 ; MSB
        and b                   ;
        ld d, a                 ;
        ld a, l                 ; LSB
        and c                   ;
        ld e, a                 ;
        push de                 ; >>> bogus record address, unused
        push de                 ; >>> record value
                                ; (BinaryExpression) end of...

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * == * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_031           ; if =, true -> skip change
        dec e                   ; condition=false
equ_031 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_029           ;
                                ; (Identifier) variable * spiece_ *
        ld hl, spiece_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (spiece_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * source_sq_ *
        ld hl, source_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (source_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (IfStatement) ***expressionexpression*** test
                                ; (Identifier) variable * spiece_ *
        ld hl, spiece_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (spiece_)          ; variable content
        push hl                 ; >>> push variable content

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_032           ;
                                ; (Identifier) variable * vector_pointer_ *
        ld hl, vector_pointer_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_pointer_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * vector_pointers_ *
        ld hl, vector_pointers_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_pointers_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * spiece_ *
        ld hl, spiece_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (spiece_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 130                ; (Literal) literal int: * 130 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * | * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld a, h                 ; MSB
        or b                    ;
        ld d, a                 ;
        ld a, l                 ; LSB
        or c                    ;
        ld e, a                 ;
        push de                 ; >>> bogus record address, unused
        push de                 ; >>> record value
                                ; (BinaryExpression) end of...

                                ; (MemberExpression) dictionary access
        pop hl                  ; <<< pop value to search
        pop de                  ; <<< pop value address, unused
        pop de                  ; <<< pop dictionary size
        ld b, e                 ; count through the dictionary, DE is free
        pop ix                  ; <<< pop dictionary address

dic_034 inc ix                  ; skip size
        inc ix                  ;
        ld e, (ix+0)            ; read key, byte 1, from dictionary
        ld d, (ix+1)            ; read key, byte 2
        inc ix                  ; skip key, byte 2
        inc ix                  ; skip value
        xor a                   ;
        push hl                 ; >>> value to search
        sbc hl, de              ; compare search value with key
        pop hl                  ; <<< pop value to search
        jr z, dfo_035           ;
        djnz dic_034            ;

        ld de, 0                ; if not found, value= 0
        ld bc, 0                ; if not found, address= 0
        push bc                 ; >>> push value address
        push de                 ; >>> push value
        jr dex_036              ; skip match

dfo_035 ld e, (ix+0)            ; read value, byte 1, from dictionary
        ld d, (ix+1)            ; read value, byte 2
        push ix                 ; >>> push value address
        push de                 ; >>> push value 
dex_036                         ; (MemberExpression) exit dictionary access

                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Identifier) variable * vector_pointer_ *
        ld hl, vector_pointer_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_pointer_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 241                ; (Literal) literal int: * 241 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (AssignmentExpression) * -= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        sbc hl, bc              ; HL has the result
        ex de, hl               ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (VariableDeclarator) * vector_offset_ *
                                ; (Identifier) variable * vector_offset_ *
        ld hl, vector_offset_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_offset_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

                                ; (VariableDeclarator) * direction_ *
                                ; (Identifier) variable * direction_ *
        ld hl, direction_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (direction_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

                                ; (VariableDeclarator) * offset_count_ *
                                ; (Identifier) variable * offset_count_ *
        ld hl, offset_count_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (offset_count_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

whi_037                         ; (WhileStatement) 1. test
                                ; (Identifier) variable * vector_offset_ *
        ld hl, vector_offset_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_offset_)          ; variable content
        push hl                 ; >>> push variable content

        pop de                  ; (WhileStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not true
        jp z, whx_038           ; exit while

                                ; (WhileStatement) 2. body
                                ; (Identifier) variable * vector_offset_ *
        ld hl, vector_offset_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_offset_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * vector_lists_ *
        ld hl, vector_lists_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_lists_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * vector_pointer_ *
        ld hl, vector_pointer_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_pointer_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (Identifier) variable * direction_ *
        ld hl, direction_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (direction_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (BinaryExpression) * * * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        push hl                 ; >>> operand left
        push bc                 ; >>> operand right
        call mul_16b            ; (BinaryExpression) 16-bit multiplication
        pop hl                  ; <<< pop result
        push hl                 ; >>> bogus record address, unused
        push hl                 ; >>> record value
                                ; (BinaryExpression) end of...

                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (IfStatement) ***expression==0*** test
                                ; (Identifier) variable * vector_offset_ *
        ld hl, vector_offset_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_offset_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * == * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_042           ; if =, true -> skip change
        dec e                   ; condition=false
equ_042 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_040           ;
        jp whx_038              ; (BreakStatement)

        jp ski_041              ; (IfStatement) ***expression==0*** skips else
els_040                         ; else

ski_041                         ; (IfStatement) ***expression==0*** end of...

                                ; (Identifier) variable * target_sq_ *
        ld hl, target_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * source_sq_ *
        ld hl, source_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (source_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

whi_043                         ; (WhileStatement) 1. test
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        pop de                  ; (WhileStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not true
        jp z, whx_044           ; exit while

                                ; (WhileStatement) 2. body
                                ; (Identifier) variable * target_sq_ *
        ld hl, target_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * vector_offset_ *
        ld hl, vector_offset_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_offset_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (AssignmentExpression) * += * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        add hl, bc              ; HL has the result
        ex de, hl               ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (IfStatement) ***expression&0x88*** test
                                ; (Identifier) variable * target_sq_ *
        ld hl, target_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 136                ; (Literal) literal int: * 136 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * & * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld a, h                 ; MSB
        and b                   ;
        ld d, a                 ;
        ld a, l                 ; LSB
        and c                   ;
        ld e, a                 ;
        push de                 ; >>> bogus record address, unused
        push de                 ; >>> record value
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_046           ;
        jp whx_044              ; (BreakStatement)

        jp ski_047              ; (IfStatement) ***expression&0x88*** skips else
els_046                         ; else

ski_047                         ; (IfStatement) ***expression&0x88*** end of...

                                ; (IfStatement) ***expression&&expression*** test
                                ; (Identifier) variable * direction_ *
        ld hl, direction_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (direction_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * > * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: >
        ld de, 0                ; assume condition=false
        xor a                   ;
        sbc hl, bc              ;
        jp m, mor_051           ; if <, false -> change
        jp z, mor_051           ; if =, false -> change
        inc e                   ; condition=true
mor_051 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

                                ; (Identifier) variable * spiece_ *
        ld hl, spiece_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (spiece_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) constant * wP_ *
        ld hl, wP_            ; variable content
        push hl                 ; >>> push variable address (bogus)
        push hl                 ; >>> push variable content

                                ; (BinaryExpression) * == * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_052           ; if =, true -> skip change
        dec e                   ; condition=false
equ_052 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

                                ; (LogicalExpression) logical * && *

        pop hl                  ; <<< pop left evaluation
        pop de                  ; <<< pop left address, unused
        pop bc                  ; <<< pop right evaluation
        pop de                  ; <<< pop right address, unused
        ld de, 0                ; (LogicalExpression) assume condition is false
        ld a, h                 ; test 16-bit register = 0
        or l                    ;
        jr z, lex_050           ; MSB not fulfiling
        ld a, b                 ; test 16-bit register = 0
        or c                    ;
        jr z, lex_050           ; LSB not fulfiling
        inc de                  ; condition is true
lex_050 push de                 ; >>> push result
        push de                 ; >>> push result


        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_048           ;
        jp whx_044              ; (BreakStatement)

        jp ski_049              ; (IfStatement) ***expression&&expression*** skips else
els_048                         ; else

ski_049                         ; (IfStatement) ***expression&&expression*** end of...

                                ; (IfStatement) ***expression&&expression*** test
                                ; (Identifier) variable * direction_ *
        ld hl, direction_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (direction_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * < * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: <
        ld de, 0                ; assume condition=false
        xor a                   ;
        sbc hl, bc              ;
        jp nc, les_056          ; if >=, false -> change
        inc e                   ; condition=true
les_056 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

                                ; (Identifier) variable * spiece_ *
        ld hl, spiece_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (spiece_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) constant * bP_ *
        ld hl, bP_            ; variable content
        push hl                 ; >>> push variable address (bogus)
        push hl                 ; >>> push variable content

                                ; (BinaryExpression) * == * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_057           ; if =, true -> skip change
        dec e                   ; condition=false
equ_057 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

                                ; (LogicalExpression) logical * && *

        pop hl                  ; <<< pop left evaluation
        pop de                  ; <<< pop left address, unused
        pop bc                  ; <<< pop right evaluation
        pop de                  ; <<< pop right address, unused
        ld de, 0                ; (LogicalExpression) assume condition is false
        ld a, h                 ; test 16-bit register = 0
        or l                    ;
        jr z, lex_055           ; MSB not fulfiling
        ld a, b                 ; test 16-bit register = 0
        or c                    ;
        jr z, lex_055           ; LSB not fulfiling
        inc de                  ; condition is true
lex_055 push de                 ; >>> push result
        push de                 ; >>> push result


        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_053           ;
        jp whx_044              ; (BreakStatement)

        jp ski_054              ; (IfStatement) ***expression&&expression*** skips else
els_053                         ; else

ski_054                         ; (IfStatement) ***expression&&expression*** end of...

                                ; (IfStatement) ***expression&0x02*** test
                                ; (Identifier) variable * spiece_ *
        ld hl, spiece_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (spiece_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * & * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld a, h                 ; MSB
        and b                   ;
        ld d, a                 ;
        ld a, l                 ; LSB
        and c                   ;
        ld e, a                 ;
        push de                 ; >>> bogus record address, unused
        push de                 ; >>> record value
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_058           ;
                                ; (IfStatement) ***expression&0x02*** test
                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * target_sq_ *
        ld hl, target_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * & * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld a, h                 ; MSB
        and b                   ;
        ld d, a                 ;
        ld a, l                 ; LSB
        and c                   ;
        ld e, a                 ;
        push de                 ; >>> bogus record address, unused
        push de                 ; >>> record value
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_060           ;
        jp whx_044              ; (BreakStatement)

        jp ski_061              ; (IfStatement) ***expression&0x02*** skips else
els_060                         ; else

ski_061                         ; (IfStatement) ***expression&0x02*** end of...

                                ; (IfStatement) ***expression&0x04*** test
                                ; (Identifier) variable * spiece_ *
        ld hl, spiece_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (spiece_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 4                ; (Literal) literal int: * 4 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * & * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld a, h                 ; MSB
        and b                   ;
        ld d, a                 ;
        ld a, l                 ; LSB
        and c                   ;
        ld e, a                 ;
        push de                 ; >>> bogus record address, unused
        push de                 ; >>> record value
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_062           ;
                                ; (IfStatement) ***expression!=0*** test
                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * target_sq_ *
        ld hl, target_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (Identifier) variable * vector_offset_ *
        ld hl, vector_offset_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_offset_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (BinaryExpression) * + * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        add hl, bc              ; (BinaryExpression) 16-bit addition
        push hl                 ; >>> bogus record address, unused
        push hl                 ; >>> record value
                                ; (BinaryExpression) end of...

        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * % * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        push hl                 ; >>> operand left
        push bc                 ; >>> operand right
        call div_16b            ; (BinaryExpression) 16-bit division
        pop de                  ; <<< pop result, not used
        pop hl                  ; <<< pop remainder
        push hl                 ; >>> bogus record address, unused
        push hl                 ; >>> record value
                                ; (BinaryExpression) end of...

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * != * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: !=
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp nz, neq_066           ; if !=, true -> skip change
        dec e                   ; condition=false
neq_066 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_064           ;
        jp whx_044              ; (BreakStatement)

        jp ski_065              ; (IfStatement) ***expression!=0*** skips else
els_064                         ; else

ski_065                         ; (IfStatement) ***expression!=0*** end of...

        jp ski_063              ; (IfStatement) ***expression&0x04*** skips else
els_062                         ; else

ski_063                         ; (IfStatement) ***expression&0x04*** end of...



                                ; (Identifier) variable * number_of_moves_ *
        ld hl, number_of_moves_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (number_of_moves_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

                                ; (Literal) * 'Move #' *
        ld hl, stn_067          ; literal string address
        ld de, 6                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * number_of_moves_ *
        ld hl, number_of_moves_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (number_of_moves_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

                                ; (Literal) * ': ' *
        ld hl, stn_068          ; literal string address
        ld de, 2                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * source_sq_ *
        ld hl, source_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (source_sq_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

                                ; (Literal) * ', ' *
        ld hl, stn_069          ; literal string address
        ld de, 2                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * target_sq_ *
        ld hl, target_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (IfStatement) ***expression==1*** test
                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * target_sq_ *
        ld hl, target_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        ld de, 3                ; (Literal) literal int: * 3 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * & * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld a, h                 ; MSB
        and b                   ;
        ld d, a                 ;
        ld a, l                 ; LSB
        and c                   ;
        ld e, a                 ;
        push de                 ; >>> bogus record address, unused
        push de                 ; >>> record value
                                ; (BinaryExpression) end of...

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * == * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_072           ; if =, true -> skip change
        dec e                   ; condition=false
equ_072 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_070           ;
        jp whx_044              ; (BreakStatement)

        jp ski_071              ; (IfStatement) ***expression==1*** skips else
els_070                         ; else

ski_071                         ; (IfStatement) ***expression==1*** end of...

        jp ski_059              ; (IfStatement) ***expression&0x02*** skips else
els_058                         ; else

                                ; (IfStatement) ***expression==expression*** test
                                ; (Identifier) variable * spiece_ *
        ld hl, spiece_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (spiece_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * vector_offset_ *
        ld hl, vector_offset_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_offset_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (BinaryExpression) * + * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        add hl, bc              ; (BinaryExpression) 16-bit addition
        push hl                 ; >>> bogus record address, unused
        push hl                 ; >>> record value
                                ; (BinaryExpression) end of...

                                ; (Identifier) constant * wP_ *
        ld hl, wP_            ; variable content
        push hl                 ; >>> push variable address (bogus)
        push hl                 ; >>> push variable content

        ld de, 16                ; (Literal) literal int: * 16 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * - * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        xor a                    ;
        sbc hl, bc              ; (BinaryExpression) 16-bit subtraction
        push hl                 ; >>> bogus record address, unused
        push hl                 ; >>> record value
                                ; (BinaryExpression) end of...

                                ; (BinaryExpression) * == * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_075           ; if =, true -> skip change
        dec e                   ; condition=false
equ_075 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_073           ;
        jp whx_044              ; (BreakStatement)

        jp ski_074              ; (IfStatement) ***expression==expression*** skips else
els_073                         ; else

ski_074                         ; (IfStatement) ***expression==expression*** end of...

                                ; (AssignmentExpression) * = * value to array assignment
        ld de, 128                ; (Literal) literal int: * 128 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * attacks_ *
        ld hl, attacks_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (attacks_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * target_sq_ *
        ld hl, target_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        pop bc                  ; <<< pop right array value, unused
        pop hl                  ; <<< pop right array address
        pop de                  ; <<< pop right array value
        pop bc                  ; <<< pop right array address, unused
        ld (hl), e              ; write LSB
        inc hl                  ; next
        ld (hl), d              ; write MSB
        inc hl                  ; next


                                ; (IfStatement) ***expressionexpression*** test
                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * target_sq_ *
        ld hl, target_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_076           ;
        jp whx_044              ; (BreakStatement)

        jp ski_077              ; (IfStatement) ***expressionexpression*** skips else
els_076                         ; else

ski_077                         ; (IfStatement) ***expressionexpression*** end of...

ski_059                         ; (IfStatement) ***expression&0x02*** end of...

                                ; (IfStatement) ***expression&0x08*** test
                                ; (Identifier) variable * spiece_ *
        ld hl, spiece_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (spiece_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 8                ; (Literal) literal int: * 8 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * & * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld a, h                 ; MSB
        and b                   ;
        ld d, a                 ;
        ld a, l                 ; LSB
        and c                   ;
        ld e, a                 ;
        push de                 ; >>> bogus record address, unused
        push de                 ; >>> record value
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_078           ;
        jp wup_045              ; (ContinueStatement)

        jp ski_079              ; (IfStatement) ***expression&0x08*** skips else
els_078                         ; else

                                ; (IfStatement) ***expression==expression*** test
                                ; (Identifier) variable * target_sq_ *
        ld hl, target_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 112                ; (Literal) literal int: * 112 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * & * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld a, h                 ; MSB
        and b                   ;
        ld d, a                 ;
        ld a, l                 ; LSB
        and c                   ;
        ld e, a                 ;
        push de                 ; >>> bogus record address, unused
        push de                 ; >>> record value
                                ; (BinaryExpression) end of...

                                ; (Identifier) variable * spiece_ *
        ld hl, spiece_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (spiece_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (BinaryExpression) * + * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        add hl, bc              ; (BinaryExpression) 16-bit addition
        push hl                 ; >>> bogus record address, unused
        push hl                 ; >>> record value
                                ; (BinaryExpression) end of...

                                ; (Identifier) constant * bP_ *
        ld hl, bP_            ; variable content
        push hl                 ; >>> push variable address (bogus)
        push hl                 ; >>> push variable content

        ld de, 32                ; (Literal) literal int: * 32 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * + * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        add hl, bc              ; (BinaryExpression) 16-bit addition
        push hl                 ; >>> bogus record address, unused
        push hl                 ; >>> record value
                                ; (BinaryExpression) end of...

                                ; (BinaryExpression) * == * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_082           ; if =, true -> skip change
        dec e                   ; condition=false
equ_082 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_080           ;
                                ; (IfStatement) ***expression==0*** test
                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * target_sq_ *
        ld hl, target_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 16                ; (Literal) literal int: * 16 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * + * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        add hl, bc              ; (BinaryExpression) 16-bit addition
        push hl                 ; >>> bogus record address, unused
        push hl                 ; >>> record value
                                ; (BinaryExpression) end of...

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * == * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_085           ; if =, true -> skip change
        dec e                   ; condition=false
equ_085 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_083           ;
        jp wup_045              ; (ContinueStatement)

        jp ski_084              ; (IfStatement) ***expression==0*** skips else
els_083                         ; else

        jp whx_044              ; (BreakStatement)

ski_084                         ; (IfStatement) ***expression==0*** end of...

        jp ski_081              ; (IfStatement) ***expression==expression*** skips else
els_080                         ; else

        jp whx_044              ; (BreakStatement)

ski_081                         ; (IfStatement) ***expression==expression*** end of...

ski_079                         ; (IfStatement) ***expression&0x08*** end of...

wup_045 jp whi_043              ; (WhileStatement)
whx_044                         ; while end

                                ; (IfStatement) ***expression>0*** test
                                ; (Identifier) variable * direction_ *
        ld hl, direction_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (direction_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * > * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: >
        ld de, 0                ; assume condition=false
        xor a                   ;
        sbc hl, bc              ;
        jp m, mor_088           ; if <, false -> change
        jp z, mor_088           ; if =, false -> change
        inc e                   ; condition=true
mor_088 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_086           ;
                                ; (Identifier) variable * vector_pointer_ *
        ld hl, vector_pointer_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_pointer_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

                                ; (Identifier) variable * offset_count_ *
        ld hl, offset_count_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (offset_count_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

                                ; (IfStatement) ***expression==0*** test
                                ; (Identifier) variable * vector_lists_ *
        ld hl, vector_lists_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_lists_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * vector_pointer_ *
        ld hl, vector_pointer_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_pointer_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * == * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_091           ; if =, true -> skip change
        dec e                   ; condition=false
equ_091 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_089           ;
                                ; (Identifier) variable * direction_ *
        ld hl, direction_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (direction_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UnaryExpression) * - *
        ld de, -1               ; (UnaryExpression) literal unary: * -1 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Identifier) variable * vector_pointer_ *
        ld hl, vector_pointer_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_pointer_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** -- ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        dec (hl)                ; (UpdateExpression) decrement

        jp ski_090              ; (IfStatement) ***expression==0*** skips else
els_089                         ; else

ski_090                         ; (IfStatement) ***expression==0*** end of...

        jp ski_087              ; (IfStatement) ***expression>0*** skips else
els_086                         ; else

                                ; (Identifier) variable * vector_pointer_ *
        ld hl, vector_pointer_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (vector_pointer_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** -- ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        dec (hl)                ; (UpdateExpression) decrement

                                ; (Identifier) variable * offset_count_ *
        ld hl, offset_count_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (offset_count_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** -- ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        dec (hl)                ; (UpdateExpression) decrement

                                ; (IfStatement) ***expression==0*** test
                                ; (Identifier) variable * offset_count_ *
        ld hl, offset_count_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (offset_count_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * == * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_094           ; if =, true -> skip change
        dec e                   ; condition=false
equ_094 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_092           ;
        jp whx_038              ; (BreakStatement)

        jp ski_093              ; (IfStatement) ***expression==0*** skips else
els_092                         ; else

ski_093                         ; (IfStatement) ***expression==0*** end of...

ski_087                         ; (IfStatement) ***expression>0*** end of...

wup_039 jp whi_037              ; (WhileStatement)
whx_038                         ; while end

        jp ski_033              ; (IfStatement) ***expressionexpression*** skips else
els_032                         ; else

ski_033                         ; (IfStatement) ***expressionexpression*** end of...

        jp ski_030              ; (IfStatement) ***expression==0*** skips else
els_029                         ; else

ski_030                         ; (IfStatement) ***expression==0*** end of...

fup_027                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * source_sq_ *
        ld hl, source_sq_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (source_sq_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_025
fex_026                         ; (ForStatement) end of...

                                ; (Literal) * 'Move selection' *
        ld hl, stn_095          ; literal string address
        ld de, 14                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (ForStatement) 1. init --------------
                                ; (VariableDeclarator) * i_ *
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

for_096                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * number_of_moves_ *
        ld hl, number_of_moves_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (number_of_moves_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (BinaryExpression) * < * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: <
        ld de, 0                ; assume condition=false
        xor a                   ;
        sbc hl, bc              ;
        jp nc, les_099          ; if >=, false -> change
        inc e                   ; condition=true
les_099 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_097           ;

                                ; (ForStatement) 3. body -------------
                                ; (VariableDeclarator) * valuation_ *
                                ; (Identifier) variable * valuation_ *
        ld hl, valuation_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (valuation_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 127                ; (Literal) literal int: * 127 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (VariableDeclarator) * = * (int)
        pop de                  ; <<< pop right side value
        pop hl                  ; <<< pop right side address, unused
        pop hl                  ; <<< pop left side value, unused
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (VariableDeclarator) end of...

                                ; (Identifier) variable * valuation_ *
        ld hl, valuation_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (valuation_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix ***move_list_*** 
        ld hl, move_list_            ; variable address
        push hl                 ; >>>
        ld hl, (move_list_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) matrix access
        pop ix                  ; <<< pop column content
        pop de                  ; <<< pop column address, unused
        pop de                  ; <<< pop row content
        pop bc                  ; <<< pop row address, unused
        pop bc                  ; <<< pop matrix size (cols, rows)
        ld b, 0                 ; leave rows only
        push ix                 ; >>> push row size
        push bc                 ; >>> push row size
        push de                 ; >>> push row number
        call mul_16b            ;
        pop hl                  ; <<< pop row index
        pop de                  ; <<< pop column content
        add hl, de              ; record position
        add hl, hl              ; record position
        ld de, 2                ; header size
        add hl, de              ; record position + header
        pop de                  ; <<< pop matrix address
        add hl, de              ; exact position!
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (AssignmentExpression) * += * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        add hl, bc              ; HL has the result
        ex de, hl               ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (IfStatement) ***expressionexpression*** test
                                ; (Identifier) variable * attacks_ *
        ld hl, attacks_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (attacks_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix ***move_list_*** 
        ld hl, move_list_            ; variable address
        push hl                 ; >>>
        ld hl, (move_list_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) matrix access
        pop ix                  ; <<< pop column content
        pop de                  ; <<< pop column address, unused
        pop de                  ; <<< pop row content
        pop bc                  ; <<< pop row address, unused
        pop bc                  ; <<< pop matrix size (cols, rows)
        ld b, 0                 ; leave rows only
        push ix                 ; >>> push row size
        push bc                 ; >>> push row size
        push de                 ; >>> push row number
        call mul_16b            ;
        pop hl                  ; <<< pop row index
        pop de                  ; <<< pop column content
        add hl, de              ; record position
        add hl, hl              ; record position
        ld de, 2                ; header size
        add hl, de              ; record position + header
        pop de                  ; <<< pop matrix address
        add hl, de              ; exact position!
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_100           ;
                                ; (Identifier) variable * valuation_ *
        ld hl, valuation_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (valuation_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix ***move_list_*** 
        ld hl, move_list_            ; variable address
        push hl                 ; >>>
        ld hl, (move_list_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) matrix access
        pop ix                  ; <<< pop column content
        pop de                  ; <<< pop column address, unused
        pop de                  ; <<< pop row content
        pop bc                  ; <<< pop row address, unused
        pop bc                  ; <<< pop matrix size (cols, rows)
        ld b, 0                 ; leave rows only
        push ix                 ; >>> push row size
        push bc                 ; >>> push row size
        push de                 ; >>> push row number
        call mul_16b            ;
        pop hl                  ; <<< pop row index
        pop de                  ; <<< pop column content
        add hl, de              ; record position
        add hl, hl              ; record position
        ld de, 2                ; header size
        add hl, de              ; record position + header
        pop de                  ; <<< pop matrix address
        add hl, de              ; exact position!
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (AssignmentExpression) * += * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        add hl, bc              ; HL has the result
        ex de, hl               ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

        jp ski_101              ; (IfStatement) ***expressionexpression*** skips else
els_100                         ; else

ski_101                         ; (IfStatement) ***expressionexpression*** end of...

                                ; (IfStatement) ***expressionexpression*** test
                                ; (Identifier) variable * attacks_ *
        ld hl, attacks_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (attacks_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix ***move_list_*** 
        ld hl, move_list_            ; variable address
        push hl                 ; >>>
        ld hl, (move_list_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) matrix access
        pop ix                  ; <<< pop column content
        pop de                  ; <<< pop column address, unused
        pop de                  ; <<< pop row content
        pop bc                  ; <<< pop row address, unused
        pop bc                  ; <<< pop matrix size (cols, rows)
        ld b, 0                 ; leave rows only
        push ix                 ; >>> push row size
        push bc                 ; >>> push row size
        push de                 ; >>> push row number
        call mul_16b            ;
        pop hl                  ; <<< pop row index
        pop de                  ; <<< pop column content
        add hl, de              ; record position
        add hl, hl              ; record position
        ld de, 2                ; header size
        add hl, de              ; record position + header
        pop de                  ; <<< pop matrix address
        add hl, de              ; exact position!
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_102           ;
                                ; (Identifier) variable * valuation_ *
        ld hl, valuation_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (valuation_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix ***move_list_*** 
        ld hl, move_list_            ; variable address
        push hl                 ; >>>
        ld hl, (move_list_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) matrix access
        pop ix                  ; <<< pop column content
        pop de                  ; <<< pop column address, unused
        pop de                  ; <<< pop row content
        pop bc                  ; <<< pop row address, unused
        pop bc                  ; <<< pop matrix size (cols, rows)
        ld b, 0                 ; leave rows only
        push ix                 ; >>> push row size
        push bc                 ; >>> push row size
        push de                 ; >>> push row number
        call mul_16b            ;
        pop hl                  ; <<< pop row index
        pop de                  ; <<< pop column content
        add hl, de              ; record position
        add hl, hl              ; record position
        ld de, 2                ; header size
        add hl, de              ; record position + header
        pop de                  ; <<< pop matrix address
        add hl, de              ; exact position!
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (AssignmentExpression) * -= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        sbc hl, bc              ; HL has the result
        ex de, hl               ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

        jp ski_103              ; (IfStatement) ***expressionexpression*** skips else
els_102                         ; else

ski_103                         ; (IfStatement) ***expressionexpression*** end of...

                                ; (Identifier) variable * valuation_ *
        ld hl, valuation_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (valuation_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix ***move_list_*** 
        ld hl, move_list_            ; variable address
        push hl                 ; >>>
        ld hl, (move_list_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) matrix access
        pop ix                  ; <<< pop column content
        pop de                  ; <<< pop column address, unused
        pop de                  ; <<< pop row content
        pop bc                  ; <<< pop row address, unused
        pop bc                  ; <<< pop matrix size (cols, rows)
        ld b, 0                 ; leave rows only
        push ix                 ; >>> push row size
        push bc                 ; >>> push row size
        push de                 ; >>> push row number
        call mul_16b            ;
        pop hl                  ; <<< pop row index
        pop de                  ; <<< pop column content
        add hl, de              ; record position
        add hl, hl              ; record position
        ld de, 2                ; header size
        add hl, de              ; record position + header
        pop de                  ; <<< pop matrix address
        add hl, de              ; exact position!
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push value

        ld de, 3                ; (Literal) literal int: * 3 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * + * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        add hl, bc              ; (BinaryExpression) 16-bit addition
        push hl                 ; >>> bogus record address, unused
        push hl                 ; >>> record value
                                ; (BinaryExpression) end of...

        ld de, 5                ; (Literal) literal int: * 5 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * & * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld a, h                 ; MSB
        and b                   ;
        ld d, a                 ;
        ld a, l                 ; LSB
        and c                   ;
        ld e, a                 ;
        push de                 ; >>> bogus record address, unused
        push de                 ; >>> record value
                                ; (BinaryExpression) end of...

                                ; (AssignmentExpression) * += * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        add hl, bc              ; HL has the result
        ex de, hl               ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Identifier) variable * valuation_ *
        ld hl, valuation_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (valuation_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix ***move_list_*** 
        ld hl, move_list_            ; variable address
        push hl                 ; >>>
        ld hl, (move_list_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) matrix access
        pop ix                  ; <<< pop column content
        pop de                  ; <<< pop column address, unused
        pop de                  ; <<< pop row content
        pop bc                  ; <<< pop row address, unused
        pop bc                  ; <<< pop matrix size (cols, rows)
        ld b, 0                 ; leave rows only
        push ix                 ; >>> push row size
        push bc                 ; >>> push row size
        push de                 ; >>> push row number
        call mul_16b            ;
        pop hl                  ; <<< pop row index
        pop de                  ; <<< pop column content
        add hl, de              ; record position
        add hl, hl              ; record position
        ld de, 2                ; header size
        add hl, de              ; record position + header
        pop de                  ; <<< pop matrix address
        add hl, de              ; exact position!
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push value

        ld de, 4                ; (Literal) literal int: * 4 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * >> * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld b, c                 ; number of shifts
bsh_104 sra h                   ; shift right 1
        rr l                    ; shift right 2
        djnz bsh_104            ;
        push hl                 ; >>> bogus record address, unused
        push hl                 ; >>> record value
                                ; (BinaryExpression) end of...

                                ; (AssignmentExpression) * += * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        add hl, bc              ; HL has the result
        ex de, hl               ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (MemberExpression) matrix ***move_list_*** 
        ld hl, move_list_            ; variable address
        push hl                 ; >>>
        ld hl, (move_list_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) matrix access
        pop ix                  ; <<< pop column content
        pop de                  ; <<< pop column address, unused
        pop de                  ; <<< pop row content
        pop bc                  ; <<< pop row address, unused
        pop bc                  ; <<< pop matrix size (cols, rows)
        ld b, 0                 ; leave rows only
        push ix                 ; >>> push row size
        push bc                 ; >>> push row size
        push de                 ; >>> push row number
        call mul_16b            ;
        pop hl                  ; <<< pop row index
        pop de                  ; <<< pop column content
        add hl, de              ; record position
        add hl, hl              ; record position
        ld de, 2                ; header size
        add hl, de              ; record position + header
        pop de                  ; <<< pop matrix address
        add hl, de              ; exact position!
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push value

        call prt_num            ; (CallExpression) print literal number

        ld de, " "              ; (Literal) literal char: * " " * (ascii: 32d)
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_chr            ; (CallExpression) print literal char

                                ; (MemberExpression) matrix ***move_list_*** 
        ld hl, move_list_            ; variable address
        push hl                 ; >>>
        ld hl, (move_list_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) matrix access
        pop ix                  ; <<< pop column content
        pop de                  ; <<< pop column address, unused
        pop de                  ; <<< pop row content
        pop bc                  ; <<< pop row address, unused
        pop bc                  ; <<< pop matrix size (cols, rows)
        ld b, 0                 ; leave rows only
        push ix                 ; >>> push row size
        push bc                 ; >>> push row size
        push de                 ; >>> push row number
        call mul_16b            ;
        pop hl                  ; <<< pop row index
        pop de                  ; <<< pop column content
        add hl, de              ; record position
        add hl, hl              ; record position
        ld de, 2                ; header size
        add hl, de              ; record position + header
        pop de                  ; <<< pop matrix address
        add hl, de              ; exact position!
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push value

        call prt_num            ; (CallExpression) print literal number

        ld de, " "              ; (Literal) literal char: * " " * (ascii: 32d)
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_chr            ; (CallExpression) print literal char

                                ; (Identifier) variable * valuation_ *
        ld hl, valuation_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (valuation_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (IfStatement) ***expression>expression*** test
                                ; (Identifier) variable * valuation_ *
        ld hl, valuation_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (valuation_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * best_score_ *
        ld hl, best_score_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (best_score_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (BinaryExpression) * > * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: >
        ld de, 0                ; assume condition=false
        xor a                   ;
        sbc hl, bc              ;
        jp m, mor_109           ; if <, false -> change
        jp z, mor_109           ; if =, false -> change
        inc e                   ; condition=true
mor_109 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_107           ;
                                ; (Identifier) variable * best_score_ *
        ld hl, best_score_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (best_score_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * valuation_ *
        ld hl, valuation_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (valuation_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (AssignmentExpression) * = * value to array assignment
                                ; (MemberExpression) matrix ***move_list_*** 
        ld hl, move_list_            ; variable address
        push hl                 ; >>>
        ld hl, (move_list_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) matrix access
        pop ix                  ; <<< pop column content
        pop de                  ; <<< pop column address, unused
        pop de                  ; <<< pop row content
        pop bc                  ; <<< pop row address, unused
        pop bc                  ; <<< pop matrix size (cols, rows)
        ld b, 0                 ; leave rows only
        push ix                 ; >>> push row size
        push bc                 ; >>> push row size
        push de                 ; >>> push row number
        call mul_16b            ;
        pop hl                  ; <<< pop row index
        pop de                  ; <<< pop column content
        add hl, de              ; record position
        add hl, hl              ; record position
        ld de, 2                ; header size
        add hl, de              ; record position + header
        pop de                  ; <<< pop matrix address
        add hl, de              ; exact position!
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push value

                                ; (Identifier) variable * best_move_ *
        ld hl, best_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (best_move_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        pop bc                  ; <<< pop right array value, unused
        pop hl                  ; <<< pop right array address
        pop de                  ; <<< pop right array value
        pop bc                  ; <<< pop right array address, unused
        ld (hl), e              ; write LSB
        inc hl                  ; next
        ld (hl), d              ; write MSB
        inc hl                  ; next


                                ; (AssignmentExpression) * = * value to array assignment
                                ; (MemberExpression) matrix ***move_list_*** 
        ld hl, move_list_            ; variable address
        push hl                 ; >>>
        ld hl, (move_list_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) matrix access
        pop ix                  ; <<< pop column content
        pop de                  ; <<< pop column address, unused
        pop de                  ; <<< pop row content
        pop bc                  ; <<< pop row address, unused
        pop bc                  ; <<< pop matrix size (cols, rows)
        ld b, 0                 ; leave rows only
        push ix                 ; >>> push row size
        push bc                 ; >>> push row size
        push de                 ; >>> push row number
        call mul_16b            ;
        pop hl                  ; <<< pop row index
        pop de                  ; <<< pop column content
        add hl, de              ; record position
        add hl, hl              ; record position
        ld de, 2                ; header size
        add hl, de              ; record position + header
        pop de                  ; <<< pop matrix address
        add hl, de              ; exact position!
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push value

                                ; (Identifier) variable * best_move_ *
        ld hl, best_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (best_move_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        pop bc                  ; <<< pop right array value, unused
        pop hl                  ; <<< pop right array address
        pop de                  ; <<< pop right array value
        pop bc                  ; <<< pop right array address, unused
        ld (hl), e              ; write LSB
        inc hl                  ; next
        ld (hl), d              ; write MSB
        inc hl                  ; next


        jp ski_108              ; (IfStatement) ***expression>expression*** skips else
els_107                         ; else

ski_108                         ; (IfStatement) ***expression>expression*** end of...

fup_098                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_096
fex_097                         ; (ForStatement) end of...

                                ; (IfStatement) ***expression==expression*** test
                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * best_move_ *
        ld hl, best_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (best_move_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (Identifier) constant * wK_ *
        ld hl, wK_            ; variable content
        push hl                 ; >>> push variable address (bogus)
        push hl                 ; >>> push variable content

                                ; (BinaryExpression) * == * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_112           ; if =, true -> skip change
        dec e                   ; condition=false
equ_112 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_110           ;
                                ; (Literal) * 'White is checkmated!' *
        ld hl, stn_113          ; literal string address
        ld de, 20                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        ld hl, keydown_activation           ; (CallExpression) keydown deactivate feature
        ld (hl), 0              ; A=0



        jp ski_111              ; (IfStatement) ***expression==expression*** skips else
els_110                         ; else

ski_111                         ; (IfStatement) ***expression==expression*** end of...

                                ; (IfStatement) ***expression&&expression*** test
                                ; (Identifier) variable * best_move_ *
        ld hl, best_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (best_move_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        ld de, 112                ; (Literal) literal int: * 112 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * >= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: >=
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp nc, meq_117          ; if >=, true -> skip change
        dec e                   ; condition=false
meq_117 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * best_move_ *
        ld hl, best_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (best_move_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (Identifier) constant * bP_ *
        ld hl, bP_            ; variable content
        push hl                 ; >>> push variable address (bogus)
        push hl                 ; >>> push variable content

                                ; (BinaryExpression) * == * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_118           ; if =, true -> skip change
        dec e                   ; condition=false
equ_118 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

                                ; (LogicalExpression) logical * && *

        pop hl                  ; <<< pop left evaluation
        pop de                  ; <<< pop left address, unused
        pop bc                  ; <<< pop right evaluation
        pop de                  ; <<< pop right address, unused
        ld de, 0                ; (LogicalExpression) assume condition is false
        ld a, h                 ; test 16-bit register = 0
        or l                    ;
        jr z, lex_116           ; MSB not fulfiling
        ld a, b                 ; test 16-bit register = 0
        or c                    ;
        jr z, lex_116           ; LSB not fulfiling
        inc de                  ; condition is true
lex_116 push de                 ; >>> push result
        push de                 ; >>> push result


        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_114           ;
                                ; (AssignmentExpression) * = * value to array assignment
                                ; (Identifier) constant * bQ_ *
        ld hl, bQ_            ; variable content
        push hl                 ; >>> push variable address (bogus)
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * best_move_ *
        ld hl, best_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (best_move_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        pop bc                  ; <<< pop right array value, unused
        pop hl                  ; <<< pop right array address
        pop de                  ; <<< pop right array value
        pop bc                  ; <<< pop right array address, unused
        ld (hl), e              ; write LSB
        inc hl                  ; next
        ld (hl), d              ; write MSB
        inc hl                  ; next


        jp ski_115              ; (IfStatement) ***expression&&expression*** skips else
els_114                         ; else

                                ; (AssignmentExpression) * = * value to array assignment
                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * best_move_ *
        ld hl, best_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (best_move_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * best_move_ *
        ld hl, best_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (best_move_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        pop bc                  ; <<< pop right array value, unused
        pop hl                  ; <<< pop right array address
        pop de                  ; <<< pop right array value
        pop bc                  ; <<< pop right array address, unused
        ld (hl), e              ; write LSB
        inc hl                  ; next
        ld (hl), d              ; write MSB
        inc hl                  ; next


ski_115                         ; (IfStatement) ***expression&&expression*** end of...

                                ; (AssignmentExpression) * = * value to array assignment
        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * board_ *
        ld hl, board_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (board_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * best_move_ *
        ld hl, best_move_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (best_move_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (MemberExpression) integer array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array address + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

        pop bc                  ; <<< pop right array value, unused
        pop hl                  ; <<< pop right array address
        pop de                  ; <<< pop right array value
        pop bc                  ; <<< pop right array address, unused
        ld (hl), e              ; write LSB
        inc hl                  ; next
        ld (hl), d              ; write MSB
        inc hl                  ; next


                                ; (Identifier) variable * key_ *
        ld hl, key_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (key_)          ; variable content
        push hl                 ; >>> push variable content


                                ; (AssignmentExpression) * = * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< pop right side value

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (CallExpression): regular call prep ***renderBoard_***

        call renderBoard_            ; (CallExpression): call ***renderBoard_***

fst_119                         ; (FunctionDeclaration) recover return address (general)
        ld hl, sta_ck2          ; update stack2 pointer
        ld e, (hl)              ; pick stack pointer
        inc hl                  ; update pointer
        ld d, (hl)              ; pick stack pointer
        ex de, hl               ; de= sta_ck2, hl= stack pointer
        dec hl                  ;
        ld b, (hl)              ; get return address from stack
        dec hl                  ;
        ld c, (hl)              ;
        push bc                 ; >>> push return address
        ld hl, sta_ck2          ;
        dec (hl)                ;
        dec (hl)                ; end of return address restore
fex_023 ret                     ; (FunctionDeclaration) end of...

mai_cod                         ; main code
        ; do this in order to be able to print and play with bright. do it only once

        ld a,2		; upper screen

        call 5633	; open channel

                                ; (CallExpression): regular call prep ***renderBoard_***

        call renderBoard_            ; (CallExpression): call ***renderBoard_***

        ld hl, keydown_activation           ; (CallExpression) keydown activate feature
        ld (hl), 1              ; A=0
rea_key                         ; (CallExpression) read key from keyboard
        ld hl, 0x5C08           ; LASTKEY system variable
        xor a                   ; A=0
        ld (hl), a              ; reset LASTKEY
key_loo add a, (hl)             ; load latest value of LASTKEY.
        jr z, key_loo           ; loop until a key is pressed
        ld e, a                 ;
        ld d, 0                 ;
        push de                 ; push key address (dummy), unused
        push de                 ; push key value
        call userInput_          ; if key pressed
        ld hl, keydown_activation           ;
        ld a, (hl)              ; get LSB
        or a                    ; check activation bit
        jr nz, rea_key          ; loop while eventListener is active
        ret                     ;


        ret                     ; end of code