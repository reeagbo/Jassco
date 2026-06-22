; Generated with JAvaScript to ASSembly COmpiler, JASSCO v0. Boria Labs 2025.
; Directives -------------------------------------------------
        org 25000               ; initial code address
; File: startup.asc. Default ZX Spectrum startup code
; startup.asc: default ZX Spectrum startup code.
; Opens the upper screen channel, then jumps to the generated main code.
	ld a,2					; open ZX Spectrum upper screen channel
	call 5633				; ROM: open channel
	jp mai_cod				; jumps to main code


; Variable declarations --------------------------------------
        sta_ck2 defw 24500      ; auxiliary stack address
hours_   defw 0                  ; (VariableDeclarator) variable int/bool
minutes_   defw 0                  ; (VariableDeclarator) variable int/bool
seconds_   defw 0                  ; (VariableDeclarator) variable int/bool
                               ; (setinterval) timer parameters
int_tik defw 50                ; ticks per interrupt (fixed)
tik_cou defw 50                ; tick count (decreasing)
interrupt_activation defw 0                 ; seconds count
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
prt_str pop ix			; <<< pop return address
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
prt_num	pop ix			; <<< pop return address
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
    	
; rea_pau: wait for a new key press without returning a value
rea_pau	ld hl, 0x5C08	; LASTKEY system variable
		xor a				;
		ld (hl), a		; discard the previous key
rea_pa1	or (hl)			;
		jr z, rea_pa1	; wait until the ROM records a key
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

; File: time.asc. Basic timer library for ZX Spectrum
; set_int: sets interrupts to handle a timer
set_int
; IM2 interruptions preparations
		di                      ; disable interrupts
		ld hl, int_cod			; interrupt routine address
		ld ($feff), hl       	; store the interrupt routine in $feff 
		ld a, $fe          		; clo_rou page
		ld i, a          		; i = $fe, ISR address in $feff
		im 2                  	; set IM2
		ei                 		; enable interrupts
		
		ld hl, interrupt_activation	; interrupts state
		ld (hl), 1				; active now
 
int_cod							; <---- interruption code jumps here!
		push af					; save registers
		push bc					;
		push de					;
		push hl					;
		push ix					;

		; interruption code start ---------------------------------------------
		
		ld hl, tik_cou			; decrease ticks, one per interrupt
		dec (hl)				; 
		jr nz, act_exi 			; if not 0, skip period actions
		
		ld a, (int_tik)			; reload ticks for next cycle
		ld (hl), a				;
		call timer_function_	; call timer actions	
		
 		; interruption code end -----------------------------------------------
 
act_exi	xor a					;
		ld hl, interrupt_activation ; check status
		cp (hl)					;
		
		pop ix					; restore registers
		pop hl					;
		pop de					;
		pop bc					;
		;pop af					;		

		; problem: after restoring AF, the cp result is lost. 
		; if I do it after, system crashes (AF restoration ruined)
		
		jr z, tim_exi			; from cp above: if 0 (inactive), skip enabling
		ei						; enable interrupts
tim_exi	pop af
		reti					; return



; Program code -----------------------------------------------
; (FunctionDeclaration) Function: timer_function_
timer_function_                        ; (FunctionDeclaration) *** timer_function_ ***
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
        call cls_rom            ; (CallExpression) clear screen

                                ; (Identifier) variable * hours_ *
        ld hl, hours_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (hours_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld de, ":"              ; (Literal) literal char: * ":" * (ascii: 58d)
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_chr            ; (CallExpression) print literal char

                                ; (Identifier) variable * minutes_ *
        ld hl, minutes_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (minutes_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld de, ":"              ; (Literal) literal char: * ":" * (ascii: 58d)
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_chr            ; (CallExpression) print literal char

                                ; (Identifier) variable * seconds_ *
        ld hl, seconds_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (seconds_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * seconds_ *
        ld hl, seconds_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (seconds_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

                                ; (IfStatement) ***expression==10*** test
                                ; (Identifier) variable * seconds_ *
        ld hl, seconds_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (seconds_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
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
        jp z, equ_005           ; if =, true -> skip change
        dec e                   ; condition=false
equ_005 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_003           ;
        ld hl, interrupt_activation    ; interrupts state
        ld (hl), 0                 ; active now

        jp ski_004              ; (IfStatement) ***expression==10*** skips else
els_003                         ; else

ski_004                         ; (IfStatement) ***expression==10*** end of...

fst_006                         ; (FunctionDeclaration) recover return address (general)
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
                                ; (FunctionDeclaration) function body
fst_008                         ; (FunctionDeclaration) recover return address (general)
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
fex_007 ret                     ; (FunctionDeclaration) end of...

mai_cod                         ; main code



                                ; (VariableDeclarator) * hours_ *
                                ; (Identifier) variable * hours_ *
        ld hl, hours_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (hours_)          ; variable content
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

                                ; (VariableDeclarator) * minutes_ *
                                ; (Identifier) variable * minutes_ *
        ld hl, minutes_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (minutes_)          ; variable content
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

                                ; (VariableDeclarator) * seconds_ *
                                ; (Identifier) variable * seconds_ *
        ld hl, seconds_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (seconds_)          ; variable content
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

        call set_int            ; calls the interruptions routine

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