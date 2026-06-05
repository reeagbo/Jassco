; Generated with JAvaScript to ASSembly COmpiler, JASSCO v0. Boria Labs 2025.
; Directives -------------------------------------------------
        org 25000               ; initial code address
        jp mai_cod              ; jumps to main code

; Variable declarations --------------------------------------
        sta_ck2 defw 24500      ; auxiliary stack address
ctx           defw 0         ; (VariableDeclarator) canvas
ctx_x         defw 128       ;
ctx_y         defw 96        ;
n_   defw 4                  ; (VariableDeclarator) variable int/bool
startpos_   defw 0                  ; (VariableDeclarator) variable int/bool
endpos_   defw 1                  ; (VariableDeclarator) variable int/bool
nextpos_   defw 1                  ; (VariableDeclarator) variable int/bool
i_   defw 0                  ; (VariableDeclarator) variable int/bool
mid1x_   defw 0                  ; (VariableDeclarator) variable int/bool
mid1y_   defw 0                  ; (VariableDeclarator) variable int/bool
mid2x_   defw 0                  ; (VariableDeclarator) variable int/bool
mid2y_   defw 0                  ; (VariableDeclarator) variable int/bool
mid3x_   defw 0                  ; (VariableDeclarator) variable int/bool
mid3y_   defw 0                  ; (VariableDeclarator) variable int/bool
x1_   defb 150, 1              ; (VariableDeclarator) empty matrix (cols, rows)
        defs 300                 ; space reserved for the array/matrix
y1_   defb 150, 1              ; (VariableDeclarator) empty matrix (cols, rows)
        defs 300                 ; space reserved for the array/matrix
x2_   defb 150, 1              ; (VariableDeclarator) empty matrix (cols, rows)
        defs 300                 ; space reserved for the array/matrix
y2_   defb 150, 1              ; (VariableDeclarator) empty matrix (cols, rows)
        defs 300                 ; space reserved for the array/matrix
x3_   defb 150, 1              ; (VariableDeclarator) empty matrix (cols, rows)
        defs 300                 ; space reserved for the array/matrix
y3_   defb 150, 1              ; (VariableDeclarator) empty matrix (cols, rows)
        defs 300                 ; space reserved for the array/matrix
stn_012 defb 19, 0, "Sierpinski triangle"        ; (Literal) string

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
    
    

; Program code -----------------------------------------------
mai_cod                         ; main code




                                ; (VariableDeclarator) * n_ *
                                ; (Identifier) variable * n_ *
        ld hl, n_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (n_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 4                ; (Literal) literal int: * 4 *
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

                                ; (VariableDeclarator) * startpos_ *
                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (VariableDeclarator) * endpos_ *
                                ; (Identifier) variable * endpos_ *
        ld hl, endpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (endpos_)          ; variable content
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

                                ; (VariableDeclarator) * nextpos_ *
                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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

                                ; (VariableDeclarator) * mid1x_ *
                                ; (Identifier) variable * mid1x_ *
        ld hl, mid1x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid1x_)          ; variable content
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

                                ; (VariableDeclarator) * mid1y_ *
                                ; (Identifier) variable * mid1y_ *
        ld hl, mid1y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid1y_)          ; variable content
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

                                ; (VariableDeclarator) * mid2x_ *
                                ; (Identifier) variable * mid2x_ *
        ld hl, mid2x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid2x_)          ; variable content
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

                                ; (VariableDeclarator) * mid2y_ *
                                ; (Identifier) variable * mid2y_ *
        ld hl, mid2y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid2y_)          ; variable content
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

                                ; (VariableDeclarator) * mid3x_ *
                                ; (Identifier) variable * mid3x_ *
        ld hl, mid3x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid3x_)          ; variable content
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

                                ; (VariableDeclarator) * mid3y_ *
                                ; (Identifier) variable * mid3y_ *
        ld hl, mid3y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid3y_)          ; variable content
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

                                ; (AssignmentExpression) * = * value to array assignment
        ld de, 20                ; (Literal) literal int: * 20 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * x1_ *
        ld hl, x1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x1_)          ; variable content
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
        ld de, 20                ; (Literal) literal int: * 20 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * y1_ *
        ld hl, y1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y1_)          ; variable content
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
        ld de, 70                ; (Literal) literal int: * 70 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * x2_ *
        ld hl, x2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x2_)          ; variable content
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
        ld de, 120                ; (Literal) literal int: * 120 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * y2_ *
        ld hl, y2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y2_)          ; variable content
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
        ld de, 120                ; (Literal) literal int: * 120 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * x3_ *
        ld hl, x3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x3_)          ; variable content
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
        ld de, 20                ; (Literal) literal int: * 20 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * y3_ *
        ld hl, y3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y3_)          ; variable content
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


                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
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

for_000                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * n_ *
        ld hl, n_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (n_)          ; variable content
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
        jp nc, les_003          ; if >=, false -> change
        inc e                   ; condition=true
les_003 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_001           ;

                                ; (ForStatement) 3. body -------------
                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

for_004                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * endpos_ *
        ld hl, endpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (endpos_)          ; variable content
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
        jp nc, les_007          ; if >=, false -> change
        inc e                   ; condition=true
les_007 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_005           ;

                                ; (ForStatement) 3. body -------------
                                ; (Identifier) variable * mid1x_ *
        ld hl, mid1x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid1x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * x1_ *
        ld hl, x1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (Identifier) variable * x2_ *
        ld hl, x2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (BinaryExpression) * / * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        push hl                 ; >>> operand left
        push bc                 ; >>> operand right
        call div_16b            ; (BinaryExpression) 16-bit division
        pop hl                  ; <<< pop result
        pop de                  ; <<< pop remainder, not used
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

                                ; (Identifier) variable * mid1y_ *
        ld hl, mid1y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid1y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * y1_ *
        ld hl, y1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (Identifier) variable * y2_ *
        ld hl, y2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (BinaryExpression) * / * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        push hl                 ; >>> operand left
        push bc                 ; >>> operand right
        call div_16b            ; (BinaryExpression) 16-bit division
        pop hl                  ; <<< pop result
        pop de                  ; <<< pop remainder, not used
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

                                ; (Identifier) variable * mid2x_ *
        ld hl, mid2x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid2x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * x2_ *
        ld hl, x2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (Identifier) variable * x3_ *
        ld hl, x3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (BinaryExpression) * / * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        push hl                 ; >>> operand left
        push bc                 ; >>> operand right
        call div_16b            ; (BinaryExpression) 16-bit division
        pop hl                  ; <<< pop result
        pop de                  ; <<< pop remainder, not used
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

                                ; (Identifier) variable * mid2y_ *
        ld hl, mid2y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid2y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * y2_ *
        ld hl, y2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (Identifier) variable * y3_ *
        ld hl, y3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (BinaryExpression) * / * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        push hl                 ; >>> operand left
        push bc                 ; >>> operand right
        call div_16b            ; (BinaryExpression) 16-bit division
        pop hl                  ; <<< pop result
        pop de                  ; <<< pop remainder, not used
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

                                ; (Identifier) variable * mid3x_ *
        ld hl, mid3x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid3x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * x1_ *
        ld hl, x1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (Identifier) variable * x3_ *
        ld hl, x3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (BinaryExpression) * / * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        push hl                 ; >>> operand left
        push bc                 ; >>> operand right
        call div_16b            ; (BinaryExpression) 16-bit division
        pop hl                  ; <<< pop result
        pop de                  ; <<< pop remainder, not used
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

                                ; (Identifier) variable * mid3y_ *
        ld hl, mid3y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid3y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * y1_ *
        ld hl, y1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (Identifier) variable * y3_ *
        ld hl, y3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (BinaryExpression) * / * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        push hl                 ; >>> operand left
        push bc                 ; >>> operand right
        call div_16b            ; (BinaryExpression) 16-bit division
        pop hl                  ; <<< pop result
        pop de                  ; <<< pop remainder, not used
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

                                ; (AssignmentExpression) * = * value to array assignment
                                ; (Identifier) variable * x1_ *
        ld hl, x1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (Identifier) variable * x1_ *
        ld hl, x1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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
                                ; (Identifier) variable * y1_ *
        ld hl, y1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (Identifier) variable * y1_ *
        ld hl, y1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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
                                ; (Identifier) variable * mid1x_ *
        ld hl, mid1x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid1x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * x2_ *
        ld hl, x2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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
                                ; (Identifier) variable * mid1y_ *
        ld hl, mid1y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid1y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * y2_ *
        ld hl, y2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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
                                ; (Identifier) variable * mid3x_ *
        ld hl, mid3x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid3x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * x3_ *
        ld hl, x3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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
                                ; (Identifier) variable * mid3y_ *
        ld hl, mid3y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid3y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * y3_ *
        ld hl, y3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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


                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

                                ; (AssignmentExpression) * = * value to array assignment
                                ; (Identifier) variable * mid1x_ *
        ld hl, mid1x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid1x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * x1_ *
        ld hl, x1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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
                                ; (Identifier) variable * mid1y_ *
        ld hl, mid1y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid1y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * y1_ *
        ld hl, y1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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
                                ; (Identifier) variable * x2_ *
        ld hl, x2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (Identifier) variable * x2_ *
        ld hl, x2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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
                                ; (Identifier) variable * y2_ *
        ld hl, y2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (Identifier) variable * y2_ *
        ld hl, y2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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
                                ; (Identifier) variable * mid2x_ *
        ld hl, mid2x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid2x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * x3_ *
        ld hl, x3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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
                                ; (Identifier) variable * mid2y_ *
        ld hl, mid2y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid2y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * y3_ *
        ld hl, y3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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


                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

                                ; (AssignmentExpression) * = * value to array assignment
                                ; (Identifier) variable * mid3x_ *
        ld hl, mid3x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid3x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * x1_ *
        ld hl, x1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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
                                ; (Identifier) variable * mid3y_ *
        ld hl, mid3y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid3y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * y1_ *
        ld hl, y1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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
                                ; (Identifier) variable * mid2x_ *
        ld hl, mid2x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid2x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * x2_ *
        ld hl, x2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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
                                ; (Identifier) variable * mid2y_ *
        ld hl, mid2y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid2y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * y2_ *
        ld hl, y2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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
                                ; (Identifier) variable * x3_ *
        ld hl, x3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (Identifier) variable * x3_ *
        ld hl, x3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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
                                ; (Identifier) variable * y3_ *
        ld hl, y3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

                                ; (Identifier) variable * y3_ *
        ld hl, y3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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


                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

fup_006                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_004
fex_005                         ; (ForStatement) end of...

                                ; (Identifier) variable * endpos_ *
        ld hl, endpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (endpos_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nextpos_ *
        ld hl, nextpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nextpos_)          ; variable content
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

fup_002                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_000
fex_001                         ; (ForStatement) end of...

                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * startpos_ *
        ld hl, startpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (startpos_)          ; variable content
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

for_008                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * endpos_ *
        ld hl, endpos_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (endpos_)          ; variable content
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
        jp nc, les_011          ; if >=, false -> change
        inc e                   ; condition=true
les_011 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_009           ;

                                ; (ForStatement) 3. body -------------
                                ; (Identifier) variable * mid1x_ *
        ld hl, mid1x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid1x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * x1_ *
        ld hl, x1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
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

                                ; (Identifier) variable * mid1y_ *
        ld hl, mid1y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid1y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * y1_ *
        ld hl, y1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
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

                                ; (Identifier) variable * mid2x_ *
        ld hl, mid2x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid2x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * x2_ *
        ld hl, x2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
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

                                ; (Identifier) variable * mid2y_ *
        ld hl, mid2y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid2y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * y2_ *
        ld hl, y2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
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

                                ; (Identifier) variable * mid3x_ *
        ld hl, mid3x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid3x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * x3_ *
        ld hl, x3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (x3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
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

                                ; (Identifier) variable * mid3y_ *
        ld hl, mid3y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid3y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * y3_ *
        ld hl, y3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (y3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
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

                                ; (Identifier) variable * mid1x_ *
        ld hl, mid1x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid1x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * mid1y_ *
        ld hl, mid1y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid1y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (CallExpression) moveTo, plot a point
        pop bc                  ; get y-coord value
        pop hl                  ; get y-coord address, unused
        pop de                  ; get x-coord value
        pop hl                  ; get x-coord address, unused
        ld hl, ctx_x              ; save values in canvas object
        ld (hl), e              ;
        ld hl, ctx_y              ;
        ld (hl), c              ;
        ld d, e                  ; DE has to contain (x,y)
        ld e, c                  ;
        call plo_poi            ; (CallExpression) call function ctx

                                ; (Identifier) variable * mid2x_ *
        ld hl, mid2x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid2x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * mid2y_ *
        ld hl, mid2y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid2y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (CallExpression) lineTo, draw a line
        ld hl, ctx_x              ;
        ld d, (hl)              ;
        ld hl, ctx_y              ;
        ld e, (hl)              ;
        pop bc                  ; get y-coord value
        pop hl                  ; get y-coord address, unused
        ld hl, ctx_y            ; save new y
        ld (hl), c              ;
        ld a, c                 ; save target y-coord, later use
        pop bc                  ; get x-coord value
        pop hl                  ; get x-coord address, unused
        ld hl, ctx_x            ; save new x
        ld (hl), c              ;
        ld h, c                  ; HL has to contain target (x,y)
        ld l, a                  ;
        call dra_lin            ; (CallExpression) call function ctx

                                ; (Identifier) variable * mid3x_ *
        ld hl, mid3x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid3x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * mid3y_ *
        ld hl, mid3y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid3y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (CallExpression) lineTo, draw a line
        ld hl, ctx_x              ;
        ld d, (hl)              ;
        ld hl, ctx_y              ;
        ld e, (hl)              ;
        pop bc                  ; get y-coord value
        pop hl                  ; get y-coord address, unused
        ld hl, ctx_y            ; save new y
        ld (hl), c              ;
        ld a, c                 ; save target y-coord, later use
        pop bc                  ; get x-coord value
        pop hl                  ; get x-coord address, unused
        ld hl, ctx_x            ; save new x
        ld (hl), c              ;
        ld h, c                  ; HL has to contain target (x,y)
        ld l, a                  ;
        call dra_lin            ; (CallExpression) call function ctx

                                ; (Identifier) variable * mid1x_ *
        ld hl, mid1x_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid1x_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * mid1y_ *
        ld hl, mid1y_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (mid1y_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (CallExpression) lineTo, draw a line
        ld hl, ctx_x              ;
        ld d, (hl)              ;
        ld hl, ctx_y              ;
        ld e, (hl)              ;
        pop bc                  ; get y-coord value
        pop hl                  ; get y-coord address, unused
        ld hl, ctx_y            ; save new y
        ld (hl), c              ;
        ld a, c                 ; save target y-coord, later use
        pop bc                  ; get x-coord value
        pop hl                  ; get x-coord address, unused
        ld hl, ctx_x            ; save new x
        ld (hl), c              ;
        ld h, c                  ; HL has to contain target (x,y)
        ld l, a                  ;
        call dra_lin            ; (CallExpression) call function ctx

fup_010                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_008
fex_009                         ; (ForStatement) end of...

                                ; (Literal) * 'Sierpinski triangle' *
        ld hl, stn_012          ; literal string address
        ld de, 19                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        ret                     ; end of code