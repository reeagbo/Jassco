; Generated with JAvaScript to ASSembly COmpiler, JASSCO v0. Boria Labs 2025.
; Directives -------------------------------------------------
        org 25000               ; initial code address
        jp mai_cod              ; jumps to main code

; Variable declarations --------------------------------------
        sta_ck2 defw 24500      ; auxiliary stack address
count_   defw 0                  ; (VariableDeclarator) variable int/bool
im_key_   defb 0, 0            ; (VariableDeclarator) empty string
        defs 32, 0xFF           ;
key_   defw 0                  ; (VariableDeclarator) key_ is a pointer
num1_   defw 0                  ; (VariableDeclarator) variable int/bool
num2_   defw 0                  ; (VariableDeclarator) variable int/bool
im_tex1_   defb 0, 0            ; (VariableDeclarator) empty string
        defs 32, 0xFF           ;
tex1_   defw 0                  ; (VariableDeclarator) tex1_ is a pointer
im_tex2_   defb 0, 0            ; (VariableDeclarator) empty string
        defs 32, 0xFF           ;
tex2_   defw 0                  ; (VariableDeclarator) tex2_ is a pointer
im_tex_   defb 0, 0            ; (VariableDeclarator) empty string
        defs 32, 0xFF           ;
tex_   defw 0                  ; (VariableDeclarator) tex_ is a pointer
im_str1_   defb 0, 0            ; (VariableDeclarator) empty string
        defs 32, 0xFF           ;
str1_   defw 0                  ; (VariableDeclarator) str1_ is a pointer
im_str2_   defb 0, 0            ; (VariableDeclarator) empty string
        defs 32, 0xFF           ;
str2_   defw 0                  ; (VariableDeclarator) str2_ is a pointer
im_cha1_   defb 0, 0            ; (VariableDeclarator) empty string
        defs 32, 0xFF           ;
cha1_   defw 0                  ; (VariableDeclarator) cha1_ is a pointer
i_   defw 0                  ; (VariableDeclarator) variable int/bool
stn_000 defb 15, 0, "Recursion tests"        ; (Literal) string
n_   defw 0                ; (FunctionDeclaration) literal int/bool
stn_006 defb 14, 0, "Printout tests"        ; (Literal) string
numa_   defb 3, 1               ; (VariableDeclarator) integer matrix (cols, rows)
        defw 11, 22, 33    ; matrix declaration
stn_007 defb 5, 0, "adios"        ; (Literal) string
stn_010 defb 5, 0, "hola "        ; (Literal) string
stn_012 defb 13, 0, "Console tests"        ; (Literal) string
stn_013 defb 28, 0, "Output: he100200hellogoodbye"        ; (Literal) string
stn_016 defb 5, 0, "hello"        ; (Literal) string
stn_017 defb 7, 0, "goodbye"        ; (Literal) string
stn_018 defb 17, 0, "String operations"        ; (Literal) string
stn_019 defb 0, 0, ""        ; (Literal) string
stn_020 defb 5, 0, "hello"        ; (Literal) string
stn_021 defb 0, 0, ""        ; (Literal) string
stn_022 defb 16, 0, "literal: goodbye"        ; (Literal) string
stn_023 defb 18, 0, "Variable (hello): "        ; (Literal) string
stn_024 defb 12, 0, "CharAt (e): "        ; (Literal) string
stn_025 defb 21, 0, "String copy (hello): "        ; (Literal) string
stn_026 defb 26, 0, "AssignmentExpression tests"        ; (Literal) string
stn_027 defb 14, 0, "Integer/String"        ; (Literal) string
stn_028 defb 6, 0, "Hello!"        ; (Literal) string
stn_029 defb 6, 0, "(10): "        ; (Literal) string
stn_030 defb 11, 0, ". (Hello!) "        ; (Literal) string
stn_031 defb 17, 0, "Shift assignments"        ; (Literal) string
stn_033 defb 27, 0, "<<= The number is (16384): "        ; (Literal) string
stn_035 defb 24, 0, ">>= The number is (64): "        ; (Literal) string
stn_036 defb 20, 0, "Assignment operators"        ; (Literal) string
stn_037 defb 23, 0, "+= The number is (25): "        ; (Literal) string
stn_038 defb 22, 0, "-= The number is (5): "        ; (Literal) string
stn_039 defb 24, 0, "*= The number is (150): "        ; (Literal) string
stn_040 defb 22, 0, "/= The number is (1): "        ; (Literal) string
stn_041 defb 22, 0, "%= The number is (5): "        ; (Literal) string
stn_042 defb 22, 0, "&= The number is (1): "        ; (Literal) string
stn_043 defb 23, 0, "|= The number is (31): "        ; (Literal) string
stn_044 defb 23, 0, "^= The number is (30): "        ; (Literal) string
stn_045 defb 22, 0, "BinaryExpression tests"        ; (Literal) string
stn_046 defb 21, 0, "Add/Subtraction tests"        ; (Literal) string
stn_047 defb 29, 0, "Multiplication/division tests"        ; (Literal) string
stn_048 defb 7, 0, "10*10= "        ; (Literal) string
stn_049 defb 6, 0, "11/2= "        ; (Literal) string
stn_050 defb 6, 0, "11%2= "        ; (Literal) string
stn_051 defb 13, 0, "Bitwise tests"        ; (Literal) string
stn_053 defb 10, 0, "<< 2 (64) "        ; (Literal) string
stn_055 defb 9, 0, ">> 2 (4) "        ; (Literal) string
stn_057 defb 9, 0, ">>> 2 (4)"        ; (Literal) string
stn_058 defb 16, 0, "Comparison tests"        ; (Literal) string
stn_062 defb 4, 0, "1==1"        ; (Literal) string
stn_066 defb 4, 0, "2==1"        ; (Literal) string
stn_070 defb 4, 0, "1==2"        ; (Literal) string
stn_074 defb 4, 0, "1!=1"        ; (Literal) string
stn_078 defb 4, 0, "2!=1"        ; (Literal) string
stn_082 defb 4, 0, "1!=2"        ; (Literal) string
stn_086 defb 3, 0, "1>1"        ; (Literal) string
stn_090 defb 3, 0, "2>1"        ; (Literal) string
stn_094 defb 3, 0, "1>2"        ; (Literal) string
stn_098 defb 3, 0, "1<1"        ; (Literal) string
stn_102 defb 3, 0, "2<1"        ; (Literal) string
stn_106 defb 3, 0, "1<2"        ; (Literal) string
stn_110 defb 4, 0, "1>=1"        ; (Literal) string
stn_114 defb 4, 0, "2>=1"        ; (Literal) string
stn_118 defb 4, 0, "1>=2"        ; (Literal) string
stn_122 defb 4, 0, "1<=1"        ; (Literal) string
stn_126 defb 4, 0, "2<=1"        ; (Literal) string
stn_130 defb 4, 0, "1<=2"        ; (Literal) string
stn_131 defb 18, 0, "Logical operations"        ; (Literal) string
stn_132 defb 19, 0, "The number is (1): "        ; (Literal) string
stn_133 defb 20, 0, "The number is (31): "        ; (Literal) string
stn_134 defb 20, 0, "The number is (30): "        ; (Literal) string
stn_135 defb 21, 0, "The number is (-16): "        ; (Literal) string
stn_136 defb 20, 0, "CallExpression tests"        ; (Literal) string
stn_137 defb 13, 0, "DoWhile tests"        ; (Literal) string
stn_141 defb 20, 0, "Number (stop at 5): "        ; (Literal) string
stn_143 defb 18, 0, "ForStatement tests"        ; (Literal) string
stn_144 defb 9, 0, "Ascending"        ; (Literal) string
stn_149 defb 19, 0, "Number (stop at 5):"        ; (Literal) string
stn_150 defb 10, 0, "Descending"        ; (Literal) string
stn_155 defb 19, 0, "Number (stop at 5):"        ; (Literal) string
stn_156 defb 9, 0, "For-Break"        ; (Literal) string
stn_164 defb 13, 0, "Stop at (3): "        ; (Literal) string
stn_165 defb 12, 0, "For-Continue"        ; (Literal) string
stn_173 defb 10, 0, "Skip (3): "        ; (Literal) string
stn_174 defb 9, 0, "For-Break"        ; (Literal) string
stn_182 defb 13, 0, "Stop at (3): "        ; (Literal) string
stn_183 defb 12, 0, "Nested Loops"        ; (Literal) string
stn_184 defb 8, 0, "(1 to 9)"        ; (Literal) string
stn_193 defb 25, 0, "FunctionDeclaration tests"        ; (Literal) string
stn_194 defb 17, 0, "IfStatement tests"        ; (Literal) string
stn_198 defb 12, 0, "Good morning"        ; (Literal) string
stn_202 defb 8, 0, "Good day"        ; (Literal) string
stn_203 defb 12, 0, "Good evening"        ; (Literal) string
stn_204 defb 6, 0, "Time: "        ; (Literal) string
stn_205 defb 12, 0, ", Greeting: "        ; (Literal) string
stn_209 defb 12, 0, "Good morning"        ; (Literal) string
stn_213 defb 8, 0, "Good day"        ; (Literal) string
stn_214 defb 12, 0, "Good evening"        ; (Literal) string
stn_215 defb 6, 0, "Time: "        ; (Literal) string
stn_216 defb 12, 0, ", Greeting: "        ; (Literal) string
stn_220 defb 12, 0, "Good morning"        ; (Literal) string
stn_224 defb 8, 0, "Good day"        ; (Literal) string
stn_225 defb 12, 0, "Good evening"        ; (Literal) string
stn_226 defb 6, 0, "Time: "        ; (Literal) string
stn_227 defb 12, 0, ", Greeting: "        ; (Literal) string
stn_228 defb 13, 0, "Literal tests"        ; (Literal) string
stn_229 defb 16, 0, "Identifier tests"        ; (Literal) string
stn_230 defb 21, 0, "SwitchStatement tests"        ; (Literal) string
stn_231 defb 0, 0, ""        ; (Literal) string
stn_234 defb 6, 0, "Monday"        ; (Literal) string
stn_236 defb 7, 0, "Tuesday"        ; (Literal) string
stn_238 defb 9, 0, "Wednesday"        ; (Literal) string
stn_239 defb 10, 0, "(Tuesday):"        ; (Literal) string
stn_240 defb 22, 0, "UptateExpression tests"        ; (Literal) string
stn_241 defb 9, 0, "Ascending"        ; (Literal) string
stn_246 defb 19, 0, "Number (stop at 5):"        ; (Literal) string
stn_247 defb 10, 0, "Descending"        ; (Literal) string
stn_252 defb 19, 0, "Number (stop at 5):"        ; (Literal) string
stn_253 defb 25, 0, "VariableDeclaration tests"        ; (Literal) string
stn_254 defb 20, 0, "WhileStatement tests"        ; (Literal) string
stn_255 defb 14, 0, "Function tests"        ; (Literal) string
num3_   defw 0                ; (FunctionDeclaration) literal int/bool
num4_   defw 0                ; (FunctionDeclaration) literal int/bool
stn_258 defb 13, 0, "6 + 5 (11) = "        ; (Literal) string
stn_259 defb 11, 0, "Graph Tests"        ; (Literal) string
ctx           defw 0         ; (VariableDeclarator) canvas
ctx_x         defw 128       ;
ctx_y         defw 96        ;
stn_264 defb 17, 0, "Data Access Tests"        ; (Literal) string
arr1_   defb 4, 1               ; (VariableDeclarator) integer matrix (cols, rows)
        defw 1, 2, 3, 4    ; matrix declaration
stn_265 defb 20, 0, "Before: arr1[2](3): "        ; (Literal) string
stn_266 defb 20, 0, "After: arr1[2](10): "        ; (Literal) string
stn_267 defb 23, 0, "Before, mat1[1][2](6): "        ; (Literal) string
stn_268 defb 23, 0, "After, mat1[1][2](10): "        ; (Literal) string
dic1_   defw 3                  ; (VariableDeclarator) dictionary
        defw 3, 6              ; (VariableDeclarator) dictionary, integers
        defw 5, 10              ; (VariableDeclarator) dictionary, integers
        defw 4, 8              ; (VariableDeclarator) dictionary, integers
stn_269 defb 21, 0, "Before dic1[5])(10): "        ; (Literal) string
stn_273 defb 21, 0, "Before dic1[5])(99): "        ; (Literal) string
stn_277 defb 24, 0, "16-bit signed operations"        ; (Literal) string
stn_278 defb 14, 0, "100+10 (110): "        ; (Literal) string
stn_279 defb 15, 0, "-100+10 (-90): "        ; (Literal) string
stn_280 defb 13, 0, "100-10 (90): "        ; (Literal) string
stn_281 defb 16, 0, "-100-10 (-110): "        ; (Literal) string
stn_282 defb 13, 0, "100/10 (10): "        ; (Literal) string
stn_283 defb 15, 0, "-100/10 (-10): "        ; (Literal) string
stn_284 defb 15, 0, "100/-10 (-10): "        ; (Literal) string
stn_285 defb 15, 0, "-100/-10 (10): "        ; (Literal) string
stn_286 defb 15, 0, "100*10 (1000): "        ; (Literal) string
stn_287 defb 17, 0, "-100*10 (-1000): "        ; (Literal) string
stn_288 defb 17, 0, "100*-10 (-1000): "        ; (Literal) string
stn_289 defb 17, 0, "-100*-10 (1000): "        ; (Literal) string
stn_290 defb 12, 0, "Memory tests"        ; (Literal) string
stn_291 defb 12, 0, "Before (0): "        ; (Literal) string
stn_292 defb 13, 0, "After (255): "        ; (Literal) string
stn_293 defb 26, 0, "Last block position (16): "        ; (Literal) string
stn_294 defb 17, 0, "String operations"        ; (Literal) string
stn_295 defb 10, 0, "0) literal"        ; (Literal) string
im_text1_   defb 15, 0, "1) initial asg."       ; (VariableDeclarator) variable string, other length
text1_   defw 0                  ; (VariableDeclarator) text1_ is a pointer
im_text2_   defb 0, 0            ; (VariableDeclarator) empty string
        defs 32, 0xFF           ;
text2_   defw 0                  ; (VariableDeclarator) text2_ is a pointer
stn_296 defb 14, 0, "2) second asg."        ; (Literal) string
stn_297 defb 17, 0, "3) var2var asg.: "        ; (Literal) string
im_cars_   defb 3, 1            ; (VariableDeclarator) string matrix (cols, rows)
stm_298 defb 4, 0, "Saab"        ;
        defs 26                 ;
stm_299 defb 5, 0, "Volvo"        ;
        defs 25                 ;
stm_300 defb 3, 0, "BMW"        ;
        defs 27                 ;
cars_   defb 3, 1               ; (VariableDeclarator) string matrix (cols, rows)
        defw im_cars_+2        ; element 0
        defw im_cars_+34        ; element 1
        defw im_cars_+66        ; element 2
stn_301 defb 23, 0, "array pos. lit (Saab): "        ; (Literal) string
stn_303 defb 24, 0, "array pos. var (Volvo): "        ; (Literal) string
stn_305 defb 14, 0, "4) Array print"        ; (Literal) string
stn_310 defb 9, 0, "Position "        ; (Literal) string
stn_311 defb 2, 0, ": "        ; (Literal) string
stn_313 defb 25, 0, "5) Comparison (different)"        ; (Literal) string
stn_314 defb 4, 0, "adix"        ; (Literal) string
stn_315 defb 4, 0, "adio"        ; (Literal) string
stn_320 defb 5, 0, "same!"        ; (Literal) string
stn_321 defb 10, 0, "different!"        ; (Literal) string

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
; File: memory.asc. Basic memory management for z80 computers

; mem_rea: read memory position (Memory.read (address))
; it can be used for 1 bytes (E register) or two bytes (DE register)
mem_rea pop ix			; <<< pop return address
    	pop hl			; <<< variable value
    	pop de			; <<< variable address
		
		ld e, (hl)		; read 1st byte
		ld d, 0		    ; read 2nd byte
		
		push de			; >>> push address, dummy
		push de			; >>> push value
		push ix			; >>> push return address
		ret

; mem_wri: write a memory position (Memory.write (address, value))
; 8 bits only for simplicity
; note that there is no check for ROM addresses.
mem_wri	pop ix			; <<< pop return address
    	pop de			; <<< value value
    	pop bc			; <<< value address
    	pop hl			; <<< address value
    	pop bc			; <<< address address

		ld (hl), e		; read 1st byte
		push ix			; >>> push return address
		ret

; mem_cop: move a memory block (Memory.copy (origin, destination, size))
; all 16-bit values
mem_cop	pop ix			; <<< pop return address
    	pop bc			; <<< size value
    	pop de			; <<< size address
     	pop hl			; <<< origin value
    	pop de			; <<< origin address
    	pop de			; <<< dest value
    	pop af			; <<< dest address   	
 
mmv_loo ld a, (de)
 		ld (hl), a
 		inc hl
 		inc de
 		dec bc
 		push hl
 		ld hl, 0
 		sbc hl, bc
 		pop hl
 		jr nz, mmv_loo
 		
    	push ix			; >>> push return address
    	ret

; Program code -----------------------------------------------






                                ; (VariableDeclarator) * count_ *
                                ; (Identifier) variable * count_ *
        ld hl, count_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (count_)          ; variable content
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

                                ; (VariableDeclarator) * = * string array
        ld de, im_key_         ; * key_ *
        ld hl, key_            ;
        ld (hl), e              ; immutable address to pointer variable
        inc hl                  ;
        ld (hl), d              ;

                                ; (VariableDeclarator) * num1_ *
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

                                ; (VariableDeclarator) * num2_ *
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
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

                                ; (VariableDeclarator) * = * string array
        ld de, im_tex1_         ; * tex1_ *
        ld hl, tex1_            ;
        ld (hl), e              ; immutable address to pointer variable
        inc hl                  ;
        ld (hl), d              ;

                                ; (VariableDeclarator) * = * string array
        ld de, im_tex2_         ; * tex2_ *
        ld hl, tex2_            ;
        ld (hl), e              ; immutable address to pointer variable
        inc hl                  ;
        ld (hl), d              ;

                                ; (VariableDeclarator) * = * string array
        ld de, im_tex_         ; * tex_ *
        ld hl, tex_            ;
        ld (hl), e              ; immutable address to pointer variable
        inc hl                  ;
        ld (hl), d              ;

                                ; (VariableDeclarator) * = * string array
        ld de, im_str1_         ; * str1_ *
        ld hl, str1_            ;
        ld (hl), e              ; immutable address to pointer variable
        inc hl                  ;
        ld (hl), d              ;

                                ; (VariableDeclarator) * = * string array
        ld de, im_str2_         ; * str2_ *
        ld hl, str2_            ;
        ld (hl), e              ; immutable address to pointer variable
        inc hl                  ;
        ld (hl), d              ;

                                ; (VariableDeclarator) * = * string array
        ld de, im_cha1_         ; * cha1_ *
        ld hl, cha1_            ;
        ld (hl), e              ; immutable address to pointer variable
        inc hl                  ;
        ld (hl), d              ;

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

                                ; (Literal) * 'Recursion tests' *
        ld hl, stn_000          ; literal string address
        ld de, 15                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


; (FunctionDeclaration) Function: summatory_
summatory_                        ; (FunctionDeclaration) *** summatory_ ***
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
        ld hl, n_            ; argument *** n_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

                                ; (FunctionDeclaration) function body
                                ; (IfStatement) ***expression<=0*** test
                                ; (Identifier) variable * n_ *
        ld hl, n_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (n_)          ; variable content
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
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_004           ; if <, true -> skip change
        jp z, leq_004           ; if =, true -> skip change
        dec e                   ; condition=false
leq_004 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_002           ;
                                ; (ReturnStatement) return expression
        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value


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

        jp ski_003              ; (IfStatement) ***expression<=0*** skips else
els_002                         ; else

ski_003                         ; (IfStatement) ***expression<=0*** end of...

                                ; (ReturnStatement) return expression
                                ; (Identifier) variable * n_ *
        ld hl, n_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (n_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (CallExpression): regular call prep ***summatory_***

                                ; (Identifier) variable * n_ *
        ld hl, n_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (n_)          ; variable content
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

        call summatory_            ; (CallExpression): call ***summatory_***

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

fst_005                         ; (FunctionDeclaration) recover return address (general)
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
fex_001 ret                     ; (FunctionDeclaration) end of...


                                ; (CallExpression): regular call prep ***summatory_***

        ld de, 5                ; (Literal) literal int: * 5 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call summatory_            ; (CallExpression): call ***summatory_***

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'Printout tests' *
        ld hl, stn_006          ; literal string address
        ld de, 14                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        ld hl, numa_          ; (VariableDeclarator) array/matrix assignment
        inc hl                  ; skip dimensions
        inc hl                  ;

        ld de, 11                ; (Literal) literal int: * 11 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 22                ; (Literal) literal int: * 22 *
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

                                ; (VariableDeclarator) numa_, end of...

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
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

                                ; (Identifier) variable * str1_ *
        ld hl, str1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (str1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'adios' *
        ld hl, stn_007          ; literal string address
        ld de, 5                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_num            ; (CallExpression) print literal number

        ld de, " "              ; (Literal) literal char: * " " * (ascii: 32d)
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_chr            ; (CallExpression) print literal char

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld de, " "              ; (Literal) literal char: * " " * (ascii: 32d)
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_chr            ; (CallExpression) print literal char

                                ; (Literal) * 'hola ' *
        ld hl, stn_010          ; literal string address
        ld de, 5                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * str1_ *
        ld hl, str1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (str1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_str            ; (CallExpression) print literal string

        ld de, " "              ; (Literal) literal char: * " " * (ascii: 32d)
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_chr            ; (CallExpression) print literal char

                                ; (Identifier) variable * numa_ *
        ld hl, numa_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (numa_)          ; variable content
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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Console tests' *
        ld hl, stn_012          ; literal string address
        ld de, 13                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Output: he100200hellogoodbye' *
        ld hl, stn_013          ; literal string address
        ld de, 28                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        ld de, "h"              ; (Literal) literal char: * "h" * (ascii: 104d)
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_chr            ; (CallExpression) print char

        ld de, "e"              ; (Literal) literal char: * "e" * (ascii: 101d)
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_chr            ; (CallExpression) print char


        ld de, 100                ; (Literal) literal int: * 100 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_num            ; (CallExpression) print number

        ld de, 200                ; (Literal) literal int: * 200 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call prt_num            ; (CallExpression) print number


                                ; (Literal) * 'hello' *
        ld hl, stn_016          ; literal string address
        ld de, 5                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print string

                                ; (Literal) * 'goodbye' *
        ld hl, stn_017          ; literal string address
        ld de, 7                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print string



                                ; (Literal) * 'String operations' *
        ld hl, stn_018          ; literal string address
        ld de, 17                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * cha1_ *
        ld hl, cha1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (cha1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * '' *
        ld hl, stn_019          ; literal string address
        ld de, 0                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

                                ; (Identifier) variable * str1_ *
        ld hl, str1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (str1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'hello' *
        ld hl, stn_020          ; literal string address
        ld de, 5                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

                                ; (Identifier) variable * str2_ *
        ld hl, str2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (str2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * '' *
        ld hl, stn_021          ; literal string address
        ld de, 0                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

                                ; (Literal) * 'literal: goodbye' *
        ld hl, stn_022          ; literal string address
        ld de, 16                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Variable (hello): ' *
        ld hl, stn_023          ; literal string address
        ld de, 18                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * str1_ *
        ld hl, str1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (str1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * cha1_ *
        ld hl, cha1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (cha1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * str1_ *
        ld hl, str1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (str1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (CallExpression) String *** charAt ***

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

                                ; (Literal) * 'CharAt (e): ' *
        ld hl, stn_024          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * cha1_ *
        ld hl, cha1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (cha1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * str2_ *
        ld hl, str2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (str2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * str1_ *
        ld hl, str1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (str1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

                                ; (Literal) * 'String copy (hello): ' *
        ld hl, stn_025          ; literal string address
        ld de, 21                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * str2_ *
        ld hl, str2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (str2_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'AssignmentExpression tests' *
        ld hl, stn_026          ; literal string address
        ld de, 26                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Integer/String' *
        ld hl, stn_027          ; literal string address
        ld de, 14                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
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

                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Hello!' *
        ld hl, stn_028          ; literal string address
        ld de, 6                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

                                ; (Literal) * '(10): ' *
        ld hl, stn_029          ; literal string address
        ld de, 6                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

                                ; (Literal) * '. (Hello!) ' *
        ld hl, stn_030          ; literal string address
        ld de, 11                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'Shift assignments' *
        ld hl, stn_031          ; literal string address
        ld de, 17                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1024                ; (Literal) literal int: * 1024 *
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 4                ; (Literal) literal int: * 4 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (AssignmentExpression) * <<= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        ld b, c                 ; number of shifts
asg_032 add hl, hl              ; shift left
        djnz asg_032            ;
        push hl                 ;
        pop de                  ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Literal) * '<<= The number is (16384): ' *
        ld hl, stn_033          ; literal string address
        ld de, 27                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1024                ; (Literal) literal int: * 1024 *
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 4                ; (Literal) literal int: * 4 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (AssignmentExpression) * >>= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        ld b, c                 ; number of shifts
asg_034 srl h                   ; shift right 1
        rr l                    ; shift right 2
        djnz asg_034            ;
        push hl                 ;
        pop de                  ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Literal) * '>>= The number is (64): ' *
        ld hl, stn_035          ; literal string address
        ld de, 24                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'Assignment operators' *
        ld hl, stn_036          ; literal string address
        ld de, 20                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 15                ; (Literal) literal int: * 15 *
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
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

                                ; (Literal) * '+= The number is (25): ' *
        ld hl, stn_037          ; literal string address
        ld de, 23                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 15                ; (Literal) literal int: * 15 *
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
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

                                ; (Literal) * '-= The number is (5): ' *
        ld hl, stn_038          ; literal string address
        ld de, 22                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 15                ; (Literal) literal int: * 15 *
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (AssignmentExpression) * *= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push hl                 ;
        push bc                 ;
        call mul_16b            ;
        pop de                  ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Literal) * '*= The number is (150): ' *
        ld hl, stn_039          ; literal string address
        ld de, 24                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 15                ; (Literal) literal int: * 15 *
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (AssignmentExpression) * /= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push hl                 ;
        push bc                 ;
        call div_16b            ;  (AssignmentExpression)
        pop de                  ; DE has the result
        pop hl                  ; remainder, not used

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Literal) * '/= The number is (1): ' *
        ld hl, stn_040          ; literal string address
        ld de, 22                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 15                ; (Literal) literal int: * 15 *
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (AssignmentExpression) * %= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push hl                 ;
        push bc                 ;
        call div_16b            ;  (AssignmentExpression)
        pop hl                  ; result, not used
        pop de                  ; remainder, DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Literal) * '%= The number is (5): ' *
        ld hl, stn_041          ; literal string address
        ld de, 22                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 15                ; (Literal) literal int: * 15 *
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 17                ; (Literal) literal int: * 17 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (AssignmentExpression) * &= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        ld a, h                 ; MSB
        and b                   ;
        ld d, a                 ;
        ld a, l                 ; LSB
        and c                   ;
        ld e, a                 ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Literal) * '&= The number is (1): ' *
        ld hl, stn_042          ; literal string address
        ld de, 22                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 15                ; (Literal) literal int: * 15 *
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 17                ; (Literal) literal int: * 17 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (AssignmentExpression) * |= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        ld a, h                 ; MSB
        or b                   ;
        ld d, a                 ;
        ld a, l                 ; LSB
        or c                   ;
        ld e, a                 ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Literal) * '|= The number is (31): ' *
        ld hl, stn_043          ; literal string address
        ld de, 23                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 15                ; (Literal) literal int: * 15 *
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 17                ; (Literal) literal int: * 17 *
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

                                ; (Literal) * '^= The number is (30): ' *
        ld hl, stn_044          ; literal string address
        ld de, 23                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'BinaryExpression tests' *
        ld hl, stn_045          ; literal string address
        ld de, 22                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Add/Subtraction tests' *
        ld hl, stn_046          ; literal string address
        ld de, 21                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Multiplication/division tests' *
        ld hl, stn_047          ; literal string address
        ld de, 29                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 10                ; (Literal) literal int: * 10 *
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

                                ; (Literal) * '10*10= ' *
        ld hl, stn_048          ; literal string address
        ld de, 7                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 11                ; (Literal) literal int: * 11 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

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

                                ; (Literal) * '11/2= ' *
        ld hl, stn_049          ; literal string address
        ld de, 6                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 11                ; (Literal) literal int: * 11 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

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

                                ; (Literal) * '11%2= ' *
        ld hl, stn_050          ; literal string address
        ld de, 6                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'Bitwise tests' *
        ld hl, stn_051          ; literal string address
        ld de, 13                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * << * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld b, c                 ; number of shifts
bsh_052 add hl, hl              ; shift left
        djnz bsh_052            ;
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

                                ; (Literal) * '<< 2 (64) ' *
        ld hl, stn_053          ; literal string address
        ld de, 10                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 16                ; (Literal) literal int: * 16 *
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * >> * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld b, c                 ; number of shifts
bsh_054 sra h                   ; shift right 1
        rr l                    ; shift right 2
        djnz bsh_054            ;
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

                                ; (Literal) * '>> 2 (4) ' *
        ld hl, stn_055          ; literal string address
        ld de, 9                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 16                ; (Literal) literal int: * 16 *
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * >> * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld b, c                 ; number of shifts
bsh_056 sra h                   ; shift right 1
        rr l                    ; shift right 2
        djnz bsh_056            ;
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

                                ; (Literal) * '>>> 2 (4)' *
        ld hl, stn_057          ; literal string address
        ld de, 9                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'Comparison tests' *
        ld hl, stn_058          ; literal string address
        ld de, 16                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (IfStatement) ***1==1*** test
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

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
        jp z, equ_061           ; if =, true -> skip change
        dec e                   ; condition=false
equ_061 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_059           ;
                                ; (Literal) * '1==1' *
        ld hl, stn_062          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_060              ; (IfStatement) ***1==1*** skips else
els_059                         ; else

ski_060                         ; (IfStatement) ***1==1*** end of...

                                ; (IfStatement) ***2==1*** test
        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

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
        jp z, equ_065           ; if =, true -> skip change
        dec e                   ; condition=false
equ_065 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_063           ;
                                ; (Literal) * '2==1' *
        ld hl, stn_066          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_064              ; (IfStatement) ***2==1*** skips else
els_063                         ; else

ski_064                         ; (IfStatement) ***2==1*** end of...

                                ; (IfStatement) ***1==2*** test
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 2                ; (Literal) literal int: * 2 *
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
        jp z, equ_069           ; if =, true -> skip change
        dec e                   ; condition=false
equ_069 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_067           ;
                                ; (Literal) * '1==2' *
        ld hl, stn_070          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_068              ; (IfStatement) ***1==2*** skips else
els_067                         ; else

ski_068                         ; (IfStatement) ***1==2*** end of...

                                ; (IfStatement) ***1!=1*** test
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 1                ; (Literal) literal int: * 1 *
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
        jp nz, neq_073           ; if !=, true -> skip change
        dec e                   ; condition=false
neq_073 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_071           ;
                                ; (Literal) * '1!=1' *
        ld hl, stn_074          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_072              ; (IfStatement) ***1!=1*** skips else
els_071                         ; else

ski_072                         ; (IfStatement) ***1!=1*** end of...

                                ; (IfStatement) ***2!=1*** test
        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 1                ; (Literal) literal int: * 1 *
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
        jp nz, neq_077           ; if !=, true -> skip change
        dec e                   ; condition=false
neq_077 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_075           ;
                                ; (Literal) * '2!=1' *
        ld hl, stn_078          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_076              ; (IfStatement) ***2!=1*** skips else
els_075                         ; else

ski_076                         ; (IfStatement) ***2!=1*** end of...

                                ; (IfStatement) ***1!=2*** test
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 2                ; (Literal) literal int: * 2 *
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
        jp nz, neq_081           ; if !=, true -> skip change
        dec e                   ; condition=false
neq_081 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_079           ;
                                ; (Literal) * '1!=2' *
        ld hl, stn_082          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_080              ; (IfStatement) ***1!=2*** skips else
els_079                         ; else

ski_080                         ; (IfStatement) ***1!=2*** end of...

                                ; (IfStatement) ***1>1*** test
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 1                ; (Literal) literal int: * 1 *
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
        jp m, mor_085           ; if <, false -> change
        jp z, mor_085           ; if =, false -> change
        inc e                   ; condition=true
mor_085 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_083           ;
                                ; (Literal) * '1>1' *
        ld hl, stn_086          ; literal string address
        ld de, 3                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_084              ; (IfStatement) ***1>1*** skips else
els_083                         ; else

ski_084                         ; (IfStatement) ***1>1*** end of...

                                ; (IfStatement) ***2>1*** test
        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 1                ; (Literal) literal int: * 1 *
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
        jp m, mor_089           ; if <, false -> change
        jp z, mor_089           ; if =, false -> change
        inc e                   ; condition=true
mor_089 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_087           ;
                                ; (Literal) * '2>1' *
        ld hl, stn_090          ; literal string address
        ld de, 3                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_088              ; (IfStatement) ***2>1*** skips else
els_087                         ; else

ski_088                         ; (IfStatement) ***2>1*** end of...

                                ; (IfStatement) ***1>2*** test
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 2                ; (Literal) literal int: * 2 *
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
        jp m, mor_093           ; if <, false -> change
        jp z, mor_093           ; if =, false -> change
        inc e                   ; condition=true
mor_093 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_091           ;
                                ; (Literal) * '1>2' *
        ld hl, stn_094          ; literal string address
        ld de, 3                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_092              ; (IfStatement) ***1>2*** skips else
els_091                         ; else

ski_092                         ; (IfStatement) ***1>2*** end of...

                                ; (IfStatement) ***1<1*** test
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 1                ; (Literal) literal int: * 1 *
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
        jp nc, les_097          ; if >=, false -> change
        inc e                   ; condition=true
les_097 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_095           ;
                                ; (Literal) * '1<1' *
        ld hl, stn_098          ; literal string address
        ld de, 3                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_096              ; (IfStatement) ***1<1*** skips else
els_095                         ; else

ski_096                         ; (IfStatement) ***1<1*** end of...

                                ; (IfStatement) ***2<1*** test
        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 1                ; (Literal) literal int: * 1 *
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
        jp nc, les_101          ; if >=, false -> change
        inc e                   ; condition=true
les_101 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_099           ;
                                ; (Literal) * '2<1' *
        ld hl, stn_102          ; literal string address
        ld de, 3                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_100              ; (IfStatement) ***2<1*** skips else
els_099                         ; else

ski_100                         ; (IfStatement) ***2<1*** end of...

                                ; (IfStatement) ***1<2*** test
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 2                ; (Literal) literal int: * 2 *
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
        jp nc, les_105          ; if >=, false -> change
        inc e                   ; condition=true
les_105 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_103           ;
                                ; (Literal) * '1<2' *
        ld hl, stn_106          ; literal string address
        ld de, 3                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_104              ; (IfStatement) ***1<2*** skips else
els_103                         ; else

ski_104                         ; (IfStatement) ***1<2*** end of...

                                ; (IfStatement) ***1>=1*** test
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 1                ; (Literal) literal int: * 1 *
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
        jp nc, meq_109          ; if >=, true -> skip change
        dec e                   ; condition=false
meq_109 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_107           ;
                                ; (Literal) * '1>=1' *
        ld hl, stn_110          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_108              ; (IfStatement) ***1>=1*** skips else
els_107                         ; else

ski_108                         ; (IfStatement) ***1>=1*** end of...

                                ; (IfStatement) ***2>=1*** test
        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 1                ; (Literal) literal int: * 1 *
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
        jp nc, meq_113          ; if >=, true -> skip change
        dec e                   ; condition=false
meq_113 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_111           ;
                                ; (Literal) * '2>=1' *
        ld hl, stn_114          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_112              ; (IfStatement) ***2>=1*** skips else
els_111                         ; else

ski_112                         ; (IfStatement) ***2>=1*** end of...

                                ; (IfStatement) ***1>=2*** test
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 2                ; (Literal) literal int: * 2 *
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

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_115           ;
                                ; (Literal) * '1>=2' *
        ld hl, stn_118          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_116              ; (IfStatement) ***1>=2*** skips else
els_115                         ; else

ski_116                         ; (IfStatement) ***1>=2*** end of...

                                ; (IfStatement) ***1<=1*** test
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * <= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: <=
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_121           ; if <, true -> skip change
        jp z, leq_121           ; if =, true -> skip change
        dec e                   ; condition=false
leq_121 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_119           ;
                                ; (Literal) * '1<=1' *
        ld hl, stn_122          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_120              ; (IfStatement) ***1<=1*** skips else
els_119                         ; else

ski_120                         ; (IfStatement) ***1<=1*** end of...

                                ; (IfStatement) ***2<=1*** test
        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * <= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: <=
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_125           ; if <, true -> skip change
        jp z, leq_125           ; if =, true -> skip change
        dec e                   ; condition=false
leq_125 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_123           ;
                                ; (Literal) * '2<=1' *
        ld hl, stn_126          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_124              ; (IfStatement) ***2<=1*** skips else
els_123                         ; else

ski_124                         ; (IfStatement) ***2<=1*** end of...

                                ; (IfStatement) ***1<=2*** test
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * <= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: <=
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_129           ; if <, true -> skip change
        jp z, leq_129           ; if =, true -> skip change
        dec e                   ; condition=false
leq_129 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_127           ;
                                ; (Literal) * '1<=2' *
        ld hl, stn_130          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_128              ; (IfStatement) ***1<=2*** skips else
els_127                         ; else

ski_128                         ; (IfStatement) ***1<=2*** end of...


                                ; (Literal) * 'Logical operations' *
        ld hl, stn_131          ; literal string address
        ld de, 18                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 15                ; (Literal) literal int: * 15 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 17                ; (Literal) literal int: * 17 *
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

                                ; (Literal) * 'The number is (1): ' *
        ld hl, stn_132          ; literal string address
        ld de, 19                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 15                ; (Literal) literal int: * 15 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 17                ; (Literal) literal int: * 17 *
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

                                ; (Literal) * 'The number is (31): ' *
        ld hl, stn_133          ; literal string address
        ld de, 20                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 15                ; (Literal) literal int: * 15 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 17                ; (Literal) literal int: * 17 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * ^ * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld a, h                 ; MSB
        xor b                   ;
        ld d, a                 ;
        ld a, l                 ; LSB
        xor c                   ;
        ld e, a                 ;
        push de                 ; >>> bogus record address, unused
        push de                 ; >>> record value
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

                                ; (Literal) * 'The number is (30): ' *
        ld hl, stn_134          ; literal string address
        ld de, 20                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UnaryExpression) * ~ *
        ld de, 15                ; (Literal) literal int: * 15 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        pop de                  ; pop value
        pop hl                  ; pop address, unused
        ld a, e                 ;
        cpl                     ; negate LSB
        ld e, a                 ;
        ld a, d                 ;
        cpl                     ; negate MSB
        ld d, a                 ;
                                ;
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

                                ; (Literal) * 'The number is (-16): ' *
        ld hl, stn_135          ; literal string address
        ld de, 21                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'CallExpression tests' *
        ld hl, stn_136          ; literal string address
        ld de, 20                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'DoWhile tests' *
        ld hl, stn_137          ; literal string address
        ld de, 13                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * count_ *
        ld hl, count_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (count_)          ; variable content
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

dow_138                         ; (DoWhileStatement) 1. body
                                ; (Identifier) variable * count_ *
        ld hl, count_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (count_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * count_ *
        ld hl, count_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (count_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
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

                                ; (Literal) * 'Number (stop at 5): ' *
        ld hl, stn_141          ; literal string address
        ld de, 20                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * count_ *
        ld hl, count_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (count_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (DoWhileStatement) 2. test
                                ; (Identifier) variable * count_ *
        ld hl, count_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (count_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 5                ; (Literal) literal int: * 5 *
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
        jp nc, les_142          ; if >=, false -> change
        inc e                   ; condition=true
les_142 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (DoWhileStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, dox_139           ;
        jp dow_138              ;
dox_139                         ; (DoWhileStatement) end of...


                                ; (Literal) * 'ForStatement tests' *
        ld hl, stn_143          ; literal string address
        ld de, 18                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Ascending' *
        ld hl, stn_144          ; literal string address
        ld de, 9                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
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

for_145                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 5                ; (Literal) literal int: * 5 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * <= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: <=
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_148           ; if <, true -> skip change
        jp z, leq_148           ; if =, true -> skip change
        dec e                   ; condition=false
leq_148 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_146           ;

                                ; (ForStatement) 3. body -------------
                                ; (Literal) * 'Number (stop at 5):' *
        ld hl, stn_149          ; literal string address
        ld de, 19                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


fup_147                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
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

        jp for_145
fex_146                         ; (ForStatement) end of...

                                ; (Literal) * 'Descending' *
        ld hl, stn_150          ; literal string address
        ld de, 10                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
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

for_151                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 5                ; (Literal) literal int: * 5 *
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
        jp nc, meq_154          ; if >=, true -> skip change
        dec e                   ; condition=false
meq_154 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_152           ;

                                ; (ForStatement) 3. body -------------
                                ; (Literal) * 'Number (stop at 5):' *
        ld hl, stn_155          ; literal string address
        ld de, 19                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


fup_153                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
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

        jp for_151
fex_152                         ; (ForStatement) end of...


                                ; (Literal) * 'For-Break' *
        ld hl, stn_156          ; literal string address
        ld de, 9                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

for_157                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
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
        jp nc, les_160          ; if >=, false -> change
        inc e                   ; condition=true
les_160 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_158           ;

                                ; (ForStatement) 3. body -------------
                                ; (IfStatement) ***expression==3*** test
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 3                ; (Literal) literal int: * 3 *
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
        jp z, equ_163           ; if =, true -> skip change
        dec e                   ; condition=false
equ_163 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_161           ;
        jp fex_158              ; (BreakStatement)

        jp ski_162              ; (IfStatement) ***expression==3*** skips else
els_161                         ; else

ski_162                         ; (IfStatement) ***expression==3*** end of...

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
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

fup_159                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_157
fex_158                         ; (ForStatement) end of...

                                ; (Literal) * 'Stop at (3): ' *
        ld hl, stn_164          ; literal string address
        ld de, 13                ; string length
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



                                ; (Literal) * 'For-Continue' *
        ld hl, stn_165          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

for_166                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
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
        jp nc, les_169          ; if >=, false -> change
        inc e                   ; condition=true
les_169 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_167           ;

                                ; (ForStatement) 3. body -------------
                                ; (IfStatement) ***expression==3*** test
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 3                ; (Literal) literal int: * 3 *
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
        jp z, equ_172           ; if =, true -> skip change
        dec e                   ; condition=false
equ_172 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_170           ;
        jp fup_168              ; (ContinueStatement)

        jp ski_171              ; (IfStatement) ***expression==3*** skips else
els_170                         ; else

ski_171                         ; (IfStatement) ***expression==3*** end of...

                                ; (Literal) * 'Skip (3): ' *
        ld hl, stn_173          ; literal string address
        ld de, 10                ; string length
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


fup_168                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_166
fex_167                         ; (ForStatement) end of...

                                ; (Literal) * 'For-Break' *
        ld hl, stn_174          ; literal string address
        ld de, 9                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

for_175                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
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
        jp nc, les_178          ; if >=, false -> change
        inc e                   ; condition=true
les_178 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_176           ;

                                ; (ForStatement) 3. body -------------
                                ; (IfStatement) ***expression==3*** test
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 3                ; (Literal) literal int: * 3 *
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
        jp z, equ_181           ; if =, true -> skip change
        dec e                   ; condition=false
equ_181 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_179           ;
        jp fex_176              ; (BreakStatement)

        jp ski_180              ; (IfStatement) ***expression==3*** skips else
els_179                         ; else

ski_180                         ; (IfStatement) ***expression==3*** end of...

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
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

fup_177                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_175
fex_176                         ; (ForStatement) end of...

                                ; (Literal) * 'Stop at (3): ' *
        ld hl, stn_182          ; literal string address
        ld de, 13                ; string length
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



                                ; (Literal) * 'Nested Loops' *
        ld hl, stn_183          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '(1 to 9)' *
        ld hl, stn_184          ; literal string address
        ld de, 8                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

for_185                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * <= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: <=
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_188           ; if <, true -> skip change
        jp z, leq_188           ; if =, true -> skip change
        dec e                   ; condition=false
leq_188 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_186           ;

                                ; (ForStatement) 3. body -------------
                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
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

for_189                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * <= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: <=
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_192           ; if <, true -> skip change
        jp z, leq_192           ; if =, true -> skip change
        dec e                   ; condition=false
leq_192 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_190           ;

                                ; (ForStatement) 3. body -------------
                                ; (MemberExpression) matrix ***mat1_*** 
        ld hl, mat1_            ; variable address
        push hl                 ; >>>
        ld hl, (mat1_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) matrix row
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


fup_191                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_189
fex_190                         ; (ForStatement) end of...

fup_187                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_185
fex_186                         ; (ForStatement) end of...

                                ; (Literal) * 'FunctionDeclaration tests' *
        ld hl, stn_193          ; literal string address
        ld de, 25                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'IfStatement tests' *
        ld hl, stn_194          ; literal string address
        ld de, 17                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 5                ; (Literal) literal int: * 5 *
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

                                ; (IfStatement) ***expression<10*** test
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
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
        jp nc, les_197          ; if >=, false -> change
        inc e                   ; condition=true
les_197 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_195           ;
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good morning' *
        ld hl, stn_198          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

        jp ski_196              ; (IfStatement) ***expression<10*** skips else
els_195                         ; else

                                ; (IfStatement) ***expression<20*** test
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 20                ; (Literal) literal int: * 20 *
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
        jp nc, les_201          ; if >=, false -> change
        inc e                   ; condition=true
les_201 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_199           ;
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good day' *
        ld hl, stn_202          ; literal string address
        ld de, 8                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

        jp ski_200              ; (IfStatement) ***expression<20*** skips else
els_199                         ; else

                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good evening' *
        ld hl, stn_203          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

ski_200                         ; (IfStatement) ***expression<20*** end of...

ski_196                         ; (IfStatement) ***expression<10*** end of...

                                ; (Literal) * 'Time: ' *
        ld hl, stn_204          ; literal string address
        ld de, 6                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

                                ; (Literal) * ', Greeting: ' *
        ld hl, stn_205          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 15                ; (Literal) literal int: * 15 *
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

                                ; (IfStatement) ***expression<10*** test
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
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
        jp nc, les_208          ; if >=, false -> change
        inc e                   ; condition=true
les_208 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_206           ;
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good morning' *
        ld hl, stn_209          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

        jp ski_207              ; (IfStatement) ***expression<10*** skips else
els_206                         ; else

                                ; (IfStatement) ***expression<20*** test
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 20                ; (Literal) literal int: * 20 *
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
        jp nc, les_212          ; if >=, false -> change
        inc e                   ; condition=true
les_212 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_210           ;
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good day' *
        ld hl, stn_213          ; literal string address
        ld de, 8                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

        jp ski_211              ; (IfStatement) ***expression<20*** skips else
els_210                         ; else

                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good evening' *
        ld hl, stn_214          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

ski_211                         ; (IfStatement) ***expression<20*** end of...

ski_207                         ; (IfStatement) ***expression<10*** end of...

                                ; (Literal) * 'Time: ' *
        ld hl, stn_215          ; literal string address
        ld de, 6                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

                                ; (Literal) * ', Greeting: ' *
        ld hl, stn_216          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 22                ; (Literal) literal int: * 22 *
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

                                ; (IfStatement) ***expression<10*** test
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
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
        jp nc, les_219          ; if >=, false -> change
        inc e                   ; condition=true
les_219 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_217           ;
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good morning' *
        ld hl, stn_220          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

        jp ski_218              ; (IfStatement) ***expression<10*** skips else
els_217                         ; else

                                ; (IfStatement) ***expression<20*** test
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 20                ; (Literal) literal int: * 20 *
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
        jp nc, les_223          ; if >=, false -> change
        inc e                   ; condition=true
les_223 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_221           ;
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good day' *
        ld hl, stn_224          ; literal string address
        ld de, 8                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

        jp ski_222              ; (IfStatement) ***expression<20*** skips else
els_221                         ; else

                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good evening' *
        ld hl, stn_225          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

ski_222                         ; (IfStatement) ***expression<20*** end of...

ski_218                         ; (IfStatement) ***expression<10*** end of...

                                ; (Literal) * 'Time: ' *
        ld hl, stn_226          ; literal string address
        ld de, 6                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

                                ; (Literal) * ', Greeting: ' *
        ld hl, stn_227          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'Literal tests' *
        ld hl, stn_228          ; literal string address
        ld de, 13                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'Identifier tests' *
        ld hl, stn_229          ; literal string address
        ld de, 16                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'SwitchStatement tests' *
        ld hl, stn_230          ; literal string address
        ld de, 21                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 2                ; (Literal) literal int: * 2 *
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

                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * '' *
        ld hl, stn_231          ; literal string address
        ld de, 0                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

                                ; (SwitchStatement)
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (SwitchCase)
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (SwitchCase)
        pop bc                  ; <<< pop case value
        pop af                  ; <<< pop case address, unused
        pop hl                  ; <<< pop discriminant value
        pop de                  ; <<< pop discriminant address
        push de                 ; >>> push discriminant address
        push hl                 ; >>> push discriminant value
        xor a                   ;
        sbc hl, bc              ;
        jp nz, swi_233          ; if =, skip
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Monday' *
        ld hl, stn_234          ; literal string address
        ld de, 6                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

        jp swx_232              ; (BreakStatement)

swi_233                         ; (SwitchCase)

                                ; (SwitchCase)
        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (SwitchCase)
        pop bc                  ; <<< pop case value
        pop af                  ; <<< pop case address, unused
        pop hl                  ; <<< pop discriminant value
        pop de                  ; <<< pop discriminant address
        push de                 ; >>> push discriminant address
        push hl                 ; >>> push discriminant value
        xor a                   ;
        sbc hl, bc              ;
        jp nz, swi_235          ; if =, skip
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Tuesday' *
        ld hl, stn_236          ; literal string address
        ld de, 7                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

        jp swx_232              ; (BreakStatement)

swi_235                         ; (SwitchCase)

                                ; (SwitchCase)
        ld de, 3                ; (Literal) literal int: * 3 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (SwitchCase)
        pop bc                  ; <<< pop case value
        pop af                  ; <<< pop case address, unused
        pop hl                  ; <<< pop discriminant value
        pop de                  ; <<< pop discriminant address
        push de                 ; >>> push discriminant address
        push hl                 ; >>> push discriminant value
        xor a                   ;
        sbc hl, bc              ;
        jp nz, swi_237          ; if =, skip
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Wednesday' *
        ld hl, stn_238          ; literal string address
        ld de, 9                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

        jp swx_232              ; (BreakStatement)

swi_237                         ; (SwitchCase)

swx_232                         ; (SwitchStatement)

        pop hl                  ; <<< clean stack
        pop hl                  ; <<< clean stack

                                ; (Literal) * '(Tuesday):' *
        ld hl, stn_239          ; literal string address
        ld de, 10                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'UptateExpression tests' *
        ld hl, stn_240          ; literal string address
        ld de, 22                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Ascending' *
        ld hl, stn_241          ; literal string address
        ld de, 9                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
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

for_242                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 5                ; (Literal) literal int: * 5 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * <= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: <=
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_245           ; if <, true -> skip change
        jp z, leq_245           ; if =, true -> skip change
        dec e                   ; condition=false
leq_245 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_243           ;

                                ; (ForStatement) 3. body -------------
                                ; (Literal) * 'Number (stop at 5):' *
        ld hl, stn_246          ; literal string address
        ld de, 19                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


fup_244                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_242
fex_243                         ; (ForStatement) end of...

                                ; (Literal) * 'Descending' *
        ld hl, stn_247          ; literal string address
        ld de, 10                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 10                ; (Literal) literal int: * 10 *
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

for_248                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 5                ; (Literal) literal int: * 5 *
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
        jp nc, meq_251          ; if >=, true -> skip change
        dec e                   ; condition=false
meq_251 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_249           ;

                                ; (ForStatement) 3. body -------------
                                ; (Literal) * 'Number (stop at 5):' *
        ld hl, stn_252          ; literal string address
        ld de, 19                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


fup_250                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** -- ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        dec (hl)                ; (UpdateExpression) decrement

        jp for_248
fex_249                         ; (ForStatement) end of...


                                ; (Literal) * 'VariableDeclaration tests' *
        ld hl, stn_253          ; literal string address
        ld de, 25                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'WhileStatement tests' *
        ld hl, stn_254          ; literal string address
        ld de, 20                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'Function tests' *
        ld hl, stn_255          ; literal string address
        ld de, 14                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 5                ; (Literal) literal int: * 5 *
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

                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 6                ; (Literal) literal int: * 6 *
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

; (FunctionDeclaration) Function: sum_
sum_                        ; (FunctionDeclaration) *** sum_ ***
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
        ld hl, num3_            ; argument *** num3_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

        ld hl, num4_            ; argument *** num4_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

                                ; (FunctionDeclaration) function body
                                ; (Identifier) variable * num3_ *
        ld hl, num3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * num3_ *
        ld hl, num3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * num4_ *
        ld hl, num4_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num4_)          ; variable content
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
                                ; (Identifier) variable * num3_ *
        ld hl, num3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num3_)          ; variable content
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

fst_257                         ; (FunctionDeclaration) recover return address (general)
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
fex_256 ret                     ; (FunctionDeclaration) end of...

mai_cod                         ; main code
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (CallExpression): regular call prep ***sum_***

                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call sum_            ; (CallExpression): call ***sum_***

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

                                ; (Literal) * '6 + 5 (11) = ' *
        ld hl, stn_258          ; literal string address
        ld de, 13                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Graph Tests' *
        ld hl, stn_259          ; literal string address
        ld de, 11                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

for_260                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 50                ; (Literal) literal int: * 50 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * <= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: <=
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_263           ; if <, true -> skip change
        jp z, leq_263           ; if =, true -> skip change
        dec e                   ; condition=false
leq_263 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_261           ;

                                ; (ForStatement) 3. body -------------
        ld de, 128                ; (Literal) literal int: * 128 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

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

        ld de, 96                ; (Literal) literal int: * 96 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

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

        ld de, 128                ; (Literal) literal int: * 128 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

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

        ld de, 96                ; (Literal) literal int: * 96 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

        ld de, 128                ; (Literal) literal int: * 128 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

        ld de, 96                ; (Literal) literal int: * 96 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

        ld de, 128                ; (Literal) literal int: * 128 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

        ld de, 96                ; (Literal) literal int: * 96 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

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

        ld de, 128                ; (Literal) literal int: * 128 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

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

        ld de, 96                ; (Literal) literal int: * 96 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

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

fup_262                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 5                ; (Literal) literal int: * 5 *
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

        jp for_260
fex_261                         ; (ForStatement) end of...

                                ; (Literal) * 'Data Access Tests' *
        ld hl, stn_264          ; literal string address
        ld de, 17                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        ld hl, arr1_          ; (VariableDeclarator) array/matrix assignment
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

        ld de, 2                ; (Literal) literal int: * 2 *
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

        ld de, 4                ; (Literal) literal int: * 4 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

                                ; (VariableDeclarator) arr1_, end of...

                                ; (Literal) * 'Before: arr1[2](3): ' *
        ld hl, stn_265          ; literal string address
        ld de, 20                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * arr1_ *
        ld hl, arr1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (arr1_)          ; variable content
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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (AssignmentExpression) * = * value to array assignment
        ld de, 10                ; (Literal) literal int: * 10 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (Identifier) variable * arr1_ *
        ld hl, arr1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (arr1_)          ; variable content
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

        pop bc                  ; <<< pop right array value, unused
        pop hl                  ; <<< pop right array address
        pop de                  ; <<< pop right array value
        pop bc                  ; <<< pop right array address, unused
        ld (hl), e              ; write LSB
        inc hl                  ; next
        ld (hl), d              ; write MSB
        inc hl                  ; next


                                ; (Literal) * 'After: arr1[2](10): ' *
        ld hl, stn_266          ; literal string address
        ld de, 20                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * arr1_ *
        ld hl, arr1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (arr1_)          ; variable content
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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Before, mat1[1][2](6): ' *
        ld hl, stn_267          ; literal string address
        ld de, 23                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (MemberExpression) matrix ***mat2_*** 
        ld hl, mat2_            ; variable address
        push hl                 ; >>>
        ld hl, (mat2_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) matrix row
        ld de, 2                ; (Literal) literal int: * 2 *
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

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'After, mat1[1][2](10): ' *
        ld hl, stn_268          ; literal string address
        ld de, 23                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (MemberExpression) matrix ***mat2_*** 
        ld hl, mat2_            ; variable address
        push hl                 ; >>>
        ld hl, (mat2_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) matrix column
        ld de, 1                ; (Literal) literal int: * 1 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) matrix row
        ld de, 2                ; (Literal) literal int: * 2 *
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

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Before dic1[5])(10): ' *
        ld hl, stn_269          ; literal string address
        ld de, 21                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * dic1_ *
        ld hl, dic1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (dic1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 5                ; (Literal) literal int: * 5 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) dictionary access
        pop hl                  ; <<< pop value to search
        pop de                  ; <<< pop value address, unused
        pop de                  ; <<< pop dictionary size
        ld b, e                 ; count through the dictionary, DE is free
        pop ix                  ; <<< pop dictionary address

dic_270 inc ix                  ; skip size
        inc ix                  ;
        ld e, (ix+0)            ; read key, byte 1, from dictionary
        ld d, (ix+1)            ; read key, byte 2
        inc ix                  ; skip key, byte 2
        inc ix                  ; skip value
        xor a                   ;
        push hl                 ; >>> value to search
        sbc hl, de              ; compare search value with key
        pop hl                  ; <<< pop value to search
        jr z, dfo_271           ;
        djnz dic_270            ;

        ld de, 0                ; if not found, value= 0
        ld bc, 0                ; if not found, address= 0
        push bc                 ; >>> push value address
        push de                 ; >>> push value
        jr dex_272              ; skip match

dfo_271 ld e, (ix+0)            ; read value, byte 1, from dictionary
        ld d, (ix+1)            ; read value, byte 2
        push ix                 ; >>> push value address
        push de                 ; >>> push value 
dex_272                         ; (MemberExpression) exit dictionary access

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'Before dic1[5])(99): ' *
        ld hl, stn_273          ; literal string address
        ld de, 21                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * dic1_ *
        ld hl, dic1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (dic1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 5                ; (Literal) literal int: * 5 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) dictionary access
        pop hl                  ; <<< pop value to search
        pop de                  ; <<< pop value address, unused
        pop de                  ; <<< pop dictionary size
        ld b, e                 ; count through the dictionary, DE is free
        pop ix                  ; <<< pop dictionary address

dic_274 inc ix                  ; skip size
        inc ix                  ;
        ld e, (ix+0)            ; read key, byte 1, from dictionary
        ld d, (ix+1)            ; read key, byte 2
        inc ix                  ; skip key, byte 2
        inc ix                  ; skip value
        xor a                   ;
        push hl                 ; >>> value to search
        sbc hl, de              ; compare search value with key
        pop hl                  ; <<< pop value to search
        jr z, dfo_275           ;
        djnz dic_274            ;

        ld de, 0                ; if not found, value= 0
        ld bc, 0                ; if not found, address= 0
        push bc                 ; >>> push value address
        push de                 ; >>> push value
        jr dex_276              ; skip match

dfo_275 ld e, (ix+0)            ; read value, byte 1, from dictionary
        ld d, (ix+1)            ; read value, byte 2
        push ix                 ; >>> push value address
        push de                 ; >>> push value 
dex_276                         ; (MemberExpression) exit dictionary access

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '16-bit signed operations' *
        ld hl, stn_277          ; literal string address
        ld de, 24                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '100+10 (110): ' *
        ld hl, stn_278          ; literal string address
        ld de, 14                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld de, 100                ; (Literal) literal int: * 100 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 10                ; (Literal) literal int: * 10 *
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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '-100+10 (-90): ' *
        ld hl, stn_279          ; literal string address
        ld de, 15                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (UnaryExpression) * - *
        ld de, -100               ; (UnaryExpression) literal unary: * -100 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

        ld de, 10                ; (Literal) literal int: * 10 *
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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '100-10 (90): ' *
        ld hl, stn_280          ; literal string address
        ld de, 13                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld de, 100                ; (Literal) literal int: * 100 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 10                ; (Literal) literal int: * 10 *
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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '-100-10 (-110): ' *
        ld hl, stn_281          ; literal string address
        ld de, 16                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (UnaryExpression) * - *
        ld de, -100               ; (UnaryExpression) literal unary: * -100 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

        ld de, 10                ; (Literal) literal int: * 10 *
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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '100/10 (10): ' *
        ld hl, stn_282          ; literal string address
        ld de, 13                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld de, 100                ; (Literal) literal int: * 100 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 10                ; (Literal) literal int: * 10 *
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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '-100/10 (-10): ' *
        ld hl, stn_283          ; literal string address
        ld de, 15                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (UnaryExpression) * - *
        ld de, -100               ; (UnaryExpression) literal unary: * -100 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

        ld de, 10                ; (Literal) literal int: * 10 *
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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '100/-10 (-10): ' *
        ld hl, stn_284          ; literal string address
        ld de, 15                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld de, 100                ; (Literal) literal int: * 100 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (UnaryExpression) * - *
        ld de, -10               ; (UnaryExpression) literal unary: * -10 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '-100/-10 (10): ' *
        ld hl, stn_285          ; literal string address
        ld de, 15                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (UnaryExpression) * - *
        ld de, -100               ; (UnaryExpression) literal unary: * -100 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

                                ; (UnaryExpression) * - *
        ld de, -10               ; (UnaryExpression) literal unary: * -10 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '100*10 (1000): ' *
        ld hl, stn_286          ; literal string address
        ld de, 15                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (UnaryExpression) * - *
        ld de, -100               ; (UnaryExpression) literal unary: * -100 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

                                ; (UnaryExpression) * - *
        ld de, -10               ; (UnaryExpression) literal unary: * -10 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '-100*10 (-1000): ' *
        ld hl, stn_287          ; literal string address
        ld de, 17                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (UnaryExpression) * - *
        ld de, -100               ; (UnaryExpression) literal unary: * -100 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

        ld de, 10                ; (Literal) literal int: * 10 *
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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '100*-10 (-1000): ' *
        ld hl, stn_288          ; literal string address
        ld de, 17                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld de, 100                ; (Literal) literal int: * 100 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (UnaryExpression) * - *
        ld de, -10               ; (UnaryExpression) literal unary: * -10 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '-100*-10 (1000): ' *
        ld hl, stn_289          ; literal string address
        ld de, 17                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (UnaryExpression) * - *
        ld de, -100               ; (UnaryExpression) literal unary: * -100 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

                                ; (UnaryExpression) * - *
        ld de, -10               ; (UnaryExpression) literal unary: * -10 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Memory tests' *
        ld hl, stn_290          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Before (0): ' *
        ld hl, stn_291          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld de, 61440                ; (Literal) literal int: * 61440 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call mem_rea            ; (CallExpression) print string


        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        ld de, 61440                ; (Literal) literal int: * 61440 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 255                ; (Literal) literal int: * 255 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call mem_wri            ; (CallExpression) print string


                                ; (Literal) * 'After (255): ' *
        ld hl, stn_292          ; literal string address
        ld de, 13                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld de, 61440                ; (Literal) literal int: * 61440 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call mem_rea            ; (CallExpression) print string


        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'Last block position (16): ' *
        ld hl, stn_293          ; literal string address
        ld de, 26                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld de, 61695                ; (Literal) literal int: * 61695 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call mem_rea            ; (CallExpression) print string


        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'String operations' *
        ld hl, stn_294          ; literal string address
        ld de, 17                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '0) literal' *
        ld hl, stn_295          ; literal string address
        ld de, 10                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (VariableDeclarator) * = * string array
        ld de, im_text1_         ; * text1_ *
        ld hl, text1_            ;
        ld (hl), e              ; immutable address to pointer variable
        inc hl                  ;
        ld (hl), d              ;

                                ; (Identifier) variable * tex1_ *
        ld hl, tex1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (VariableDeclarator) * = * string array
        ld de, im_text2_         ; * text2_ *
        ld hl, text2_            ;
        ld (hl), e              ; immutable address to pointer variable
        inc hl                  ;
        ld (hl), d              ;

                                ; (Identifier) variable * text2_ *
        ld hl, text2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (text2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * '2) second asg.' *
        ld hl, stn_296          ; literal string address
        ld de, 14                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

                                ; (Identifier) variable * text2_ *
        ld hl, text2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (text2_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * text2_ *
        ld hl, text2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (text2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * tex1_ *
        ld hl, tex1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

                                ; (Literal) * '3) var2var asg.: ' *
        ld hl, stn_297          ; literal string address
        ld de, 17                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * text2_ *
        ld hl, text2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (text2_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (VariableDeclarator) * = * string 
        ld hl, cars_+2          ; * cars_ * strings array
        ld de, im_cars_+2      ; element 0
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        inc hl                  ;
        ld de, im_cars_+34      ; element 1
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        inc hl                  ;
        ld de, im_cars_+66      ; element 2
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        inc hl                  ;
                                ; (VariableDeclarator) cars_, end of...

                                ; (Literal) * 'array pos. lit (Saab): ' *
        ld hl, stn_301          ; literal string address
        ld de, 23                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * cars_ *
        ld hl, cars_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (cars_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) string array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
                                ; find record address
        add hl, hl              ; position within array variable
        add hl, de              ; add array initial address
        ld de, 2                ; skip array sizes
        add hl, de              ; 
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push array address
        push de                 ; >>> push array address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'array pos. var (Volvo): ' *
        ld hl, stn_303          ; literal string address
        ld de, 24                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * cars_ *
        ld hl, cars_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (cars_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) string array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
                                ; find record address
        add hl, hl              ; position within array variable
        add hl, de              ; add array initial address
        ld de, 2                ; skip array sizes
        add hl, de              ; 
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push array address
        push de                 ; >>> push array address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '4) Array print' *
        ld hl, stn_305          ; literal string address
        ld de, 14                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (ForStatement) 1. init --------------
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

for_306                         ; (ForStatement) 2. test --------------
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 2                ; (Literal) literal int: * 2 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * <= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: <=
        ld de, 1                ; assume condition=true
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_309           ; if <, true -> skip change
        jp z, leq_309           ; if =, true -> skip change
        dec e                   ; condition=false
leq_309 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_307           ;

                                ; (ForStatement) 3. body -------------
                                ; (Literal) * 'Position ' *
        ld hl, stn_310          ; literal string address
        ld de, 9                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

                                ; (Literal) * ': ' *
        ld hl, stn_311          ; literal string address
        ld de, 2                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) variable * cars_ *
        ld hl, cars_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (cars_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (MemberExpression) string array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
                                ; find record address
        add hl, hl              ; position within array variable
        add hl, de              ; add array initial address
        ld de, 2                ; skip array sizes
        add hl, de              ; 
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push array address
        push de                 ; >>> push array address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


fup_308                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 1                ; (Literal) literal int: * 1 *
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

        jp for_306
fex_307                         ; (ForStatement) end of...

                                ; (Literal) * '5) Comparison (different)' *
        ld hl, stn_313          ; literal string address
        ld de, 25                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * text1_ *
        ld hl, text1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (text1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'adix' *
        ld hl, stn_314          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

                                ; (Identifier) variable * text2_ *
        ld hl, text2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (text2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'adio' *
        ld hl, stn_315          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

                                ; (IfStatement) ***expression==expression*** test
                                ; (Identifier) variable * text1_ *
        ld hl, text1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (text1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * text2_ *
        ld hl, text2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (text2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (BinaryExpression) * == * (str)
        pop de                  ; pop right string length
        pop bc                  ; pop right string address
        pop hl                  ; pop left variable length, unused
        pop bc                  ; pop left variable address
        ld b, (hl)              ; prepare countdown
        inc b                   ; include length in byte count
        inc b                   ;

        ld c, 0                 ; C=0, assume the strings are different
com_318 ld a, (de)              ; (BinaryExpression) == string
        sub (hl)                ;
        jr nz, cox_319          ; if one character is different, exit
        inc de                  ; next character
        inc hl                  ; next character
        djnz com_318            ; countdown until B=0

        inc c                   ; 
cox_319        push bc                 ;

                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_316           ;
                                ; (Literal) * 'same!' *
        ld hl, stn_320          ; literal string address
        ld de, 5                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_317              ; (IfStatement) ***expression==expression*** skips else
els_316                         ; else

                                ; (Literal) * 'different!' *
        ld hl, stn_321          ; literal string address
        ld de, 10                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


ski_317                         ; (IfStatement) ***expression==expression*** end of...

        ret                     ; end of code