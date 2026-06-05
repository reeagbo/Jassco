; Generated with JAvaScript to ASSembly COmpiler, JASSCO v0. Boria Labs 2025.
; Directives -------------------------------------------------
        org 25000               ; initial code address
        jp mai_cod              ; jumps to main code

; Variable declarations --------------------------------------
        sta_ck2 defw 24500      ; auxiliary stack address
nr_input_cases_   defw 1                  ; (VariableDeclarator) variable int/bool
nr_neurons0_   defw 2                  ; (VariableDeclarator) variable int/bool
nr_neurons1_   defw 2                  ; (VariableDeclarator) variable int/bool
biases1_   defb 2, 1               ; (VariableDeclarator) integer matrix (cols, rows)
        defw 0, 3    ; matrix declaration
outputs1_   defb 2, 1               ; (VariableDeclarator) integer matrix (cols, rows)
        defw 0, 0    ; matrix declaration
nr_neurons2_   defw 2                  ; (VariableDeclarator) variable int/bool
outputs2_   defb 2, 1               ; (VariableDeclarator) integer matrix (cols, rows)
        defw 0, 0    ; matrix declaration
i_   defw 0                  ; (VariableDeclarator) variable int/bool
j_   defw 0                  ; (VariableDeclarator) variable int/bool
k_   defw 0                  ; (VariableDeclarator) variable int/bool
step_input_   defw 0                ; (FunctionDeclaration) literal int/bool
step_output_   defw 0                  ; (VariableDeclarator) variable int/bool
relu_input_   defw 0                ; (FunctionDeclaration) literal int/bool
relu_output_   defw 0                  ; (VariableDeclarator) variable int/bool
index_   defw 0                ; (FunctionDeclaration) literal int/bool
neuron_sum_   defw 0                  ; (VariableDeclarator) variable int/bool
stn_019 defb 5, 0, "L1, N"        ; (Literal) string
stn_020 defb 2, 0, ": "        ; (Literal) string
stn_029 defb 5, 0, "L2, N"        ; (Literal) string
stn_030 defb 2, 0, ": "        ; (Literal) string
stn_036 defb 8, 0, "* Input "        ; (Literal) string
stn_042 defb 0, 0, ""        ; (Literal) string
stn_043 defb 7, 0, "Output:"        ; (Literal) string
stn_049 defb 0, 0, ""        ; (Literal) string

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
    
    

; Program code -----------------------------------------------




                                ; (VariableDeclarator) * nr_input_cases_ *
                                ; (Identifier) variable * nr_input_cases_ *
        ld hl, nr_input_cases_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nr_input_cases_)          ; variable content
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

                                ; (VariableDeclarator) * nr_neurons0_ *
                                ; (Identifier) variable * nr_neurons0_ *
        ld hl, nr_neurons0_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nr_neurons0_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 2                ; (Literal) literal int: * 2 *
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

                                ; (VariableDeclarator) * nr_neurons1_ *
                                ; (Identifier) variable * nr_neurons1_ *
        ld hl, nr_neurons1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nr_neurons1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 2                ; (Literal) literal int: * 2 *
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

        ld hl, biases1_          ; (VariableDeclarator) array/matrix assignment
        inc hl                  ; skip dimensions
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

        ld de, 3                ; (Literal) literal int: * 3 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

                                ; (VariableDeclarator) biases1_, end of...

        ld hl, outputs1_          ; (VariableDeclarator) array/matrix assignment
        inc hl                  ; skip dimensions
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

                                ; (VariableDeclarator) outputs1_, end of...

                                ; (VariableDeclarator) * nr_neurons2_ *
                                ; (Identifier) variable * nr_neurons2_ *
        ld hl, nr_neurons2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nr_neurons2_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 2                ; (Literal) literal int: * 2 *
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

        ld hl, outputs2_          ; (VariableDeclarator) array/matrix assignment
        inc hl                  ; skip dimensions
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

                                ; (VariableDeclarator) outputs2_, end of...

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

                                ; (VariableDeclarator) * j_ *
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
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

                                ; (VariableDeclarator) * k_ *
                                ; (Identifier) variable * k_ *
        ld hl, k_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (k_)          ; variable content
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

; (FunctionDeclaration) Function: step_
step_                        ; (FunctionDeclaration) *** step_ ***
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
        ld hl, step_input_            ; argument *** step_input_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

                                ; (FunctionDeclaration) function body
                                ; (VariableDeclarator) * step_output_ *
                                ; (Identifier) variable * step_output_ *
        ld hl, step_output_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (step_output_)          ; variable content
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

                                ; (Identifier) variable * step_output_ *
        ld hl, step_output_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (step_output_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (ConditionalExpression) 1. test
                                ; (Identifier) variable * step_input_ *
        ld hl, step_input_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (step_input_)          ; variable content
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
        jp m, mor_003           ; if <, false -> change
        jp z, mor_003           ; if =, false -> change
        inc e                   ; condition=true
mor_003 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ConditionalExpression) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jr z, cal_001           ;
                                ; (ConditionalExpression) 2. consequent
                                ; (Identifier) variable * step_input_ *
        ld hl, step_input_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (step_input_)          ; variable content
        push hl                 ; >>> push variable content

        jr cex_002              ;
cal_001                         ; (ConditionalExpression) 3. alternate
        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

cex_002                         ; (ConditionalExpression) end of...

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
                                ; (Identifier) variable * step_output_ *
        ld hl, step_output_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (step_output_)          ; variable content
        push hl                 ; >>> push variable content


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

fst_004                         ; (FunctionDeclaration) recover return address (general)
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


; (FunctionDeclaration) Function: relu_
relu_                        ; (FunctionDeclaration) *** relu_ ***
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
        ld hl, relu_input_            ; argument *** relu_input_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

                                ; (FunctionDeclaration) function body
                                ; (VariableDeclarator) * relu_output_ *
                                ; (Identifier) variable * relu_output_ *
        ld hl, relu_output_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (relu_output_)          ; variable content
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

                                ; (Identifier) variable * relu_output_ *
        ld hl, relu_output_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (relu_output_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (ConditionalExpression) 1. test
                                ; (Identifier) variable * relu_input_ *
        ld hl, relu_input_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (relu_input_)          ; variable content
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
        jp m, mor_008           ; if <, false -> change
        jp z, mor_008           ; if =, false -> change
        inc e                   ; condition=true
mor_008 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ConditionalExpression) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jr z, cal_006           ;
                                ; (ConditionalExpression) 2. consequent
                                ; (Identifier) variable * relu_input_ *
        ld hl, relu_input_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (relu_input_)          ; variable content
        push hl                 ; >>> push variable content

        jr cex_007              ;
cal_006                         ; (ConditionalExpression) 3. alternate
        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

cex_007                         ; (ConditionalExpression) end of...

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
                                ; (Identifier) variable * relu_output_ *
        ld hl, relu_output_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (relu_output_)          ; variable content
        push hl                 ; >>> push variable content


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

fst_009                         ; (FunctionDeclaration) recover return address (general)
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
fex_005 ret                     ; (FunctionDeclaration) end of...


; (FunctionDeclaration) Function: run_network_
run_network_                        ; (FunctionDeclaration) *** run_network_ ***
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
        ld hl, index_            ; argument *** index_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

                                ; (FunctionDeclaration) function body
                                ; (VariableDeclarator) * neuron_sum_ *
                                ; (Identifier) variable * neuron_sum_ *
        ld hl, neuron_sum_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (neuron_sum_)          ; variable content
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

                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
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

for_011                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nr_neurons1_ *
        ld hl, nr_neurons1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nr_neurons1_)          ; variable content
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
        jp nc, les_014          ; if >=, false -> change
        inc e                   ; condition=true
les_014 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_012           ;

                                ; (ForStatement) 3. body -------------
                                ; (Identifier) variable * neuron_sum_ *
        ld hl, neuron_sum_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (neuron_sum_)          ; variable content
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

                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * k_ *
        ld hl, k_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (k_)          ; variable content
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

for_015                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * k_ *
        ld hl, k_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (k_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nr_neurons0_ *
        ld hl, nr_neurons0_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nr_neurons0_)          ; variable content
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
        jp nc, les_018          ; if >=, false -> change
        inc e                   ; condition=true
les_018 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_016           ;

                                ; (ForStatement) 3. body -------------
                                ; (Identifier) variable * neuron_sum_ *
        ld hl, neuron_sum_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (neuron_sum_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix ***weights1_*** 
        ld hl, weights1_            ; variable address
        push hl                 ; >>>
        ld hl, (weights1_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
                                ; (Identifier) variable * k_ *
        ld hl, k_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (k_)          ; variable content
        push hl                 ; >>> push variable content

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

                                ; (MemberExpression) matrix ***input_cases_*** 
        ld hl, input_cases_            ; variable address
        push hl                 ; >>>
        ld hl, (input_cases_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * index_ *
        ld hl, index_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (index_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
                                ; (Identifier) variable * k_ *
        ld hl, k_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (k_)          ; variable content
        push hl                 ; >>> push variable content

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

fup_017                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * k_ *
        ld hl, k_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (k_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_015
fex_016                         ; (ForStatement) end of...

                                ; (Identifier) variable * neuron_sum_ *
        ld hl, neuron_sum_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (neuron_sum_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * biases1_ *
        ld hl, biases1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (biases1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
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

                                ; (AssignmentExpression) * = * value to array assignment
                                ; (CallExpression): regular call prep ***relu_***

                                ; (Identifier) variable * neuron_sum_ *
        ld hl, neuron_sum_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (neuron_sum_)          ; variable content
        push hl                 ; >>> push variable content

        call relu_            ; (CallExpression): call ***relu_***

                                ; (Identifier) variable * outputs1_ *
        ld hl, outputs1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (outputs1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
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


                                ; (Literal) * 'L1, N' *
        ld hl, stn_019          ; literal string address
        ld de, 5                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

                                ; (Literal) * ': ' *
        ld hl, stn_020          ; literal string address
        ld de, 2                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * outputs1_ *
        ld hl, outputs1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (outputs1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


fup_013                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_011
fex_012                         ; (ForStatement) end of...

                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
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

for_021                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nr_neurons2_ *
        ld hl, nr_neurons2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nr_neurons2_)          ; variable content
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
        jp nc, les_024          ; if >=, false -> change
        inc e                   ; condition=true
les_024 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_022           ;

                                ; (ForStatement) 3. body -------------
                                ; (Identifier) variable * neuron_sum_ *
        ld hl, neuron_sum_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (neuron_sum_)          ; variable content
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

                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * k_ *
        ld hl, k_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (k_)          ; variable content
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
                                ; (Identifier) variable * k_ *
        ld hl, k_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (k_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nr_neurons1_ *
        ld hl, nr_neurons1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nr_neurons1_)          ; variable content
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
                                ; (Identifier) variable * neuron_sum_ *
        ld hl, neuron_sum_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (neuron_sum_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix ***weights2_*** 
        ld hl, weights2_            ; variable address
        push hl                 ; >>>
        ld hl, (weights2_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
                                ; (Identifier) variable * k_ *
        ld hl, k_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (k_)          ; variable content
        push hl                 ; >>> push variable content

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

                                ; (Identifier) variable * outputs1_ *
        ld hl, outputs1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (outputs1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * k_ *
        ld hl, k_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (k_)          ; variable content
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

fup_027                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * k_ *
        ld hl, k_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (k_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_025
fex_026                         ; (ForStatement) end of...

                                ; (Identifier) variable * neuron_sum_ *
        ld hl, neuron_sum_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (neuron_sum_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * biases2_ *
        ld hl, biases2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (biases2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
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

                                ; (AssignmentExpression) * = * value to array assignment
                                ; (CallExpression): regular call prep ***relu_***

                                ; (Identifier) variable * neuron_sum_ *
        ld hl, neuron_sum_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (neuron_sum_)          ; variable content
        push hl                 ; >>> push variable content

        call relu_            ; (CallExpression): call ***relu_***

                                ; (Identifier) variable * outputs2_ *
        ld hl, outputs2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (outputs2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
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


                                ; (Literal) * 'L2, N' *
        ld hl, stn_029          ; literal string address
        ld de, 5                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

                                ; (Literal) * ': ' *
        ld hl, stn_030          ; literal string address
        ld de, 2                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * outputs2_ *
        ld hl, outputs2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (outputs2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


fup_023                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_021
fex_022                         ; (ForStatement) end of...

fst_031                         ; (FunctionDeclaration) recover return address (general)
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
fex_010 ret                     ; (FunctionDeclaration) end of...

mai_cod                         ; main code
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

for_032                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nr_input_cases_ *
        ld hl, nr_input_cases_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nr_input_cases_)          ; variable content
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
        jp nc, les_035          ; if >=, false -> change
        inc e                   ; condition=true
les_035 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_033           ;

                                ; (ForStatement) 3. body -------------
                                ; (Literal) * '* Input ' *
        ld hl, stn_036          ; literal string address
        ld de, 8                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
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

for_037                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nr_neurons0_ *
        ld hl, nr_neurons0_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nr_neurons0_)          ; variable content
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
        jp nc, les_040          ; if >=, false -> change
        inc e                   ; condition=true
les_040 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_038           ;

                                ; (ForStatement) 3. body -------------
                                ; (MemberExpression) matrix ***input_cases_*** 
        ld hl, input_cases_            ; variable address
        push hl                 ; >>>
        ld hl, (input_cases_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
        push hl                 ; >>> push variable content

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

        call prt_num            ; (CallExpression) print number


        ld de, ","              ; (Literal) literal char: * "," * (ascii: 44d)
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_chr            ; (CallExpression) print char


fup_039                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_037
fex_038                         ; (ForStatement) end of...

                                ; (Literal) * '' *
        ld hl, stn_042          ; literal string address
        ld de, 0                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (CallExpression): regular call prep ***run_network_***

                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

        call run_network_            ; (CallExpression): call ***run_network_***

                                ; (Literal) * 'Output:' *
        ld hl, stn_043          ; literal string address
        ld de, 7                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
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

for_044                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * nr_neurons2_ *
        ld hl, nr_neurons2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (nr_neurons2_)          ; variable content
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
        jp nc, les_047          ; if >=, false -> change
        inc e                   ; condition=true
les_047 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_045           ;

                                ; (ForStatement) 3. body -------------
                                ; (Identifier) variable * outputs2_ *
        ld hl, outputs2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (outputs2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
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

        call prt_num            ; (CallExpression) print number


        ld de, ","              ; (Literal) literal char: * "," * (ascii: 44d)
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_chr            ; (CallExpression) print char


fup_046                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * j_ *
        ld hl, j_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (j_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_044
fex_045                         ; (ForStatement) end of...

                                ; (Literal) * '' *
        ld hl, stn_049          ; literal string address
        ld de, 0                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


fup_034                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_032
fex_033                         ; (ForStatement) end of...

        ret                     ; end of code