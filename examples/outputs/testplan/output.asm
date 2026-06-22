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
fn_summatory_n_   defw 0                ; (FunctionDeclaration) literal int/bool
stn_007 defb 14, 0, "Printout tests"        ; (Literal) string
numa_   defb 3, 1               ; (VariableDeclarator) integer matrix (cols, rows)
        defw 11, 22, 33    ; matrix declaration
stn_008 defb 5, 0, "adios"        ; (Literal) string
stn_011 defb 5, 0, "hola "        ; (Literal) string
stn_013 defb 13, 0, "Console tests"        ; (Literal) string
stn_014 defb 5, 0, "Hello"        ; (Literal) string
stn_017 defb 5, 0, "hello"        ; (Literal) string
stn_018 defb 7, 0, "goodbye"        ; (Literal) string
stn_019 defb 0, 0, ""        ; (Literal) string
stn_020 defb 17, 0, "String operations"        ; (Literal) string
stn_021 defb 0, 0, ""        ; (Literal) string
stn_022 defb 5, 0, "hello"        ; (Literal) string
stn_023 defb 0, 0, ""        ; (Literal) string
stn_024 defb 16, 0, "literal: goodbye"        ; (Literal) string
stn_025 defb 18, 0, "Variable (hello): "        ; (Literal) string
stn_026 defb 12, 0, "CharAt (e): "        ; (Literal) string
stn_027 defb 18, 0, "fromCharCode (A): "        ; (Literal) string
stn_028 defb 25, 0, "fromCharCode direct (B): "        ; (Literal) string
stn_029 defb 21, 0, "String copy (hello): "        ; (Literal) string
stn_030 defb 26, 0, "AssignmentExpression tests"        ; (Literal) string
stn_031 defb 14, 0, "Integer/String"        ; (Literal) string
stn_032 defb 6, 0, "Hello!"        ; (Literal) string
stn_033 defb 6, 0, "(10): "        ; (Literal) string
stn_034 defb 11, 0, ". (Hello!) "        ; (Literal) string
stn_035 defb 17, 0, "Shift assignments"        ; (Literal) string
stn_037 defb 27, 0, "<<= The number is (16384): "        ; (Literal) string
stn_039 defb 24, 0, ">>= The number is (64): "        ; (Literal) string
stn_040 defb 20, 0, "Assignment operators"        ; (Literal) string
stn_041 defb 23, 0, "+= The number is (25): "        ; (Literal) string
stn_042 defb 22, 0, "-= The number is (5): "        ; (Literal) string
stn_043 defb 24, 0, "*= The number is (150): "        ; (Literal) string
stn_044 defb 22, 0, "/= The number is (1): "        ; (Literal) string
stn_045 defb 22, 0, "%= The number is (5): "        ; (Literal) string
stn_046 defb 22, 0, "&= The number is (1): "        ; (Literal) string
stn_047 defb 23, 0, "|= The number is (31): "        ; (Literal) string
stn_048 defb 23, 0, "^= The number is (30): "        ; (Literal) string
stn_049 defb 22, 0, "BinaryExpression tests"        ; (Literal) string
stn_050 defb 21, 0, "Add/Subtraction tests"        ; (Literal) string
stn_051 defb 29, 0, "Multiplication/division tests"        ; (Literal) string
stn_052 defb 7, 0, "10*10= "        ; (Literal) string
stn_053 defb 6, 0, "11/2= "        ; (Literal) string
stn_054 defb 6, 0, "11%2= "        ; (Literal) string
stn_055 defb 13, 0, "Bitwise tests"        ; (Literal) string
stn_057 defb 10, 0, "<< 2 (64) "        ; (Literal) string
stn_059 defb 9, 0, ">> 2 (4) "        ; (Literal) string
stn_061 defb 9, 0, ">>> 2 (4)"        ; (Literal) string
stn_062 defb 16, 0, "Comparison tests"        ; (Literal) string
stn_066 defb 4, 0, "1==1"        ; (Literal) string
stn_070 defb 4, 0, "2==1"        ; (Literal) string
stn_074 defb 4, 0, "1==2"        ; (Literal) string
stn_078 defb 4, 0, "1!=1"        ; (Literal) string
stn_082 defb 4, 0, "2!=1"        ; (Literal) string
stn_086 defb 4, 0, "1!=2"        ; (Literal) string
stn_091 defb 3, 0, "1>1"        ; (Literal) string
stn_096 defb 3, 0, "2>1"        ; (Literal) string
stn_101 defb 3, 0, "1>2"        ; (Literal) string
stn_106 defb 3, 0, "1<1"        ; (Literal) string
stn_111 defb 3, 0, "2<1"        ; (Literal) string
stn_116 defb 3, 0, "1<2"        ; (Literal) string
stn_121 defb 4, 0, "1>=1"        ; (Literal) string
stn_126 defb 4, 0, "2>=1"        ; (Literal) string
stn_131 defb 4, 0, "1>=2"        ; (Literal) string
stn_136 defb 4, 0, "1<=1"        ; (Literal) string
stn_141 defb 4, 0, "2<=1"        ; (Literal) string
stn_146 defb 4, 0, "1<=2"        ; (Literal) string
stn_147 defb 18, 0, "Logical operations"        ; (Literal) string
stn_148 defb 19, 0, "The number is (1): "        ; (Literal) string
stn_149 defb 20, 0, "The number is (31): "        ; (Literal) string
stn_150 defb 20, 0, "The number is (30): "        ; (Literal) string
stn_151 defb 21, 0, "The number is (-16): "        ; (Literal) string
stn_152 defb 20, 0, "CallExpression tests"        ; (Literal) string
stn_153 defb 13, 0, "DoWhile tests"        ; (Literal) string
stn_157 defb 20, 0, "Number (stop at 5): "        ; (Literal) string
stn_160 defb 18, 0, "ForStatement tests"        ; (Literal) string
stn_161 defb 9, 0, "Ascending"        ; (Literal) string
stn_167 defb 19, 0, "Number (stop at 5):"        ; (Literal) string
stn_168 defb 10, 0, "Descending"        ; (Literal) string
stn_174 defb 19, 0, "Number (stop at 5):"        ; (Literal) string
stn_175 defb 9, 0, "For-Break"        ; (Literal) string
stn_184 defb 13, 0, "Stop at (3): "        ; (Literal) string
stn_185 defb 12, 0, "For-Continue"        ; (Literal) string
stn_194 defb 10, 0, "Skip (3): "        ; (Literal) string
stn_195 defb 9, 0, "For-Break"        ; (Literal) string
stn_204 defb 13, 0, "Stop at (3): "        ; (Literal) string
stn_205 defb 12, 0, "Nested Loops"        ; (Literal) string
stn_206 defb 8, 0, "(1 to 9)"        ; (Literal) string
mat1_   defb 3, 3               ; (VariableDeclarator) integer matrix (cols, rows)
        defw 1, 2, 3    ; matrix declaration
        defw 4, 5, 6    ; matrix declaration
        defw 7, 8, 9    ; matrix declaration
stn_217 defb 25, 0, "FunctionDeclaration tests"        ; (Literal) string
stn_218 defb 17, 0, "IfStatement tests"        ; (Literal) string
stn_223 defb 12, 0, "Good morning"        ; (Literal) string
stn_228 defb 8, 0, "Good day"        ; (Literal) string
stn_229 defb 12, 0, "Good evening"        ; (Literal) string
stn_230 defb 6, 0, "Time: "        ; (Literal) string
stn_231 defb 12, 0, ", Greeting: "        ; (Literal) string
stn_236 defb 12, 0, "Good morning"        ; (Literal) string
stn_241 defb 8, 0, "Good day"        ; (Literal) string
stn_242 defb 12, 0, "Good evening"        ; (Literal) string
stn_243 defb 6, 0, "Time: "        ; (Literal) string
stn_244 defb 12, 0, ", Greeting: "        ; (Literal) string
stn_249 defb 12, 0, "Good morning"        ; (Literal) string
stn_254 defb 8, 0, "Good day"        ; (Literal) string
stn_255 defb 12, 0, "Good evening"        ; (Literal) string
stn_256 defb 6, 0, "Time: "        ; (Literal) string
stn_257 defb 12, 0, ", Greeting: "        ; (Literal) string
stn_258 defb 13, 0, "Literal tests"        ; (Literal) string
stn_259 defb 16, 0, "Identifier tests"        ; (Literal) string
stn_260 defb 21, 0, "SwitchStatement tests"        ; (Literal) string
stn_261 defb 0, 0, ""        ; (Literal) string
stn_266 defb 6, 0, "Monday"        ; (Literal) string
stn_267 defb 7, 0, "Tuesday"        ; (Literal) string
stn_268 defb 9, 0, "Wednesday"        ; (Literal) string
stn_269 defb 10, 0, "(Tuesday):"        ; (Literal) string
stn_270 defb 22, 0, "UptateExpression tests"        ; (Literal) string
stn_271 defb 9, 0, "Ascending"        ; (Literal) string
stn_277 defb 19, 0, "Number (stop at 5):"        ; (Literal) string
stn_278 defb 10, 0, "Descending"        ; (Literal) string
stn_284 defb 19, 0, "Number (stop at 5):"        ; (Literal) string
stn_285 defb 25, 0, "VariableDeclaration tests"        ; (Literal) string
stn_286 defb 20, 0, "WhileStatement tests"        ; (Literal) string
stn_287 defb 14, 0, "Function tests"        ; (Literal) string
fn_sum_num3_   defw 0                ; (FunctionDeclaration) literal int/bool
fn_sum_num4_   defw 0                ; (FunctionDeclaration) literal int/bool
stn_290 defb 13, 0, "6 + 5 (11) = "        ; (Literal) string
fn_sameParamA_n_   defw 0                ; (FunctionDeclaration) literal int/bool
fn_sameParamB_n_   defw 0                ; (FunctionDeclaration) literal int/bool
stn_295 defb 28, 0, "Same parameter names (5,6): "        ; (Literal) string
stn_297 defb 11, 0, "Graph Tests"        ; (Literal) string
canvas_   defw 0                  ; (VariableDeclarator) DOM element placeholder
ctx           defw 0         ; (VariableDeclarator) canvas context
ctx_x         defw 128       ;
ctx_y         defw 96        ;
stn_303 defb 17, 0, "Data Access Tests"        ; (Literal) string
arr1_   defb 4, 1               ; (VariableDeclarator) integer matrix (cols, rows)
        defw 1, 2, 3, 4    ; matrix declaration
stn_304 defb 20, 0, "Before: arr1[2](3): "        ; (Literal) string
stn_305 defb 20, 0, "After: arr1[2](10): "        ; (Literal) string
constArr1_   defb 3, 1               ; (VariableDeclarator) integer matrix (cols, rows)
        defw 7, 8, 9    ; matrix declaration
im_constStrArr1_   defb 3, 1            ; (VariableDeclarator) string matrix (cols, rows)
stm_306 defb 4, 0, "zero"        ;
        defs 28                 ;
stm_307 defb 3, 0, "one"        ;
        defs 29                 ;
stm_308 defb 3, 0, "two"        ;
        defs 29                 ;
constStrArr1_   defb 3, 1               ; (VariableDeclarator) string matrix (cols, rows)
        defw im_constStrArr1_+2        ; element 0
        defw im_constStrArr1_+36        ; element 1
        defw im_constStrArr1_+70        ; element 2
stn_309 defb 20, 0, "Const array [1](8): "        ; (Literal) string
stn_310 defb 29, 0, "Const string array [2](two): "        ; (Literal) string
mat2_   defb 3, 3               ; (VariableDeclarator) integer matrix (cols, rows)
        defw 1, 2, 3    ; matrix declaration
        defw 4, 5, 6    ; matrix declaration
        defw 7, 8, 9    ; matrix declaration
stn_312 defb 23, 0, "Before, mat1[1][2](6): "        ; (Literal) string
stn_313 defb 23, 0, "After, mat1[1][2](10): "        ; (Literal) string
dic1_   defw 3                  ; (VariableDeclarator) dictionary
        defw 3, 6              ; (VariableDeclarator) dictionary, integers
        defw 5, 10              ; (VariableDeclarator) dictionary, integers
        defw 4, 8              ; (VariableDeclarator) dictionary, integers
stn_314 defb 21, 0, "Before dic1[5])(10): "        ; (Literal) string
stn_318 defb 21, 0, "Before dic1[5])(99): "        ; (Literal) string
stn_322 defb 24, 0, "16-bit signed operations"        ; (Literal) string
stn_323 defb 14, 0, "100+10 (110): "        ; (Literal) string
stn_324 defb 15, 0, "-100+10 (-90): "        ; (Literal) string
stn_325 defb 13, 0, "100-10 (90): "        ; (Literal) string
stn_326 defb 16, 0, "-100-10 (-110): "        ; (Literal) string
stn_327 defb 13, 0, "100/10 (10): "        ; (Literal) string
stn_328 defb 15, 0, "-100/10 (-10): "        ; (Literal) string
stn_329 defb 15, 0, "100/-10 (-10): "        ; (Literal) string
stn_330 defb 15, 0, "-100/-10 (10): "        ; (Literal) string
stn_331 defb 15, 0, "100*10 (1000): "        ; (Literal) string
stn_332 defb 17, 0, "-100*10 (-1000): "        ; (Literal) string
stn_333 defb 17, 0, "100*-10 (-1000): "        ; (Literal) string
stn_334 defb 17, 0, "-100*-10 (1000): "        ; (Literal) string
stn_335 defb 18, 0, "Signed comparisons"        ; (Literal) string
stn_336 defb 12, 0, "-5 < 0 (1): "        ; (Literal) string
stn_339 defb 12, 0, "0 > -5 (1): "        ; (Literal) string
stn_342 defb 14, 0, "-5 <= -5 (1): "        ; (Literal) string
stn_345 defb 13, 0, "-5 >= 0 (0): "        ; (Literal) string
stn_352 defb 13, 0, "ReLU -5 (0): "        ; (Literal) string
stn_353 defb 12, 0, "Memory tests"        ; (Literal) string
stn_354 defb 12, 0, "Before (0): "        ; (Literal) string
stn_355 defb 13, 0, "After (255): "        ; (Literal) string
stn_356 defb 26, 0, "Last block position (16): "        ; (Literal) string
stn_357 defb 17, 0, "String operations"        ; (Literal) string
stn_358 defb 10, 0, "0) literal"        ; (Literal) string
im_text1_   defb 15, 0, "1) initial asg."       ; (VariableDeclarator) variable string, other length
text1_   defw 0                  ; (VariableDeclarator) text1_ is a pointer
im_text2_   defb 0, 0            ; (VariableDeclarator) empty string
        defs 32, 0xFF           ;
text2_   defw 0                  ; (VariableDeclarator) text2_ is a pointer
stn_359 defb 14, 0, "2) second asg."        ; (Literal) string
stn_360 defb 17, 0, "3) var2var asg.: "        ; (Literal) string
im_cars_   defb 3, 1            ; (VariableDeclarator) string matrix (cols, rows)
stm_361 defb 4, 0, "Saab"        ;
        defs 28                 ;
stm_362 defb 5, 0, "Volvo"        ;
        defs 27                 ;
stm_363 defb 3, 0, "BMW"        ;
        defs 29                 ;
cars_   defb 3, 1               ; (VariableDeclarator) string matrix (cols, rows)
        defw im_cars_+2        ; element 0
        defw im_cars_+36        ; element 1
        defw im_cars_+70        ; element 2
stn_364 defb 23, 0, "array pos. lit (Saab): "        ; (Literal) string
stn_366 defb 24, 0, "array pos. var (Volvo): "        ; (Literal) string
stn_368 defb 14, 0, "4) Array print"        ; (Literal) string
stn_374 defb 9, 0, "Position "        ; (Literal) string
stn_375 defb 2, 0, ": "        ; (Literal) string
stn_377 defb 25, 0, "5) Comparison (different)"        ; (Literal) string
stn_378 defb 4, 0, "adix"        ; (Literal) string
stn_379 defb 4, 0, "adio"        ; (Literal) string
stn_384 defb 5, 0, "same!"        ; (Literal) string
stn_385 defb 10, 0, "different!"        ; (Literal) string

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
        ld hl, fn_summatory_n_            ; argument *** fn_summatory_n_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

                                ; (FunctionDeclaration) function body
                                ; (IfStatement) ***expression<=0*** test
                                ; (Identifier) variable * fn_summatory_n_ *
        ld hl, fn_summatory_n_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_summatory_n_)          ; variable content
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
        jp p, les_005          ; same sign
        bit 7, h                ; left negative?
        jp nz, leq_004          ; negative <= positive is true
        dec e                   ; positive <= negative is false
        jp leq_004              ;
les_005 xor a                   ;
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
                                ; (Identifier) variable * fn_summatory_n_ *
        ld hl, fn_summatory_n_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_summatory_n_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (CallExpression): regular call prep ***summatory_***

                                ; (Identifier) variable * fn_summatory_n_ *
        ld hl, fn_summatory_n_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_summatory_n_)          ; variable content
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
fex_001 ret                     ; (FunctionDeclaration) end of...

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
        ld hl, fn_sum_num3_            ; argument *** fn_sum_num3_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

        ld hl, fn_sum_num4_            ; argument *** fn_sum_num4_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

                                ; (FunctionDeclaration) function body
                                ; (Identifier) variable * fn_sum_num3_ *
        ld hl, fn_sum_num3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sum_num3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sum_num3_ *
        ld hl, fn_sum_num3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sum_num3_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Identifier) variable * fn_sum_num4_ *
        ld hl, fn_sum_num4_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sum_num4_)          ; variable content
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
                                ; (Identifier) variable * fn_sum_num3_ *
        ld hl, fn_sum_num3_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sum_num3_)          ; variable content
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

fst_289                         ; (FunctionDeclaration) recover return address (general)
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
fex_288 ret                     ; (FunctionDeclaration) end of...

; (FunctionDeclaration) Function: sameParamA_
sameParamA_                        ; (FunctionDeclaration) *** sameParamA_ ***
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
        ld hl, fn_sameParamA_n_            ; argument *** fn_sameParamA_n_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

                                ; (FunctionDeclaration) function body
                                ; (ReturnStatement) return expression
                                ; (Identifier) variable * fn_sameParamA_n_ *
        ld hl, fn_sameParamA_n_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sameParamA_n_)          ; variable content
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

fst_292                         ; (FunctionDeclaration) recover return address (general)
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
fex_291 ret                     ; (FunctionDeclaration) end of...

; (FunctionDeclaration) Function: sameParamB_
sameParamB_                        ; (FunctionDeclaration) *** sameParamB_ ***
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
        ld hl, fn_sameParamB_n_            ; argument *** fn_sameParamB_n_ ***
        pop de                  ; <<< pop address
        pop bc                  ; <<< pop value
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

                                ; (FunctionDeclaration) function body
                                ; (ReturnStatement) return expression
                                ; (Identifier) variable * fn_sameParamB_n_ *
        ld hl, fn_sameParamB_n_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (fn_sameParamB_n_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 2                ; (Literal) literal int: * 2 *
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

fst_294                         ; (FunctionDeclaration) recover return address (general)
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
fex_293 ret                     ; (FunctionDeclaration) end of...

mai_cod                         ; main code





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


                                ; (CallExpression): regular call prep ***summatory_***

        ld de, 5                ; (Literal) literal int: * 5 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call summatory_            ; (CallExpression): call ***summatory_***

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'Printout tests' *
        ld hl, stn_007          ; literal string address
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
        ld hl, stn_008          ; literal string address
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
        ld hl, stn_011          ; literal string address
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
        ld hl, stn_013          ; literal string address
        ld de, 13                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Hello' *
        ld hl, stn_014          ; literal string address
        ld de, 5                ; string length
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
        ld hl, stn_017          ; literal string address
        ld de, 5                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print string

                                ; (Literal) * 'goodbye' *
        ld hl, stn_018          ; literal string address
        ld de, 7                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print string


                                ; (Literal) * '' *
        ld hl, stn_019          ; literal string address
        ld de, 0                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'String operations' *
        ld hl, stn_020          ; literal string address
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

                                ; (Identifier) variable * str1_ *
        ld hl, str1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (str1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'hello' *
        ld hl, stn_022          ; literal string address
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
        ld hl, stn_023          ; literal string address
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
        ld hl, stn_024          ; literal string address
        ld de, 16                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Variable (hello): ' *
        ld hl, stn_025          ; literal string address
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
        pop de                  ; <<< pop index value
        pop hl                  ; <<< pop index address, unused
        pop hl                  ; <<< pop string content pointer
        pop bc                  ; <<< pop string variable address, unused
        inc hl                  ; skip length
        inc hl                  ;
        add hl, de              ; string character address
        ld a, (hl)              ; character
        ld hl, 24000          ; one-character string buffer
        ld (hl), 1              ; string length LSB
        inc hl                  ;
        ld (hl), 0              ; string length MSB
        inc hl                  ;
        ld (hl), a              ; string character
        ld de, 24000          ; string content pointer
        push de                 ; >>> bogus string variable address
        push de                 ; >>> string content pointer

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

                                ; (Literal) * 'CharAt (e): ' *
        ld hl, stn_026          ; literal string address
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


                                ; (Identifier) variable * cha1_ *
        ld hl, cha1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (cha1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 65                ; (Literal) literal int: * 65 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) Ascii to Char
        pop de                  ; <<< pop char value
        pop bc                  ; <<< pop char address
        ld hl, 24003            ; save value in garbage zone
        ld (hl), 1              ; string length
        inc hl                  ;
        ld (hl), 0              ; string length
        ld bc, 1                ; string length
        push bc                 ; >>> push dummy content
        inc hl                  ;
        ld (hl), e              ; string value
        inc hl                  ;
        ld (hl), d              ;

        ld hl, 24003            ; string address
        push hl                 ; >>> push string address

                                ; (AssignmentExpression) * = * assign string
        pop de                  ; pop right string address
        pop hl                  ; pop right string value, unused
        pop hl                  ; pop left variable value, unused
        pop hl                  ; pop left variable address
        ld (hl), e              ; copy immutable address string LSB
        inc hl                  ;
        ld (hl), d              ; copy immutable address string MSB

                                ; (Literal) * 'fromCharCode (A): ' *
        ld hl, stn_027          ; literal string address
        ld de, 18                ; string length
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


                                ; (Literal) * 'fromCharCode direct (B): ' *
        ld hl, stn_028          ; literal string address
        ld de, 25                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld de, 66                ; (Literal) literal int: * 66 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (MemberExpression) Ascii to Char
        pop de                  ; <<< pop char value
        pop bc                  ; <<< pop char address
        ld hl, 24007            ; save value in garbage zone
        ld (hl), 1              ; string length
        inc hl                  ;
        ld (hl), 0              ; string length
        ld bc, 1                ; string length
        push bc                 ; >>> push dummy content
        inc hl                  ;
        ld (hl), e              ; string value
        inc hl                  ;
        ld (hl), d              ;

        ld hl, 24007            ; string address
        push hl                 ; >>> push string address

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
        ld hl, stn_029          ; literal string address
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
        ld hl, stn_030          ; literal string address
        ld de, 26                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Integer/String' *
        ld hl, stn_031          ; literal string address
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
        ld hl, stn_032          ; literal string address
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
        ld hl, stn_033          ; literal string address
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
        ld hl, stn_034          ; literal string address
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
        ld hl, stn_035          ; literal string address
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
asg_036 add hl, hl              ; shift left
        djnz asg_036            ;
        push hl                 ;
        pop de                  ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Literal) * '<<= The number is (16384): ' *
        ld hl, stn_037          ; literal string address
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
asg_038 srl h                   ; shift right 1
        rr l                    ; shift right 2
        djnz asg_038            ;
        push hl                 ;
        pop de                  ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Literal) * '>>= The number is (64): ' *
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



                                ; (Literal) * 'Assignment operators' *
        ld hl, stn_040          ; literal string address
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
        ld hl, stn_041          ; literal string address
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

        xor a                   ; clear carry before subtraction
        sbc hl, bc              ; HL has the result
        ex de, hl               ; DE has the result

        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Literal) * '-= The number is (5): ' *
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
        ld hl, stn_043          ; literal string address
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
        ld hl, stn_044          ; literal string address
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
        ld hl, stn_045          ; literal string address
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
        ld hl, stn_046          ; literal string address
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
        ld hl, stn_047          ; literal string address
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
        ld hl, stn_048          ; literal string address
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
        ld hl, stn_049          ; literal string address
        ld de, 22                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Add/Subtraction tests' *
        ld hl, stn_050          ; literal string address
        ld de, 21                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Multiplication/division tests' *
        ld hl, stn_051          ; literal string address
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
        ld hl, stn_052          ; literal string address
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
        ld hl, stn_053          ; literal string address
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
        ld hl, stn_054          ; literal string address
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
        ld hl, stn_055          ; literal string address
        ld de, 13                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (VariableDeclarator) * num1_ *
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        ld de, 16                ; (Literal) literal int: * 16 *
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
bsh_056 add hl, hl              ; shift left
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

                                ; (Literal) * '<< 2 (64) ' *
        ld hl, stn_057          ; literal string address
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
bsh_058 sra h                   ; shift right 1
        rr l                    ; shift right 2
        djnz bsh_058            ;
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
        ld hl, stn_059          ; literal string address
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

                                ; (BinaryExpression) * >>> * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used

        ld b, c                 ; number of shifts
bsh_060 srl h                   ; shift right 1
        rr l                    ; shift right 2
        djnz bsh_060            ;
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
        ld hl, stn_061          ; literal string address
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
        ld hl, stn_062          ; literal string address
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
                                ; (Literal) * '1==1' *
        ld hl, stn_066          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_064              ; (IfStatement) ***1==1*** skips else
els_063                         ; else

ski_064                         ; (IfStatement) ***1==1*** end of...

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
                                ; (Literal) * '2==1' *
        ld hl, stn_070          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_068              ; (IfStatement) ***2==1*** skips else
els_067                         ; else

ski_068                         ; (IfStatement) ***2==1*** end of...

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
        jp z, equ_073           ; if =, true -> skip change
        dec e                   ; condition=false
equ_073 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_071           ;
                                ; (Literal) * '1==2' *
        ld hl, stn_074          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_072              ; (IfStatement) ***1==2*** skips else
els_071                         ; else

ski_072                         ; (IfStatement) ***1==2*** end of...

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
                                ; (Literal) * '1!=1' *
        ld hl, stn_078          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_076              ; (IfStatement) ***1!=1*** skips else
els_075                         ; else

ski_076                         ; (IfStatement) ***1!=1*** end of...

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
                                ; (Literal) * '2!=1' *
        ld hl, stn_082          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_080              ; (IfStatement) ***2!=1*** skips else
els_079                         ; else

ski_080                         ; (IfStatement) ***2!=1*** end of...

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
        jp nz, neq_085           ; if !=, true -> skip change
        dec e                   ; condition=false
neq_085 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_083           ;
                                ; (Literal) * '1!=2' *
        ld hl, stn_086          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_084              ; (IfStatement) ***1!=2*** skips else
els_083                         ; else

ski_084                         ; (IfStatement) ***1!=2*** end of...

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, mss_090          ; same sign
        bit 7, h                ; left negative?
        jp nz, mor_089          ; negative > positive is false
        inc e                   ; positive > negative is true
        jp mor_089              ;
mss_090 xor a                   ;
        sbc hl, bc              ;
        jp c, mor_089           ; if <, false -> skip change
        jp z, mor_089           ; if =, false -> skip change
        inc e                   ; condition=true
mor_089 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_087           ;
                                ; (Literal) * '1>1' *
        ld hl, stn_091          ; literal string address
        ld de, 3                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_088              ; (IfStatement) ***1>1*** skips else
els_087                         ; else

ski_088                         ; (IfStatement) ***1>1*** end of...

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, mss_095          ; same sign
        bit 7, h                ; left negative?
        jp nz, mor_094          ; negative > positive is false
        inc e                   ; positive > negative is true
        jp mor_094              ;
mss_095 xor a                   ;
        sbc hl, bc              ;
        jp c, mor_094           ; if <, false -> skip change
        jp z, mor_094           ; if =, false -> skip change
        inc e                   ; condition=true
mor_094 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_092           ;
                                ; (Literal) * '2>1' *
        ld hl, stn_096          ; literal string address
        ld de, 3                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_093              ; (IfStatement) ***2>1*** skips else
els_092                         ; else

ski_093                         ; (IfStatement) ***2>1*** end of...

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, mss_100          ; same sign
        bit 7, h                ; left negative?
        jp nz, mor_099          ; negative > positive is false
        inc e                   ; positive > negative is true
        jp mor_099              ;
mss_100 xor a                   ;
        sbc hl, bc              ;
        jp c, mor_099           ; if <, false -> skip change
        jp z, mor_099           ; if =, false -> skip change
        inc e                   ; condition=true
mor_099 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_097           ;
                                ; (Literal) * '1>2' *
        ld hl, stn_101          ; literal string address
        ld de, 3                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_098              ; (IfStatement) ***1>2*** skips else
els_097                         ; else

ski_098                         ; (IfStatement) ***1>2*** end of...

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, lss_105          ; same sign
        bit 7, h                ; left negative?
        jp z, les_104          ; positive < negative is false
        inc e                   ; negative < positive is true
        jp les_104              ;
lss_105 xor a                   ;
        sbc hl, bc              ;
        jp nc, les_104          ; if >=, false -> skip change
        inc e                   ; condition=true
les_104 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_102           ;
                                ; (Literal) * '1<1' *
        ld hl, stn_106          ; literal string address
        ld de, 3                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_103              ; (IfStatement) ***1<1*** skips else
els_102                         ; else

ski_103                         ; (IfStatement) ***1<1*** end of...

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, lss_110          ; same sign
        bit 7, h                ; left negative?
        jp z, les_109          ; positive < negative is false
        inc e                   ; negative < positive is true
        jp les_109              ;
lss_110 xor a                   ;
        sbc hl, bc              ;
        jp nc, les_109          ; if >=, false -> skip change
        inc e                   ; condition=true
les_109 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_107           ;
                                ; (Literal) * '2<1' *
        ld hl, stn_111          ; literal string address
        ld de, 3                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_108              ; (IfStatement) ***2<1*** skips else
els_107                         ; else

ski_108                         ; (IfStatement) ***2<1*** end of...

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, lss_115          ; same sign
        bit 7, h                ; left negative?
        jp z, les_114          ; positive < negative is false
        inc e                   ; negative < positive is true
        jp les_114              ;
lss_115 xor a                   ;
        sbc hl, bc              ;
        jp nc, les_114          ; if >=, false -> skip change
        inc e                   ; condition=true
les_114 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_112           ;
                                ; (Literal) * '1<2' *
        ld hl, stn_116          ; literal string address
        ld de, 3                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_113              ; (IfStatement) ***1<2*** skips else
els_112                         ; else

ski_113                         ; (IfStatement) ***1<2*** end of...

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, ges_120          ; same sign
        bit 7, h                ; left negative?
        jp z, meq_119          ; positive >= negative is true
        dec e                   ; negative >= positive is false
        jp meq_119              ;
ges_120 xor a                   ;
        sbc hl, bc              ;
        jp nc, meq_119          ; if >=, true -> skip change
        dec e                   ; condition=false
meq_119 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_117           ;
                                ; (Literal) * '1>=1' *
        ld hl, stn_121          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_118              ; (IfStatement) ***1>=1*** skips else
els_117                         ; else

ski_118                         ; (IfStatement) ***1>=1*** end of...

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, ges_125          ; same sign
        bit 7, h                ; left negative?
        jp z, meq_124          ; positive >= negative is true
        dec e                   ; negative >= positive is false
        jp meq_124              ;
ges_125 xor a                   ;
        sbc hl, bc              ;
        jp nc, meq_124          ; if >=, true -> skip change
        dec e                   ; condition=false
meq_124 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_122           ;
                                ; (Literal) * '2>=1' *
        ld hl, stn_126          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_123              ; (IfStatement) ***2>=1*** skips else
els_122                         ; else

ski_123                         ; (IfStatement) ***2>=1*** end of...

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, ges_130          ; same sign
        bit 7, h                ; left negative?
        jp z, meq_129          ; positive >= negative is true
        dec e                   ; negative >= positive is false
        jp meq_129              ;
ges_130 xor a                   ;
        sbc hl, bc              ;
        jp nc, meq_129          ; if >=, true -> skip change
        dec e                   ; condition=false
meq_129 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_127           ;
                                ; (Literal) * '1>=2' *
        ld hl, stn_131          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_128              ; (IfStatement) ***1>=2*** skips else
els_127                         ; else

ski_128                         ; (IfStatement) ***1>=2*** end of...

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, les_135          ; same sign
        bit 7, h                ; left negative?
        jp nz, leq_134          ; negative <= positive is true
        dec e                   ; positive <= negative is false
        jp leq_134              ;
les_135 xor a                   ;
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_134           ; if <, true -> skip change
        jp z, leq_134           ; if =, true -> skip change
        dec e                   ; condition=false
leq_134 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_132           ;
                                ; (Literal) * '1<=1' *
        ld hl, stn_136          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_133              ; (IfStatement) ***1<=1*** skips else
els_132                         ; else

ski_133                         ; (IfStatement) ***1<=1*** end of...

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, les_140          ; same sign
        bit 7, h                ; left negative?
        jp nz, leq_139          ; negative <= positive is true
        dec e                   ; positive <= negative is false
        jp leq_139              ;
les_140 xor a                   ;
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_139           ; if <, true -> skip change
        jp z, leq_139           ; if =, true -> skip change
        dec e                   ; condition=false
leq_139 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_137           ;
                                ; (Literal) * '2<=1' *
        ld hl, stn_141          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_138              ; (IfStatement) ***2<=1*** skips else
els_137                         ; else

ski_138                         ; (IfStatement) ***2<=1*** end of...

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, les_145          ; same sign
        bit 7, h                ; left negative?
        jp nz, leq_144          ; negative <= positive is true
        dec e                   ; positive <= negative is false
        jp leq_144              ;
les_145 xor a                   ;
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_144           ; if <, true -> skip change
        jp z, leq_144           ; if =, true -> skip change
        dec e                   ; condition=false
leq_144 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_142           ;
                                ; (Literal) * '1<=2' *
        ld hl, stn_146          ; literal string address
        ld de, 4                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_143              ; (IfStatement) ***1<=2*** skips else
els_142                         ; else

ski_143                         ; (IfStatement) ***1<=2*** end of...


                                ; (Literal) * 'Logical operations' *
        ld hl, stn_147          ; literal string address
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
        ld hl, stn_148          ; literal string address
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
        ld hl, stn_149          ; literal string address
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
        ld hl, stn_150          ; literal string address
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
        ld hl, stn_151          ; literal string address
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
        ld hl, stn_152          ; literal string address
        ld de, 20                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'DoWhile tests' *
        ld hl, stn_153          ; literal string address
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

dow_154                         ; (DoWhileStatement) 1. body
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
        ld hl, stn_157          ; literal string address
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, lss_159          ; same sign
        bit 7, h                ; left negative?
        jp z, les_158          ; positive < negative is false
        inc e                   ; negative < positive is true
        jp les_158              ;
lss_159 xor a                   ;
        sbc hl, bc              ;
        jp nc, les_158          ; if >=, false -> skip change
        inc e                   ; condition=true
les_158 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (DoWhileStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, dox_155           ;
        jp dow_154              ;
dox_155                         ; (DoWhileStatement) end of...


                                ; (Literal) * 'ForStatement tests' *
        ld hl, stn_160          ; literal string address
        ld de, 18                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Ascending' *
        ld hl, stn_161          ; literal string address
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

for_162                         ; (ForStatement) 2. test --------------
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, les_166          ; same sign
        bit 7, h                ; left negative?
        jp nz, leq_165          ; negative <= positive is true
        dec e                   ; positive <= negative is false
        jp leq_165              ;
les_166 xor a                   ;
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_165           ; if <, true -> skip change
        jp z, leq_165           ; if =, true -> skip change
        dec e                   ; condition=false
leq_165 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_163           ;

                                ; (ForStatement) 3. body -------------
                                ; (Literal) * 'Number (stop at 5):' *
        ld hl, stn_167          ; literal string address
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


fup_164                         ; (ForStatement) 4. update ---------
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

        jp for_162
fex_163                         ; (ForStatement) end of...

                                ; (Literal) * 'Descending' *
        ld hl, stn_168          ; literal string address
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

for_169                         ; (ForStatement) 2. test --------------
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, ges_173          ; same sign
        bit 7, h                ; left negative?
        jp z, meq_172          ; positive >= negative is true
        dec e                   ; negative >= positive is false
        jp meq_172              ;
ges_173 xor a                   ;
        sbc hl, bc              ;
        jp nc, meq_172          ; if >=, true -> skip change
        dec e                   ; condition=false
meq_172 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_170           ;

                                ; (ForStatement) 3. body -------------
                                ; (Literal) * 'Number (stop at 5):' *
        ld hl, stn_174          ; literal string address
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


fup_171                         ; (ForStatement) 4. update ---------
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

        jp for_169
fex_170                         ; (ForStatement) end of...


                                ; (Literal) * 'For-Break' *
        ld hl, stn_175          ; literal string address
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

for_176                         ; (ForStatement) 2. test --------------
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, lss_180          ; same sign
        bit 7, h                ; left negative?
        jp z, les_179          ; positive < negative is false
        inc e                   ; negative < positive is true
        jp les_179              ;
lss_180 xor a                   ;
        sbc hl, bc              ;
        jp nc, les_179          ; if >=, false -> skip change
        inc e                   ; condition=true
les_179 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_177           ;

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
        jp z, equ_183           ; if =, true -> skip change
        dec e                   ; condition=false
equ_183 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_181           ;
        jp fex_177              ; (BreakStatement)

        jp ski_182              ; (IfStatement) ***expression==3*** skips else
els_181                         ; else

ski_182                         ; (IfStatement) ***expression==3*** end of...

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

fup_178                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_176
fex_177                         ; (ForStatement) end of...

                                ; (Literal) * 'Stop at (3): ' *
        ld hl, stn_184          ; literal string address
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
        ld hl, stn_185          ; literal string address
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

for_186                         ; (ForStatement) 2. test --------------
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, lss_190          ; same sign
        bit 7, h                ; left negative?
        jp z, les_189          ; positive < negative is false
        inc e                   ; negative < positive is true
        jp les_189              ;
lss_190 xor a                   ;
        sbc hl, bc              ;
        jp nc, les_189          ; if >=, false -> skip change
        inc e                   ; condition=true
les_189 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_187           ;

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
        jp z, equ_193           ; if =, true -> skip change
        dec e                   ; condition=false
equ_193 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_191           ;
        jp fup_188              ; (ContinueStatement)

        jp ski_192              ; (IfStatement) ***expression==3*** skips else
els_191                         ; else

ski_192                         ; (IfStatement) ***expression==3*** end of...

                                ; (Literal) * 'Skip (3): ' *
        ld hl, stn_194          ; literal string address
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


fup_188                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_186
fex_187                         ; (ForStatement) end of...

                                ; (Literal) * 'For-Break' *
        ld hl, stn_195          ; literal string address
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

for_196                         ; (ForStatement) 2. test --------------
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, lss_200          ; same sign
        bit 7, h                ; left negative?
        jp z, les_199          ; positive < negative is false
        inc e                   ; negative < positive is true
        jp les_199              ;
lss_200 xor a                   ;
        sbc hl, bc              ;
        jp nc, les_199          ; if >=, false -> skip change
        inc e                   ; condition=true
les_199 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_197           ;

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
        jp z, equ_203           ; if =, true -> skip change
        dec e                   ; condition=false
equ_203 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_201           ;
        jp fex_197              ; (BreakStatement)

        jp ski_202              ; (IfStatement) ***expression==3*** skips else
els_201                         ; else

ski_202                         ; (IfStatement) ***expression==3*** end of...

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

fup_198                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * i_ *
        ld hl, i_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (i_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_196
fex_197                         ; (ForStatement) end of...

                                ; (Literal) * 'Stop at (3): ' *
        ld hl, stn_204          ; literal string address
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
        ld hl, stn_205          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '(1 to 9)' *
        ld hl, stn_206          ; literal string address
        ld de, 8                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        ld hl, mat1_          ; (VariableDeclarator) array/matrix assignment
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

        ld de, 6                ; (Literal) literal int: * 6 *
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

        ld de, 8                ; (Literal) literal int: * 8 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 9                ; (Literal) literal int: * 9 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

                                ; (VariableDeclarator) mat1_, end of...

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

for_207                         ; (ForStatement) 2. test --------------
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, les_211          ; same sign
        bit 7, h                ; left negative?
        jp nz, leq_210          ; negative <= positive is true
        dec e                   ; positive <= negative is false
        jp leq_210              ;
les_211 xor a                   ;
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_210           ; if <, true -> skip change
        jp z, leq_210           ; if =, true -> skip change
        dec e                   ; condition=false
leq_210 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_208           ;

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

for_212                         ; (ForStatement) 2. test --------------
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, les_216          ; same sign
        bit 7, h                ; left negative?
        jp nz, leq_215          ; negative <= positive is true
        dec e                   ; positive <= negative is false
        jp leq_215              ;
les_216 xor a                   ;
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_215           ; if <, true -> skip change
        jp z, leq_215           ; if =, true -> skip change
        dec e                   ; condition=false
leq_215 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_213           ;

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


fup_214                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_212
fex_213                         ; (ForStatement) end of...

fup_209                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_207
fex_208                         ; (ForStatement) end of...

                                ; (Literal) * 'FunctionDeclaration tests' *
        ld hl, stn_217          ; literal string address
        ld de, 25                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'IfStatement tests' *
        ld hl, stn_218          ; literal string address
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, lss_222          ; same sign
        bit 7, h                ; left negative?
        jp z, les_221          ; positive < negative is false
        inc e                   ; negative < positive is true
        jp les_221              ;
lss_222 xor a                   ;
        sbc hl, bc              ;
        jp nc, les_221          ; if >=, false -> skip change
        inc e                   ; condition=true
les_221 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_219           ;
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good morning' *
        ld hl, stn_223          ; literal string address
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

        jp ski_220              ; (IfStatement) ***expression<10*** skips else
els_219                         ; else

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, lss_227          ; same sign
        bit 7, h                ; left negative?
        jp z, les_226          ; positive < negative is false
        inc e                   ; negative < positive is true
        jp les_226              ;
lss_227 xor a                   ;
        sbc hl, bc              ;
        jp nc, les_226          ; if >=, false -> skip change
        inc e                   ; condition=true
les_226 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_224           ;
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good day' *
        ld hl, stn_228          ; literal string address
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

        jp ski_225              ; (IfStatement) ***expression<20*** skips else
els_224                         ; else

                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good evening' *
        ld hl, stn_229          ; literal string address
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

ski_225                         ; (IfStatement) ***expression<20*** end of...

ski_220                         ; (IfStatement) ***expression<10*** end of...

                                ; (Literal) * 'Time: ' *
        ld hl, stn_230          ; literal string address
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
        ld hl, stn_231          ; literal string address
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, lss_235          ; same sign
        bit 7, h                ; left negative?
        jp z, les_234          ; positive < negative is false
        inc e                   ; negative < positive is true
        jp les_234              ;
lss_235 xor a                   ;
        sbc hl, bc              ;
        jp nc, les_234          ; if >=, false -> skip change
        inc e                   ; condition=true
les_234 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_232           ;
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good morning' *
        ld hl, stn_236          ; literal string address
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

        jp ski_233              ; (IfStatement) ***expression<10*** skips else
els_232                         ; else

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, lss_240          ; same sign
        bit 7, h                ; left negative?
        jp z, les_239          ; positive < negative is false
        inc e                   ; negative < positive is true
        jp les_239              ;
lss_240 xor a                   ;
        sbc hl, bc              ;
        jp nc, les_239          ; if >=, false -> skip change
        inc e                   ; condition=true
les_239 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_237           ;
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good day' *
        ld hl, stn_241          ; literal string address
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

        jp ski_238              ; (IfStatement) ***expression<20*** skips else
els_237                         ; else

                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good evening' *
        ld hl, stn_242          ; literal string address
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

ski_238                         ; (IfStatement) ***expression<20*** end of...

ski_233                         ; (IfStatement) ***expression<10*** end of...

                                ; (Literal) * 'Time: ' *
        ld hl, stn_243          ; literal string address
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
        ld hl, stn_244          ; literal string address
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, lss_248          ; same sign
        bit 7, h                ; left negative?
        jp z, les_247          ; positive < negative is false
        inc e                   ; negative < positive is true
        jp les_247              ;
lss_248 xor a                   ;
        sbc hl, bc              ;
        jp nc, les_247          ; if >=, false -> skip change
        inc e                   ; condition=true
les_247 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_245           ;
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good morning' *
        ld hl, stn_249          ; literal string address
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

        jp ski_246              ; (IfStatement) ***expression<10*** skips else
els_245                         ; else

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, lss_253          ; same sign
        bit 7, h                ; left negative?
        jp z, les_252          ; positive < negative is false
        inc e                   ; negative < positive is true
        jp les_252              ;
lss_253 xor a                   ;
        sbc hl, bc              ;
        jp nc, les_252          ; if >=, false -> skip change
        inc e                   ; condition=true
les_252 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_250           ;
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good day' *
        ld hl, stn_254          ; literal string address
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

        jp ski_251              ; (IfStatement) ***expression<20*** skips else
els_250                         ; else

                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Good evening' *
        ld hl, stn_255          ; literal string address
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

ski_251                         ; (IfStatement) ***expression<20*** end of...

ski_246                         ; (IfStatement) ***expression<10*** end of...

                                ; (Literal) * 'Time: ' *
        ld hl, stn_256          ; literal string address
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
        ld hl, stn_257          ; literal string address
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
        ld hl, stn_258          ; literal string address
        ld de, 13                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'Identifier tests' *
        ld hl, stn_259          ; literal string address
        ld de, 16                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'SwitchStatement tests' *
        ld hl, stn_260          ; literal string address
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
        ld hl, stn_261          ; literal string address
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

                                ; (SwitchStatement) dispatch
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

        pop hl                  ; <<< discriminant value
        pop de                  ; <<< discriminant address, unused
        ld bc, 1             ; case value
        xor a                   ; clear carry
        sbc hl, bc              ; compare
        jp z, swi_263              ; matching case
        add hl, bc              ; restore discriminant
        ld bc, 2             ; case value
        xor a                   ; clear carry
        sbc hl, bc              ; compare
        jp z, swi_264              ; matching case
        add hl, bc              ; restore discriminant
        ld bc, 3             ; case value
        xor a                   ; clear carry
        sbc hl, bc              ; compare
        jp z, swi_265              ; matching case
        add hl, bc              ; restore discriminant
        jp swx_262              ; default or switch exit

swi_263                         ; (SwitchCase) case
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Monday' *
        ld hl, stn_266          ; literal string address
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

        jp swx_262              ; (BreakStatement)

swi_264                         ; (SwitchCase) case
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Tuesday' *
        ld hl, stn_267          ; literal string address
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

        jp swx_262              ; (BreakStatement)

swi_265                         ; (SwitchCase) case
                                ; (Identifier) variable * tex_ *
        ld hl, tex_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (tex_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (Literal) * 'Wednesday' *
        ld hl, stn_268          ; literal string address
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

        jp swx_262              ; (BreakStatement)

swx_262                         ; (SwitchStatement) end

                                ; (Literal) * '(Tuesday):' *
        ld hl, stn_269          ; literal string address
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
        ld hl, stn_270          ; literal string address
        ld de, 22                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Ascending' *
        ld hl, stn_271          ; literal string address
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

for_272                         ; (ForStatement) 2. test --------------
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, les_276          ; same sign
        bit 7, h                ; left negative?
        jp nz, leq_275          ; negative <= positive is true
        dec e                   ; positive <= negative is false
        jp leq_275              ;
les_276 xor a                   ;
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_275           ; if <, true -> skip change
        jp z, leq_275           ; if =, true -> skip change
        dec e                   ; condition=false
leq_275 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_273           ;

                                ; (ForStatement) 3. body -------------
                                ; (Literal) * 'Number (stop at 5):' *
        ld hl, stn_277          ; literal string address
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


fup_274                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

        jp for_272
fex_273                         ; (ForStatement) end of...

                                ; (Literal) * 'Descending' *
        ld hl, stn_278          ; literal string address
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

for_279                         ; (ForStatement) 2. test --------------
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, ges_283          ; same sign
        bit 7, h                ; left negative?
        jp z, meq_282          ; positive >= negative is true
        dec e                   ; negative >= positive is false
        jp meq_282              ;
ges_283 xor a                   ;
        sbc hl, bc              ;
        jp nc, meq_282          ; if >=, true -> skip change
        dec e                   ; condition=false
meq_282 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_280           ;

                                ; (ForStatement) 3. body -------------
                                ; (Literal) * 'Number (stop at 5):' *
        ld hl, stn_284          ; literal string address
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


fup_281                         ; (ForStatement) 4. update ---------
                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UpdateExpression) *** -- ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        dec (hl)                ; (UpdateExpression) decrement

        jp for_279
fex_280                         ; (ForStatement) end of...


                                ; (Literal) * 'VariableDeclaration tests' *
        ld hl, stn_285          ; literal string address
        ld de, 25                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'WhileStatement tests' *
        ld hl, stn_286          ; literal string address
        ld de, 20                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'Function tests' *
        ld hl, stn_287          ; literal string address
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
        ld hl, stn_290          ; literal string address
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


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (CallExpression): regular call prep ***sameParamA_***

        ld de, 4                ; (Literal) literal int: * 4 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call sameParamA_            ; (CallExpression): call ***sameParamA_***

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

                                ; (CallExpression): regular call prep ***sameParamB_***

        ld de, 4                ; (Literal) literal int: * 4 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call sameParamB_            ; (CallExpression): call ***sameParamB_***

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

                                ; (Literal) * 'Same parameter names (5,6): ' *
        ld hl, stn_295          ; literal string address
        ld de, 28                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

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

                                ; (Identifier) variable * num2_ *
        ld hl, num2_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num2_)          ; variable content
        push hl                 ; >>> push variable content

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Graph Tests' *
        ld hl, stn_297          ; literal string address
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

for_298                         ; (ForStatement) 2. test --------------
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, les_302          ; same sign
        bit 7, h                ; left negative?
        jp nz, leq_301          ; negative <= positive is true
        dec e                   ; positive <= negative is false
        jp leq_301              ;
les_302 xor a                   ;
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_301           ; if <, true -> skip change
        jp z, leq_301           ; if =, true -> skip change
        dec e                   ; condition=false
leq_301 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_299           ;

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

                                ; (CallExpression) moveTo, move current point
        pop bc                  ; get y-coord value
        pop hl                  ; get y-coord address, unused
        pop de                  ; get x-coord value
        pop hl                  ; get x-coord address, unused
        ld hl, ctx_x              ; save values in canvas object
        ld (hl), e              ;
        ld hl, ctx_y              ;
        ld (hl), c              ;

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

fup_300                         ; (ForStatement) 4. update ---------
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

        jp for_298
fex_299                         ; (ForStatement) end of...

                                ; (Literal) * 'Data Access Tests' *
        ld hl, stn_303          ; literal string address
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
        ld hl, stn_304          ; literal string address
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
        ld hl, stn_305          ; literal string address
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


        ld hl, constArr1_          ; (VariableDeclarator) array/matrix assignment
        inc hl                  ; skip dimensions
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

        ld de, 8                ; (Literal) literal int: * 8 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 9                ; (Literal) literal int: * 9 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

                                ; (VariableDeclarator) constArr1_, end of...

                                ; (VariableDeclarator) * = * string 
        ld hl, constStrArr1_+2          ; * constStrArr1_ * strings array
        ld de, im_constStrArr1_+2      ; element 0
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        inc hl                  ;
        ld de, im_constStrArr1_+36      ; element 1
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        inc hl                  ;
        ld de, im_constStrArr1_+70      ; element 2
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        inc hl                  ;
                                ; (VariableDeclarator) constStrArr1_, end of...

                                ; (Literal) * 'Const array [1](8): ' *
        ld hl, stn_309          ; literal string address
        ld de, 20                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) constant * constArr1_ *
        ld hl, constArr1_            ; variable content
        push hl                 ; >>> push variable address (bogus)
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

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Const string array [2](two): ' *
        ld hl, stn_310          ; literal string address
        ld de, 29                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (Identifier) constant * constStrArr1_ *
        ld hl, constStrArr1_            ; variable content
        push hl                 ; >>> push variable address (bogus)
        push hl                 ; >>> push variable content

        ld de, 2                ; (Literal) literal int: * 2 *
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


        ld hl, mat2_          ; (VariableDeclarator) array/matrix assignment
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

        ld de, 6                ; (Literal) literal int: * 6 *
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

        ld de, 8                ; (Literal) literal int: * 8 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

        ld de, 9                ; (Literal) literal int: * 9 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (ArrayExpression) literal assignment
        pop de                  ; <<< pop value
        pop bc                  ; <<< pop address, unused
        ld (hl), e              ; write LSB
        inc hl                  ;
        ld (hl), d              ; write MSB
        inc hl                  ;

                                ; (VariableDeclarator) mat2_, end of...

                                ; (Literal) * 'Before, mat1[1][2](6): ' *
        ld hl, stn_312          ; literal string address
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


                                ; (AssignmentExpression) * = * value to array assignment
        ld de, 10                ; (Literal) literal int: * 10 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

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

        pop bc                  ; <<< pop right array value, unused
        pop hl                  ; <<< pop right array address
        pop de                  ; <<< pop right array value
        pop bc                  ; <<< pop right array address, unused
        ld (hl), e              ; write LSB
        inc hl                  ; next
        ld (hl), d              ; write MSB
        inc hl                  ; next


                                ; (Literal) * 'After, mat1[1][2](10): ' *
        ld hl, stn_313          ; literal string address
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
        ld hl, stn_314          ; literal string address
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

dic_315 inc ix                  ; skip size
        inc ix                  ;
        ld e, (ix+0)            ; read key, byte 1, from dictionary
        ld d, (ix+1)            ; read key, byte 2
        inc ix                  ; skip key, byte 2
        inc ix                  ; skip value
        xor a                   ;
        push hl                 ; >>> value to search
        sbc hl, de              ; compare search value with key
        pop hl                  ; <<< pop value to search
        jr z, dfo_316           ;
        djnz dic_315            ;

        ld de, 0                ; if not found, value= 0
        ld bc, 0                ; if not found, address= 0
        push bc                 ; >>> push value address
        push de                 ; >>> push value
        jr dex_317              ; skip match

dfo_316 ld e, (ix+0)            ; read value, byte 1, from dictionary
        ld d, (ix+1)            ; read value, byte 2
        push ix                 ; >>> push value address
        push de                 ; >>> push value 
dex_317                         ; (MemberExpression) exit dictionary access

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;



                                ; (Literal) * 'Before dic1[5])(99): ' *
        ld hl, stn_318          ; literal string address
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

dic_319 inc ix                  ; skip size
        inc ix                  ;
        ld e, (ix+0)            ; read key, byte 1, from dictionary
        ld d, (ix+1)            ; read key, byte 2
        inc ix                  ; skip key, byte 2
        inc ix                  ; skip value
        xor a                   ;
        push hl                 ; >>> value to search
        sbc hl, de              ; compare search value with key
        pop hl                  ; <<< pop value to search
        jr z, dfo_320           ;
        djnz dic_319            ;

        ld de, 0                ; if not found, value= 0
        ld bc, 0                ; if not found, address= 0
        push bc                 ; >>> push value address
        push de                 ; >>> push value
        jr dex_321              ; skip match

dfo_320 ld e, (ix+0)            ; read value, byte 1, from dictionary
        ld d, (ix+1)            ; read value, byte 2
        push ix                 ; >>> push value address
        push de                 ; >>> push value 
dex_321                         ; (MemberExpression) exit dictionary access

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '16-bit signed operations' *
        ld hl, stn_322          ; literal string address
        ld de, 24                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '100+10 (110): ' *
        ld hl, stn_323          ; literal string address
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
        ld hl, stn_324          ; literal string address
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
        ld hl, stn_325          ; literal string address
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
        ld hl, stn_326          ; literal string address
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
        ld hl, stn_327          ; literal string address
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
        ld hl, stn_328          ; literal string address
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
        ld hl, stn_329          ; literal string address
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
        ld hl, stn_330          ; literal string address
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
        ld hl, stn_331          ; literal string address
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
        ld hl, stn_332          ; literal string address
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
        ld hl, stn_333          ; literal string address
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
        ld hl, stn_334          ; literal string address
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


                                ; (Literal) * 'Signed comparisons' *
        ld hl, stn_335          ; literal string address
        ld de, 18                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '-5 < 0 (1): ' *
        ld hl, stn_336          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (UnaryExpression) * - *
        ld de, -5               ; (UnaryExpression) literal unary: * -5 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, lss_338          ; same sign
        bit 7, h                ; left negative?
        jp z, les_337          ; positive < negative is false
        inc e                   ; negative < positive is true
        jp les_337              ;
lss_338 xor a                   ;
        sbc hl, bc              ;
        jp nc, les_337          ; if >=, false -> skip change
        inc e                   ; condition=true
les_337 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '0 > -5 (1): ' *
        ld hl, stn_339          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (UnaryExpression) * - *
        ld de, -5               ; (UnaryExpression) literal unary: * -5 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

                                ; (BinaryExpression) * > * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: >
        ld de, 0                ; assume condition=false
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, mss_341          ; same sign
        bit 7, h                ; left negative?
        jp nz, mor_340          ; negative > positive is false
        inc e                   ; positive > negative is true
        jp mor_340              ;
mss_341 xor a                   ;
        sbc hl, bc              ;
        jp c, mor_340           ; if <, false -> skip change
        jp z, mor_340           ; if =, false -> skip change
        inc e                   ; condition=true
mor_340 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '-5 <= -5 (1): ' *
        ld hl, stn_342          ; literal string address
        ld de, 14                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (UnaryExpression) * - *
        ld de, -5               ; (UnaryExpression) literal unary: * -5 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

                                ; (UnaryExpression) * - *
        ld de, -5               ; (UnaryExpression) literal unary: * -5 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

                                ; (BinaryExpression) * <= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: <=
        ld de, 1                ; assume condition=true
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, les_344          ; same sign
        bit 7, h                ; left negative?
        jp nz, leq_343          ; negative <= positive is true
        dec e                   ; positive <= negative is false
        jp leq_343              ;
les_344 xor a                   ;
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_343           ; if <, true -> skip change
        jp z, leq_343           ; if =, true -> skip change
        dec e                   ; condition=false
leq_343 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '-5 >= 0 (0): ' *
        ld hl, stn_345          ; literal string address
        ld de, 13                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

                                ; (UnaryExpression) * - *
        ld de, -5               ; (UnaryExpression) literal unary: * -5 *
        push de                 ; >>> push value, unused
        push de                 ; >>> push record value

        ld de, 0                ; (Literal) literal int: * 0 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

                                ; (BinaryExpression) * >= * (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value
        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: >=
        ld de, 1                ; assume condition=true
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, ges_347          ; same sign
        bit 7, h                ; left negative?
        jp z, meq_346          ; positive >= negative is true
        dec e                   ; negative >= positive is false
        jp meq_346              ;
ges_347 xor a                   ;
        sbc hl, bc              ;
        jp nc, meq_346          ; if >=, true -> skip change
        dec e                   ; condition=false
meq_346 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        call prt_num            ; (CallExpression) print literal number

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
        push hl                 ; >>> push variable content

                                ; (UnaryExpression) * - *
        ld de, -5               ; (UnaryExpression) literal unary: * -5 *
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

                                ; (IfStatement) ***expression<0*** test
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, lss_351          ; same sign
        bit 7, h                ; left negative?
        jp z, les_350          ; positive < negative is false
        inc e                   ; negative < positive is true
        jp les_350              ;
lss_351 xor a                   ;
        sbc hl, bc              ;
        jp nc, les_350          ; if >=, false -> skip change
        inc e                   ; condition=true
les_350 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_348           ;
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

        jp ski_349              ; (IfStatement) ***expression<0*** skips else
els_348                         ; else

ski_349                         ; (IfStatement) ***expression<0*** end of...

                                ; (Literal) * 'ReLU -5 (0): ' *
        ld hl, stn_352          ; literal string address
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


                                ; (Literal) * 'Memory tests' *
        ld hl, stn_353          ; literal string address
        ld de, 12                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * 'Before (0): ' *
        ld hl, stn_354          ; literal string address
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
        ld hl, stn_355          ; literal string address
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


        ld de, 4096                ; (Literal) literal int: * 4096 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 61440                ; (Literal) literal int: * 61440 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        ld de, 255                ; (Literal) literal int: * 255 *
        push de                 ; >>> push bogus address, unused
        push de                 ; >>> push value

        call mem_cop            ; (CallExpression) copy memory block


                                ; (Literal) * 'Last block position (16): ' *
        ld hl, stn_356          ; literal string address
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
        ld hl, stn_357          ; literal string address
        ld de, 17                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


                                ; (Literal) * '0) literal' *
        ld hl, stn_358          ; literal string address
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

                                ; (Identifier) variable * text1_ *
        ld hl, text1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (text1_)          ; variable content
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
        ld hl, stn_359          ; literal string address
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

                                ; (Identifier) variable * text1_ *
        ld hl, text1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (text1_)          ; variable content
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
        ld hl, stn_360          ; literal string address
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


                                ; (VariableDeclarator) * num1_ *
                                ; (Identifier) variable * num1_ *
        ld hl, num1_            ; variable address
        push hl                 ; >>> push variable address
        ld hl, (num1_)          ; variable content
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

                                ; (VariableDeclarator) * = * string 
        ld hl, cars_+2          ; * cars_ * strings array
        ld de, im_cars_+2      ; element 0
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        inc hl                  ;
        ld de, im_cars_+36      ; element 1
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        inc hl                  ;
        ld de, im_cars_+70      ; element 2
        ld (hl), e              ;
        inc hl                  ;
        ld (hl), d              ;
        inc hl                  ;
                                ; (VariableDeclarator) cars_, end of...

                                ; (Literal) * 'array pos. lit (Saab): ' *
        ld hl, stn_364          ; literal string address
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
        ld hl, stn_366          ; literal string address
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
        ld hl, stn_368          ; literal string address
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

for_369                         ; (ForStatement) 2. test --------------
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
        ld a, h                 ; left sign
        xor b                   ; compare signs
        jp p, les_373          ; same sign
        bit 7, h                ; left negative?
        jp nz, leq_372          ; negative <= positive is true
        dec e                   ; positive <= negative is false
        jp leq_372              ;
les_373 xor a                   ;
        xor a                   ;
        sbc hl, bc              ;
        jp c, leq_372           ; if <, true -> skip change
        jp z, leq_372           ; if =, true -> skip change
        dec e                   ; condition=false
leq_372 push de                 ; >>> push condition boolean
        push de                 ; >>> push bogus value, unused
                                ; (BinaryExpression) end of...

        pop de                  ; (ForStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, fex_370           ;

                                ; (ForStatement) 3. body -------------
                                ; (Literal) * 'Position ' *
        ld hl, stn_374          ; literal string address
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
        ld hl, stn_375          ; literal string address
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


fup_371                         ; (ForStatement) 4. update ---------
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

        jp for_369
fex_370                         ; (ForStatement) end of...

                                ; (Literal) * '5) Comparison (different)' *
        ld hl, stn_377          ; literal string address
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
        ld hl, stn_378          ; literal string address
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
        ld hl, stn_379          ; literal string address
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
com_382 ld a, (de)              ; (BinaryExpression) == string
        sub (hl)                ;
        jr nz, cox_383          ; if one character is different, exit
        inc de                  ; next character
        inc hl                  ; next character
        djnz com_382            ; countdown until B=0

        inc c                   ; 
cox_383        push bc                 ; >>> bogus record address, unused
        push bc                 ; >>> comparison result

                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) <<< pop condition value
        pop hl                  ; <<< pop address, unused
        xor a                   ; A=0
        cp e                    ; if E=0, condition not fulfiled
        jp z, els_380           ;
                                ; (Literal) * 'same!' *
        ld hl, stn_384          ; literal string address
        ld de, 5                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


        jp ski_381              ; (IfStatement) ***expression==expression*** skips else
els_380                         ; else

                                ; (Literal) * 'different!' *
        ld hl, stn_385          ; literal string address
        ld de, 10                ; string length
        push de                 ; >>> push dummy content
        push hl                 ; >>> push literal address

        call prt_str            ; (CallExpression) print literal string

        ld a, 0x0d              ; (CallExpression) <cr> after prints
        rst 16                  ;


ski_381                         ; (IfStatement) ***expression==expression*** end of...

        ret                     ; end of code