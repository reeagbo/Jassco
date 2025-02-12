; Generated with ASsembly COmpiler, JASCO v0. Boria Labs 2025.
; Directives -------------------------------------------------
        str_max equ 32          ; maximum string length
        org 25000               ; initial code address

sta_cod jp mai_cod              ; jumps to main code

; Variable declarations --------------------------------------
        sta_ck2 defw 24500      ; auxiliary stack address
        eS_ equ 0             ;
        wP_ equ 5             ;
        wN_ equ 17             ;
        wB_ equ 25             ;
        wR_ equ 41             ;
        wQ_ equ 57             ;
        wK_ equ 65             ;
        bP_ equ 7             ;
        bN_ equ 19             ;
        bB_ equ 27             ;
        bR_ equ 43             ;
        bQ_ equ 59             ;
        bK_ equ 67             ;
pieces_   defw 13                  ; (VariableDeclarator) dictionary
        defw 0, 32               ;
        defw 7, 112               ;
        defw 19, 110               ;
        defw 27, 98               ;
        defw 43, 114               ;
        defw 59, 113               ;
        defw 67, 107               ;
        defw 5, 80               ;
        defw 17, 78               ;
        defw 25, 66               ;
        defw 41, 82               ;
        defw 57, 81               ;
        defw 65, 75               ;
board_   defb 128, 1              ; (VariableDeclarator) matrix (cols, rows)
        defw bR_, bN_, bB_, bQ_, bK_, bB_, bN_, bR_, 0, 0, 0, 0, 0, 0, 0, 0, bP_, bP_, bP_, bP_, bP_, bP_, bP_, bP_, 0, 0, 0, 0, 0, 0, 0, 0, eS_, eS_, eS_, eS_, eS_, eS_, eS_, eS_, 0, 0, 0, 0, 0, 0, 0, 0, eS_, eS_, eS_, eS_, eS_, eS_, eS_, eS_, 0, 0, 0, 0, 0, 0, 0, 0, eS_, eS_, eS_, eS_, eS_, eS_, eS_, eS_, 0, 0, 0, 0, 0, 0, 0, 0, eS_, eS_, eS_, eS_, eS_, eS_, eS_, eS_, 0, 0, 0, 0, 0, 0, 0, 0, wP_, wP_, wP_, wP_, wP_, wP_, wP_, wP_, 0, 0, 0, 0, 0, 0, 0, 0, wR_, wN_, wB_, wQ_, wK_, wB_, wN_, wR_, 0, 0, 0, 0, 0, 0, 0, 0 ;
vector_pointers_   defw 6                  ; (VariableDeclarator) dictionary
        defw 135, 250               ;
        defw 147, 244               ;
        defw 155, 251               ;
        defw 171, 241               ;
        defw 187, 249               ;
        defw 195, 249               ;
best_move_   defb 2, 1              ; (VariableDeclarator) empty matrix (cols, rows)
        defw 0, 0 ;
best_score_   defw 0                 ; (VariableDeclarator) variable int/bool
user_move_length_   defw 0                 ; (VariableDeclarator) variable int/bool
user_move_   defb 4, 1              ; (VariableDeclarator) empty matrix (cols, rows)
        defw 0, 0, 0, 0 ;
source_sq_   defw 0                 ; (VariableDeclarator) variable int/bool
target_sq_   defw 0                 ; (VariableDeclarator) variable int/bool
keyd_   defw 0                 ; (VariableDeclarator) variable int/bool
key_     defw 0        ; (FunctionDeclaration) literal int/bool
keydownstate defw 1               ; (CallExpression) add/remove flag

; Include files ----------------------------------------------

; Program code -----------------------------------------------


; (FunctionDeclaration) Function: parseSquare_
parseSquare_                      ; (FunctionDeclaration) ***parseSquare_***
        pop hl                  ; <<< return address
        ld (sta_ck2), hl        ; save return address
        ld hl, sta_ck2          ; needed in case another function comes in
        inc (hl)                ; update stack2 pointer
        inc (hl)                ;
                                ; (FunctionDeclaration) collect parameters

                                ; (FunctionDeclaration) function body

        ld hl, sta_ck2          ; update stack2 pointer
        dec (hl)                ; update pointer
        dec (hl)                ;
        ld hl, (sta_ck2)        ; save return address
        push hl                 ; >>> return address

fex_000 ret                     ; (FunctionDeclaration) end of...


; (FunctionDeclaration) Function: userInput_
userInput_                      ; (FunctionDeclaration) ***userInput_***
        pop hl                  ; <<< return address
        ld (sta_ck2), hl        ; save return address
        ld hl, sta_ck2          ; needed in case another function comes in
        inc (hl)                ; update stack2 pointer
        inc (hl)                ;
                                ; (FunctionDeclaration) collect parameters

        ld hl, key_            ;
        pop de                  ; <<< pop parameter key_
        pop bc                  ; <<< pop address key_, unused
        ld (hl), e              ; store it in memory
        inc hl                  ;
        ld (hl), d              ;

                                ; (FunctionDeclaration) function body

                                ; (Identifier) *** user_move_ ***
        ld hl, user_move_            ; variable address
        push hl                 ; >>>
        ld hl, (user_move_)          ; variable content
        push hl                 ; >>>

                                ; (Identifier) *** user_move_length_ ***
        ld hl, user_move_length_            ; variable address
        push hl                 ; >>>
        ld hl, (user_move_length_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array addres + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (Identifier) *** key_ ***
        ld hl, key_            ; variable address
        push hl                 ; >>>
        ld hl, (key_)          ; variable content
        push hl                 ; >>>

                                ; (AssignmentExpression) *** = *** (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< DE has the result
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Identifier) *** user_move_length_ ***
        ld hl, user_move_length_            ; variable address
        push hl                 ; >>>
        ld hl, (user_move_length_)          ; variable content
        push hl                 ; >>>

                                ; (UpdateExpression) *** ++ ***
        pop hl                  ; <<< pop left side value, not used
        pop hl                  ; <<< pop left side address
        inc (hl)                ; (UpdateExpression) increment

                                ; (IfStatement) 
                                ; (Identifier) *** user_move_length_ ***
        ld hl, user_move_length_            ; variable address
        push hl                 ; >>>
        ld hl, (user_move_length_)          ; variable content
        push hl                 ; >>>

                                ; (Literal) *** 4 ***
        ld hl, 24000            ; get a garbage zone address
        ld de, 4                ; collect value
        push hl                 ; >>> push garbage zone address
        ld (hl), e              ; save value in garbage zone
        inc hl                  ;
        ld (hl), d              ;
        push de                 ; >>> push value

                                ; (BinaryExpression) *** == *** (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value

        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition is ok
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_004            ; if =, skip
        dec e                   ; false
equ_004 push de                 ; >>> push condition boolean
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) 
        xor a                   ; A=0
        cp e                    ; if E=1, condition fulfiled
        jp z, els_002           ;

                                ; (Identifier) *** source_sq_ ***
        ld hl, source_sq_            ; variable address
        push hl                 ; >>>
        ld hl, (source_sq_)          ; variable content
        push hl                 ; >>>

                                ; (CallExpression): parseSquare_
                                ; (Identifier) *** user_move_ ***
        ld hl, user_move_            ; variable address
        push hl                 ; >>>
        ld hl, (user_move_)          ; variable content
        push hl                 ; >>>

                                ; (Literal) *** 0 ***
        ld hl, 24002            ; get a garbage zone address
        ld de, 0                ; collect value
        push hl                 ; >>> push garbage zone address
        ld (hl), e              ; save value in garbage zone
        inc hl                  ;
        ld (hl), d              ;
        push de                 ; >>> push value

                                ; (MemberExpression) array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array addres + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (Identifier) *** user_move_ ***
        ld hl, user_move_            ; variable address
        push hl                 ; >>>
        ld hl, (user_move_)          ; variable content
        push hl                 ; >>>

                                ; (Literal) *** 1 ***
        ld hl, 24004            ; get a garbage zone address
        ld de, 1                ; collect value
        push hl                 ; >>> push garbage zone address
        ld (hl), e              ; save value in garbage zone
        inc hl                  ;
        ld (hl), d              ;
        push de                 ; >>> push value

                                ; (MemberExpression) array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array addres + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (BinaryExpression) *** + *** (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value

        pop de                  ; <<< pop left side address, not used

        add hl, bc              ; (BinaryExpression) 16-bit addition
        ex de, hl               ; result in DE
        ld hl, 24006            ;
        push hl                 ; >>> push address
        ld (hl), e              ; copy result to garbage zone
        inc hl                  ; (BinaryExpression) pop result
        ld (hl), d              ; push garbage zone address
        push de                 ; >>> push result
                                ; (BinaryExpression) end of...

        call parseSquare_            ; (CallExpression): call parseSquare_

                                ; (AssignmentExpression) *** = *** (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< DE has the result
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (Identifier) *** target_sq_ ***
        ld hl, target_sq_            ; variable address
        push hl                 ; >>>
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>>

                                ; (CallExpression): parseSquare_
                                ; (Identifier) *** user_move_ ***
        ld hl, user_move_            ; variable address
        push hl                 ; >>>
        ld hl, (user_move_)          ; variable content
        push hl                 ; >>>

                                ; (Literal) *** 2 ***
        ld hl, 24008            ; get a garbage zone address
        ld de, 2                ; collect value
        push hl                 ; >>> push garbage zone address
        ld (hl), e              ; save value in garbage zone
        inc hl                  ;
        ld (hl), d              ;
        push de                 ; >>> push value

                                ; (MemberExpression) array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array addres + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (Identifier) *** user_move_ ***
        ld hl, user_move_            ; variable address
        push hl                 ; >>>
        ld hl, (user_move_)          ; variable content
        push hl                 ; >>>

                                ; (Literal) *** 3 ***
        ld hl, 24010            ; get a garbage zone address
        ld de, 3                ; collect value
        push hl                 ; >>> push garbage zone address
        ld (hl), e              ; save value in garbage zone
        inc hl                  ;
        ld (hl), d              ;
        push de                 ; >>> push value

                                ; (MemberExpression) array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array addres + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (BinaryExpression) *** + *** (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value

        pop de                  ; <<< pop left side address, not used

        add hl, bc              ; (BinaryExpression) 16-bit addition
        ex de, hl               ; result in DE
        ld hl, 24012            ;
        push hl                 ; >>> push address
        ld (hl), e              ; copy result to garbage zone
        inc hl                  ; (BinaryExpression) pop result
        ld (hl), d              ; push garbage zone address
        push de                 ; >>> push result
                                ; (BinaryExpression) end of...

        call parseSquare_            ; (CallExpression): call parseSquare_

                                ; (AssignmentExpression) *** = *** (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address
        pop hl                  ; <<< pop left side value

        push bc                 ; >>> push right side value
        pop de                  ; <<< DE has the result
        pop hl                  ; <<< pop left side address
        ld (hl), e              ; write value in destination address
        inc hl                  ;
        ld (hl), d              ;
                                ; (AssignmentExpression) end of...

                                ; (IfStatement) 
                                ; (Identifier) *** board_ ***
        ld hl, board_            ; variable address
        push hl                 ; >>>
        ld hl, (board_)          ; variable content
        push hl                 ; >>>

                                ; (Identifier) *** target_sq_ ***
        ld hl, target_sq_            ; variable address
        push hl                 ; >>>
        ld hl, (target_sq_)          ; variable content
        push hl                 ; >>>

                                ; (MemberExpression) array access
        pop hl                  ; <<< pop record index
        pop de                  ; <<< pop record index address, unused
        pop de                  ; <<< pop array content, unused
        pop de                  ; <<< pop array address
        inc hl                  ;
        add hl, hl              ; record position
        add hl, de              ; array addres + record position
        push hl                 ; >>> push address
        ld e, (hl)              ; position content!
        inc hl                  ;
        ld d, (hl)              ;
        push de                 ; >>> push content

                                ; (Identifier) *** bK_ ***
        ld hl, bK_            ; variable address
        push hl                 ; >>>
        ld hl, (bK_)          ; variable content
        push hl                 ; >>>

                                ; (BinaryExpression) *** == *** (int)
        pop bc                  ; <<< pop right side value
        pop de                  ; <<< pop right side address, not used
        pop hl                  ; <<< pop left side value

        pop de                  ; <<< pop left side address, not used
                                ; (BinaryExpression) operation: ==
        ld de, 1                ; assume condition is ok
        xor a                   ;
        sbc hl, bc              ;
        jp z, equ_007            ; if =, skip
        dec e                   ; false
equ_007 push de                 ; >>> push condition boolean
                                ; (BinaryExpression) end of...

        pop de                  ; (IfStatement) 
        xor a                   ; A=0
        cp e                    ; if E=1, condition fulfiled
        jp z, els_005           ;

        jp ski_006              ; (IfStatement)
els_005                         ; else

ski_006                         ; (IfStatement) end of...

        jp ski_003              ; (IfStatement)
els_002                         ; else

ski_003                         ; (IfStatement) end of...

        ld hl, sta_ck2          ; update stack2 pointer
        dec (hl)                ; update pointer
        dec (hl)                ;
        ld hl, (sta_ck2)        ; save return address
        push hl                 ; >>> return address

fex_001 ret                     ; (FunctionDeclaration) end of...

mai_cod                         ; main code

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
        jr rea_key              ; loop while eventListener is active

        ret                     ; end of code