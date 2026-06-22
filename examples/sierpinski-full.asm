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
canvas_   defw 0                  ; (VariableDeclarator) DOM element placeholder
ctx           defw 0         ; (VariableDeclarator) canvas context
ctx_x         defw 128       ;
ctx_y         defw 96        ;
fn_sierpinski_x1_   defw 0                ; (FunctionDeclaration) literal int/bool
fn_sierpinski_y1_   defw 0                ; (FunctionDeclaration) literal int/bool
fn_sierpinski_x2_   defw 0                ; (FunctionDeclaration) literal int/bool
fn_sierpinski_y2_   defw 0                ; (FunctionDeclaration) literal int/bool
fn_sierpinski_x3_   defw 0                ; (FunctionDeclaration) literal int/bool
fn_sierpinski_y3_   defw 0                ; (FunctionDeclaration) literal int/bool
fn_sierpinski_level_   defw 0                ; (FunctionDeclaration) literal int/bool
stn_006 defb 20, 0, "Sierpinski recursive"        ; (Literal) string

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

; File: graph.asc. Basic graph library for ZX Spectrum

; dra_lin: draw a line in the screen
; from de = end1 (d = x-axis, e = y-axis)
; to   hl = end2 (h = x-axis, l = y-axis)
dra_lin
	; Bresenham line drawing, all octants.
	; Keep the public contract used by the compiler: DE=(x0,y0), HL=(x1,y1).
	ld a, d				;
	ld (lin_x0), a		;
	ld a, e				;
	ld (lin_y0), a		;
	ld a, h				;
	ld (lin_x1), a		;
	ld a, l				;
	ld (lin_y1), a		;

	; dx = abs(x1 - x0), sx = +/-1
	ld a, h				;
	sub d				;
	jr nc, lin_xpo		;
	ld a, d				;
	sub h				;
	ld (lin_dx), a		;
	ld a, 255			; -1
	ld (lin_sx), a		;
	jr lin_ydl			;
lin_xpo
	ld (lin_dx), a		;
	ld a, 1				;
	ld (lin_sx), a		;

	; dy = abs(y1 - y0), sy = +/-1
lin_ydl
	ld a, l				;
	sub e				;
	jr nc, lin_ypo		;
	ld a, e				;
	sub l				;
	ld (lin_dy), a		;
	ld a, 255			; -1
	ld (lin_sy), a		;
	jr lin_cho			;
lin_ypo
	ld (lin_dy), a		;
	ld a, 1				;
	ld (lin_sy), a		;

	; choose major axis
lin_cho
	ld a, (lin_dx)		;
	ld b, a				;
	ld a, (lin_dy)		;
	cp b				;
	jr c, lin_xma		; dx > dy
	jr z, lin_xma		; dx == dy
	jr lin_yma			; dy > dx

	; X-major line ------------------------------------------------
lin_xma
	ld a, (lin_dx)		;
	srl a				;
	ld l, a				;
	ld h, 0				;
	ld (lin_err), hl	;
lin_xlo
	call lin_plo		;
	ld a, (lin_x0)		;
	ld b, a				;
	ld a, (lin_x1)		;
	cp b				;
	ret z				;

	; x0 += sx
	ld a, (lin_sx)		;
	cp 1				;
	ld a, (lin_x0)		;
	jr z, lin_xip		;
	dec a				;
	jr lin_xss			;
lin_xip
	inc a				;
lin_xss
	ld (lin_x0), a		;

	ld hl, (lin_err)	;
	ld a, (lin_dy)		;
	ld c, a				;
	ld b, 0				;
	or a				;
	sbc hl, bc			; err -= dy
	ld (lin_err), hl	;
	bit 7, h			;
	jr z, lin_xlo		;

	; y0 += sy
	ld a, (lin_sy)		;
	cp 1				;
	ld a, (lin_y0)		;
	jr z, lin_yip		;
	dec a				;
	jr lin_yss			;
lin_yip
	inc a				;
lin_yss
	ld (lin_y0), a		;
	ld hl, (lin_err)	;
	ld a, (lin_dx)		;
	ld c, a				;
	ld b, 0				;
	add hl, bc			; err += dx
	ld (lin_err), hl	;
	jr lin_xlo			;

	; Y-major line ------------------------------------------------
lin_yma
	ld a, (lin_dy)		;
	srl a				;
	ld l, a				;
	ld h, 0				;
	ld (lin_err), hl	;
lin_ylo
	call lin_plo		;
	ld a, (lin_y0)		;
	ld b, a				;
	ld a, (lin_y1)		;
	cp b				;
	ret z				;

	; y0 += sy
	ld a, (lin_sy)		;
	cp 1				;
	ld a, (lin_y0)		;
	jr z, lin_yip2		;
	dec a				;
	jr lin_yss2		;
lin_yip2
	inc a				;
lin_yss2
	ld (lin_y0), a		;

	ld hl, (lin_err)	;
	ld a, (lin_dx)		;
	ld c, a				;
	ld b, 0				;
	or a				;
	sbc hl, bc			; err -= dx
	ld (lin_err), hl	;
	bit 7, h			;
	jr z, lin_ylo		;

	; x0 += sx
	ld a, (lin_sx)		;
	cp 1				;
	ld a, (lin_x0)		;
	jr z, lin_xip2		;
	dec a				;
	jr lin_xss2		;
lin_xip2
	inc a				;
lin_xss2
	ld (lin_x0), a		;
	ld hl, (lin_err)	;
	ld a, (lin_dy)		;
	ld c, a				;
	ld b, 0				;
	add hl, bc			; err += dy
	ld (lin_err), hl	;
	jr lin_ylo			;

lin_plo
	ld a, (lin_x0)		;
	ld d, a				;
	ld a, (lin_y0)		;
	ld e, a				;
	; Fast plot for dra_lin. It intentionally clobbers DE and HL because
	; Bresenham keeps its loop state in memory and reloads it after plotting.
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
	ret					;

lin_x0 defb 0
lin_y0 defb 0
lin_x1 defb 0
lin_y1 defb 0
lin_dx defb 0
lin_dy defb 0
lin_sx defb 0
lin_sy defb 0
lin_err defw 0

hmskl
defb %11111111
defb %01111111
defb %00111111
defb %00011111
defb %00001111
defb %00000111
defb %00000011
defb %00000001

hmskr
defb %10000000
defb %11000000
defb %11100000
defb %11110000
defb %11111000
defb %11111100
defb %11111110
defb %11111111

clr_x defb 0
clr_y defb 0
clr_w defb 0
clr_h defb 0
clr_x2 defb 0
clr_yc defb 0
clr_hc defb 0
clr_lbyte defb 0

; plo_poi: plot point in screen
; D=x E=y, canvas-compatible coordinates: y=0 is the top of the screen
; target: 0 1 0 y7 y6 y2 y1 y0  |  y5 y4 y3 x7 x7 x5 x4 x3
plo_poi
	push hl				; save registers
	push de				;
	
	; skip every 2nd point (5B)
	;ld a, d			; mix X an Y
	;add a, e			;
	;rra				; check bit 0
	;jr nc, lincon
	
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

scradr
defw &4000, &4100, &4200, &4300, &4400, &4500, &4600, &4700
defw &4020, &4120, &4220, &4320, &4420, &4520, &4620, &4720
defw &4040, &4140, &4240, &4340, &4440, &4540, &4640, &4740
defw &4060, &4160, &4260, &4360, &4460, &4560, &4660, &4760
defw &4080, &4180, &4280, &4380, &4480, &4580, &4680, &4780
defw &40A0, &41A0, &42A0, &43A0, &44A0, &45A0, &46A0, &47A0
defw &40C0, &41C0, &42C0, &43C0, &44C0, &45C0, &46C0, &47C0
defw &40E0, &41E0, &42E0, &43E0, &44E0, &45E0, &46E0, &47E0
defw &4800, &4900, &4A00, &4B00, &4C00, &4D00, &4E00, &4F00
defw &4820, &4920, &4A20, &4B20, &4C20, &4D20, &4E20, &4F20
defw &4840, &4940, &4A40, &4B40, &4C40, &4D40, &4E40, &4F40
defw &4860, &4960, &4A60, &4B60, &4C60, &4D60, &4E60, &4F60
defw &4880, &4980, &4A80, &4B80, &4C80, &4D80, &4E80, &4F80
defw &48A0, &49A0, &4AA0, &4BA0, &4CA0, &4DA0, &4EA0, &4FA0
defw &48C0, &49C0, &4AC0, &4BC0, &4CC0, &4DC0, &4FC0
defw &48E0, &49E0, &4AE0, &4BE0, &4CE0, &4DE0, &4EE0, &4FE0
defw &5000, &5100, &5200, &5300, &5400, &5500, &5600, &5700
defw &5020, &5120, &5220, &5320, &5420, &5520, &5620, &5720
defw &5040, &5140, &5240, &5340, &5440, &5540, &5640, &5740
defw &5060, &5160, &5260, &5360, &5460, &5560, &5660, &5760
defw &5080, &5180, &5280, &5380, &5480, &5580, &5680, &5780
defw &50A0, &51A0, &52A0, &53A0, &54A0, &55A0, &56A0, &57A0
defw &50C0, &51C0, &52C0, &53C0, &54C0, &55C0, &56C0, &57C0
defw &50E0, &51E0, &52E0, &53E0, &54E0, &55E0, &56E0, &57E0

; cle_rec: clear rectangle.
; Input is stored by the translator in clr_x, clr_y, clr_w, clr_h.
cle_rec
	ld a, (clr_w)			;
	or a					;
	ret z					;
	ld a, (clr_h)			;
	or a					;
	ret z					;
	ld (clr_hc), a			;
	ld a, (clr_w)			;
	dec a					;
	ld b, a					;
	ld a, (clr_x)			;
	add a, b				;
	jr nc, clr_x2_ok		;
	ld a, 255				;
clr_x2_ok
	ld (clr_x2), a			;
	ld a, (clr_y)			;
	ld (clr_yc), a			;

clr_row_loop
	ld a, (clr_hc)			;
	or a					;
	ret z					;
	ld a, (clr_yc)			;
	cp 192					;
	ret nc					;
	ld l, a					;
	ld h, 0					;
	add hl, hl				;
	ld de, scradr			;
	add hl, de				;
	ld e, (hl)				;
	inc hl					;
	ld d, (hl)				;
	ex de, hl				;
	ld a, (clr_x)			;
	rrca					;
	rrca					;
	rrca					;
	and %00011111			;
	ld c, a					;
	ld (clr_lbyte), a		;
	ld a, (clr_x2)			;
	rrca					;
	rrca					;
	rrca					;
	and %00011111			;
	ld b, a					;
	ld a, l					;
	add a, c				;
	ld l, a					;
	ld a, b					;
	cp c					;
	jr nz, clr_multi_byte	;

clr_single_byte
	push hl					;
	ld a, (clr_x)			;
	and %00000111			;
	ld e, a					;
	ld d, 0					;
	ld hl, hmskl			;
	add hl, de				;
	ld b, (hl)				;
	ld a, (clr_x2)			;
	and %00000111			;
	ld e, a					;
	ld hl, hmskr			;
	add hl, de				;
	ld a, (hl)				;
	and b					;
	pop hl					;
	cpl						;
	and (hl)				;
	ld (hl), a				;
	jr clr_next_row			;

clr_multi_byte
	push hl					;
	ld a, (clr_x)			;
	and %00000111			;
	ld e, a					;
	ld d, 0					;
	ld hl, hmskl			;
	add hl, de				;
	ld a, (hl)				;
	pop hl					;
	cpl						;
	and (hl)				;
	ld (hl), a				;
	inc hl					;
	ld a, (clr_x2)			;
	rrca					;
	rrca					;
	rrca					;
	and %00011111			;
	ld b, a					;
	ld a, (clr_lbyte)		;
	ld c, a					;
	ld a, b					;
	sub c					;
	dec a					;
	jr z, clr_right_byte	;
	ld b, a					;
clr_middle_loop
	ld (hl), 0				;
	inc hl					;
	djnz clr_middle_loop	;

clr_right_byte
	push hl					;
	ld a, (clr_x2)			;
	and %00000111			;
	ld e, a					;
	ld d, 0					;
	ld hl, hmskr			;
	add hl, de				;
	ld a, (hl)				;
	pop hl					;
	cpl						;
	and (hl)				;
	ld (hl), a				;

clr_next_row
	ld hl, clr_yc			;
	inc (hl)				;
	ld hl, clr_hc			;
	dec (hl)				;
	jp clr_row_loop			;

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
; (FunctionDeclaration) Function: sierpinski_
sierpinski_                        ; (FunctionDeclaration) *** sierpinski_ ***
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
        ld hl, (sta_ck2)        ; reserve return address
        inc hl                  ;
        inc hl                  ;
        ld (sta_ck2), hl        ; end of return address preps

                                ; (FunctionDeclaration) collect arguments
        ld hl, sta_ck2          ; save caller parameter fn_sierpinski_x1_
        ld e, (hl)              ; pick auxiliary stack pointer
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; HL= auxiliary stack pointer
        ld de, (fn_sierpinski_x1_)       ; caller parameter value
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        ld hl, (sta_ck2)        ; reserve saved parameter
        inc hl                  ;
        inc hl                  ;
        ld (sta_ck2), hl        ;
        ld hl, fn_sierpinski_x1_            ; argument *** fn_sierpinski_x1_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

        ld hl, sta_ck2          ; save caller parameter fn_sierpinski_y1_
        ld e, (hl)              ; pick auxiliary stack pointer
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; HL= auxiliary stack pointer
        ld de, (fn_sierpinski_y1_)       ; caller parameter value
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        ld hl, (sta_ck2)        ; reserve saved parameter
        inc hl                  ;
        inc hl                  ;
        ld (sta_ck2), hl        ;
        ld hl, fn_sierpinski_y1_            ; argument *** fn_sierpinski_y1_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

        ld hl, sta_ck2          ; save caller parameter fn_sierpinski_x2_
        ld e, (hl)              ; pick auxiliary stack pointer
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; HL= auxiliary stack pointer
        ld de, (fn_sierpinski_x2_)       ; caller parameter value
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        ld hl, (sta_ck2)        ; reserve saved parameter
        inc hl                  ;
        inc hl                  ;
        ld (sta_ck2), hl        ;
        ld hl, fn_sierpinski_x2_            ; argument *** fn_sierpinski_x2_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

        ld hl, sta_ck2          ; save caller parameter fn_sierpinski_y2_
        ld e, (hl)              ; pick auxiliary stack pointer
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; HL= auxiliary stack pointer
        ld de, (fn_sierpinski_y2_)       ; caller parameter value
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        ld hl, (sta_ck2)        ; reserve saved parameter
        inc hl                  ;
        inc hl                  ;
        ld (sta_ck2), hl        ;
        ld hl, fn_sierpinski_y2_            ; argument *** fn_sierpinski_y2_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

        ld hl, sta_ck2          ; save caller parameter fn_sierpinski_x3_
        ld e, (hl)              ; pick auxiliary stack pointer
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; HL= auxiliary stack pointer
        ld de, (fn_sierpinski_x3_)       ; caller parameter value
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        ld hl, (sta_ck2)        ; reserve saved parameter
        inc hl                  ;
        inc hl                  ;
        ld (sta_ck2), hl        ;
        ld hl, fn_sierpinski_x3_            ; argument *** fn_sierpinski_x3_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

        ld hl, sta_ck2          ; save caller parameter fn_sierpinski_y3_
        ld e, (hl)              ; pick auxiliary stack pointer
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; HL= auxiliary stack pointer
        ld de, (fn_sierpinski_y3_)       ; caller parameter value
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        ld hl, (sta_ck2)        ; reserve saved parameter
        inc hl                  ;
        inc hl                  ;
        ld (sta_ck2), hl        ;
        ld hl, fn_sierpinski_y3_            ; argument *** fn_sierpinski_y3_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

        ld hl, sta_ck2          ; save caller parameter fn_sierpinski_level_
        ld e, (hl)              ; pick auxiliary stack pointer
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; HL= auxiliary stack pointer
        ld de, (fn_sierpinski_level_)       ; caller parameter value
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        ld hl, (sta_ck2)        ; reserve saved parameter
        inc hl                  ;
        inc hl                  ;
        ld (sta_ck2), hl        ;
        ld hl, fn_sierpinski_level_            ; argument *** fn_sierpinski_level_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

                                ; (FunctionDeclaration) function body
                                ; (IfStatement) ***expression<=0*** test
                                ; (Identifier) variable * fn_sierpinski_level_ *
        ld hl, fn_sierpinski_level_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_level_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * <= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: <=
        ld de, 1                ; assume condition=true
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, les_004          ; same sign
        bit 7, h                ; left negative?
        jp nz, leq_003          ; negative <= positive is true
        dec e                   ; positive <= negative is false
        jp leq_003              ;
les_004 xor a                   ;
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_003           ; if <, true -> skip change
        jp z, leq_003           ; if =, true -> skip change
        dec e                   ; condition=false
leq_003 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_001           ;
                                ; (Identifier) variable * fn_sierpinski_x1_ *
        ld hl, fn_sierpinski_x1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_y1_ *
        ld hl, fn_sierpinski_y1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (CallExpression) moveTo, move current point
        pop bc                  ; get y-coord value
        pop hl                  ; get y-coord address, unused
        pop de                  ; get x-coord value
        pop hl                  ; get x-coord address, unused
        ld hl, ctx_x              ; save values in canvas object
        ld (hl), e              ;
        ld hl, ctx_y              ;
        ld (hl), c              ;

                                ; (Identifier) variable * fn_sierpinski_x2_ *
        ld hl, fn_sierpinski_x2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_y2_ *
        ld hl, fn_sierpinski_y2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y2_)          ; variable content
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

                                ; (Identifier) variable * fn_sierpinski_x3_ *
        ld hl, fn_sierpinski_x3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_y3_ *
        ld hl, fn_sierpinski_y3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y3_)          ; variable content
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

                                ; (Identifier) variable * fn_sierpinski_x1_ *
        ld hl, fn_sierpinski_x1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_y1_ *
        ld hl, fn_sierpinski_y1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y1_)          ; variable content
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

        jp ski_002              ; (IfStatement) ***expression<=0*** skips else
els_001                         ; else

                                ; (CallExpression): regular call prep ***sierpinski_***

                                ; (Identifier) variable * fn_sierpinski_level_ *
        ld hl, fn_sierpinski_level_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_level_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
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

                                ; (Identifier) variable * fn_sierpinski_y1_ *
        ld hl, fn_sierpinski_y1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_y3_ *
        ld hl, fn_sierpinski_y3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y3_)          ; variable content
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

                                ; (Identifier) variable * fn_sierpinski_x1_ *
        ld hl, fn_sierpinski_x1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_x3_ *
        ld hl, fn_sierpinski_x3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x3_)          ; variable content
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

                                ; (Identifier) variable * fn_sierpinski_y1_ *
        ld hl, fn_sierpinski_y1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_y2_ *
        ld hl, fn_sierpinski_y2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y2_)          ; variable content
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

                                ; (Identifier) variable * fn_sierpinski_x1_ *
        ld hl, fn_sierpinski_x1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_x2_ *
        ld hl, fn_sierpinski_x2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x2_)          ; variable content
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

                                ; (Identifier) variable * fn_sierpinski_y1_ *
        ld hl, fn_sierpinski_y1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_x1_ *
        ld hl, fn_sierpinski_x1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x1_)          ; variable content
        push hl                 ; >>> push variable content

        call sierpinski_            ; (CallExpression): call ***sierpinski_***

                                ; (CallExpression): regular call prep ***sierpinski_***

                                ; (Identifier) variable * fn_sierpinski_level_ *
        ld hl, fn_sierpinski_level_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_level_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
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

                                ; (Identifier) variable * fn_sierpinski_y2_ *
        ld hl, fn_sierpinski_y2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_y3_ *
        ld hl, fn_sierpinski_y3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y3_)          ; variable content
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

                                ; (Identifier) variable * fn_sierpinski_x2_ *
        ld hl, fn_sierpinski_x2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_x3_ *
        ld hl, fn_sierpinski_x3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x3_)          ; variable content
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

                                ; (Identifier) variable * fn_sierpinski_y2_ *
        ld hl, fn_sierpinski_y2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_x2_ *
        ld hl, fn_sierpinski_x2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_y1_ *
        ld hl, fn_sierpinski_y1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_y2_ *
        ld hl, fn_sierpinski_y2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y2_)          ; variable content
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

                                ; (Identifier) variable * fn_sierpinski_x1_ *
        ld hl, fn_sierpinski_x1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_x2_ *
        ld hl, fn_sierpinski_x2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x2_)          ; variable content
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

        call sierpinski_            ; (CallExpression): call ***sierpinski_***

                                ; (CallExpression): regular call prep ***sierpinski_***

                                ; (Identifier) variable * fn_sierpinski_level_ *
        ld hl, fn_sierpinski_level_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_level_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
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

                                ; (Identifier) variable * fn_sierpinski_y3_ *
        ld hl, fn_sierpinski_y3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_x3_ *
        ld hl, fn_sierpinski_x3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_y2_ *
        ld hl, fn_sierpinski_y2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_y3_ *
        ld hl, fn_sierpinski_y3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y3_)          ; variable content
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

                                ; (Identifier) variable * fn_sierpinski_x2_ *
        ld hl, fn_sierpinski_x2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_x3_ *
        ld hl, fn_sierpinski_x3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x3_)          ; variable content
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

                                ; (Identifier) variable * fn_sierpinski_y1_ *
        ld hl, fn_sierpinski_y1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_y3_ *
        ld hl, fn_sierpinski_y3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_y3_)          ; variable content
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

                                ; (Identifier) variable * fn_sierpinski_x1_ *
        ld hl, fn_sierpinski_x1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sierpinski_x3_ *
        ld hl, fn_sierpinski_x3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sierpinski_x3_)          ; variable content
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

        call sierpinski_            ; (CallExpression): call ***sierpinski_***

ski_002                         ; (IfStatement) ***expression<=0*** end of...

fst_005                         ; (FunctionDeclaration) recover return address (general)
        ld hl, sta_ck2          ; restore saved parameter fn_sierpinski_level_
        ld e, (hl)              ; pick auxiliary stack pointer
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; HL= auxiliary stack pointer
        dec hl                  ; saved parameter high byte
        ld d, (hl)              ;
        dec hl                  ; saved parameter low byte
        ld e, (hl)              ;
        ld (sta_ck2), hl        ; release saved parameter
        ld hl, fn_sierpinski_level_            ; restore caller parameter
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        ld hl, sta_ck2          ; restore saved parameter fn_sierpinski_y3_
        ld e, (hl)              ; pick auxiliary stack pointer
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; HL= auxiliary stack pointer
        dec hl                  ; saved parameter high byte
        ld d, (hl)              ;
        dec hl                  ; saved parameter low byte
        ld e, (hl)              ;
        ld (sta_ck2), hl        ; release saved parameter
        ld hl, fn_sierpinski_y3_            ; restore caller parameter
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        ld hl, sta_ck2          ; restore saved parameter fn_sierpinski_x3_
        ld e, (hl)              ; pick auxiliary stack pointer
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; HL= auxiliary stack pointer
        dec hl                  ; saved parameter high byte
        ld d, (hl)              ;
        dec hl                  ; saved parameter low byte
        ld e, (hl)              ;
        ld (sta_ck2), hl        ; release saved parameter
        ld hl, fn_sierpinski_x3_            ; restore caller parameter
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        ld hl, sta_ck2          ; restore saved parameter fn_sierpinski_y2_
        ld e, (hl)              ; pick auxiliary stack pointer
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; HL= auxiliary stack pointer
        dec hl                  ; saved parameter high byte
        ld d, (hl)              ;
        dec hl                  ; saved parameter low byte
        ld e, (hl)              ;
        ld (sta_ck2), hl        ; release saved parameter
        ld hl, fn_sierpinski_y2_            ; restore caller parameter
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        ld hl, sta_ck2          ; restore saved parameter fn_sierpinski_x2_
        ld e, (hl)              ; pick auxiliary stack pointer
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; HL= auxiliary stack pointer
        dec hl                  ; saved parameter high byte
        ld d, (hl)              ;
        dec hl                  ; saved parameter low byte
        ld e, (hl)              ;
        ld (sta_ck2), hl        ; release saved parameter
        ld hl, fn_sierpinski_x2_            ; restore caller parameter
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        ld hl, sta_ck2          ; restore saved parameter fn_sierpinski_y1_
        ld e, (hl)              ; pick auxiliary stack pointer
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; HL= auxiliary stack pointer
        dec hl                  ; saved parameter high byte
        ld d, (hl)              ;
        dec hl                  ; saved parameter low byte
        ld e, (hl)              ;
        ld (sta_ck2), hl        ; release saved parameter
        ld hl, fn_sierpinski_y1_            ; restore caller parameter
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        ld hl, sta_ck2          ; restore saved parameter fn_sierpinski_x1_
        ld e, (hl)              ; pick auxiliary stack pointer
        inc hl                  ;
        ld d, (hl)              ;
        ex de, hl               ; HL= auxiliary stack pointer
        dec hl                  ; saved parameter high byte
        ld d, (hl)              ;
        dec hl                  ; saved parameter low byte
        ld e, (hl)              ;
        ld (sta_ck2), hl        ; release saved parameter
        ld hl, fn_sierpinski_x1_            ; restore caller parameter
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
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
        ld (sta_ck2), hl        ; end of return address restore
fex_000 ret                     ; (FunctionDeclaration) end of...

mai_cod                         ; main code




                                ; (CallExpression): regular call prep ***sierpinski_***

        ld de, 4                ; (Literal) literal int: * 4 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 20                ; (Literal) literal int: * 20 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 120                ; (Literal) literal int: * 120 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 120                ; (Literal) literal int: * 120 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 70                ; (Literal) literal int: * 70 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 20                ; (Literal) literal int: * 20 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 20                ; (Literal) literal int: * 20 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call sierpinski_            ; (CallExpression): call ***sierpinski_***

                                ; (Literal) * 'Sierpinski recursive' *
        ld hl, stn_006          ; literal string address
        ld de, 20                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        ret                     ; end of code