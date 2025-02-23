from config import (
    nodes_code,
    label_count,
    include_filenames_list,
    function_declarations, variable_declarations,
    function_end_tag, function_exit_tag,
    string_max_length,
    matrix_type_list, object_type_list, variable_type_list, array_type_list, string_type_list
)
from utils import *
import esprima

def translate_to_assembly(js_code):
    #--------------------------------------------------------------------------         
    # Parse JavaScript using esprima
    ast = esprima.parseScript(js_code)

    def process_node(node):
        global garbage_address, discriminant_name, array_name, variable_declarations, \
            function_end_tag, function_exit_tag, \
            matrix_type_list, object_type_list, variable_type_list, array_type_list, string_type_list, \
            variable_kind, \
            break_label, update_label
        
        #print (node)
        
        match node.type:          
            #------------------------------------------------------------------
            case "AssignmentExpression":
                #print (node)
                
                #print (f" variable list: {variable_type_list}")
                #print (f" array list: {array_type_list}")
                #print (f" object list: {object_type_list}")
                #print (f" matrix list: {matrix_type_list}")
                #print (f" string list: {string_type_list}")
                
                operator_name= node.operator
                
                # figure out variable name and check declaration
                variable_name="" # numerical variables
                array_name="" # arrays
                matrix_name="" # 2D matrices
                object_name="" # dictionaries
                
                # find the structure type and its name
                if hasattr(node.left, 'name') and node.left.name != None: # literals and variables
                    variable_name= add_underscore_to_var(node.left.name)
                elif hasattr(node.left.object, 'name') and node.left.object.name != None: # arrays or dictionaries have the same appearance
                    object_name= add_underscore_to_var(node.left.object.name)
                if node.left.object and hasattr(node.left.object.object, 'name') and node.left.object.object.name != None: # matrices
                    matrix_name= add_underscore_to_var(node.left.object.object.name)
                
                # if the variable has been declared, proceed to establish content type
                content_type=""
                if variable_name in variable_type_list:
                    content_type = variable_type_list[variable_name]
                if variable_name in string_type_list:
                    content_type = string_type_list[variable_name]
                if object_name in array_type_list:
                    content_type = array_type_list[object_name] # correct: arrays and dictionaries share structure
                if matrix_name in matrix_type_list:
                    content_type = matrix_type_list[matrix_name]
                if object_name in object_type_list:
                    content_type = object_type_list[object_name] # correct: arrays and dictionaries share structure
                
                if content_type != "":
                    #print (f"AssignmentExpression: {variable_name}: {content_type}")       
                    match content_type:
                        
                        # integer
                        case "int":
                            # process variable
                            process_node(node.left)
                            # process value
                            process_node(node.right)
                            
                            # read right node (DE= address, HL= value)
                            nodes_code.append(f"                                ; ({node.type}) *** {operator_name} *** (int)")
                            nodes_code.append(f"        pop bc                  ; <<< pop right side value")
                            nodes_code.append(f"        pop de                  ; <<< pop right side address")
                            nodes_code.append(f"        pop hl                  ; <<< pop left side value")
    
                            # read left node and run operation
                            match operator_name:
                                case "=":
                                    nodes_code.append(f"        push bc                 ; >>> push right side value")
                                    nodes_code.append(f"        pop de                  ; <<< pop right side value")
                        
                                case "+=":
                                    nodes_code.append(f"        add hl, bc              ; HL has the result")
                                    nodes_code.append(f"        ex de, hl               ; DE has the result")
                                                                        
                                case "-=":
                                    nodes_code.append(f"        sbc hl, bc              ; HL has the result")
                                    nodes_code.append(f"        ex de, hl               ; DE has the result")
                                    
                                case "*=":
                                    nodes_code.append(f"        push hl                 ;")
                                    nodes_code.append(f"        push bc                 ;")
                                    nodes_code.append(f"        call mul_16b            ;")
                                    nodes_code.append(f"        pop de                  ; DE has the result")
                                
                                case "/=":
                                    nodes_code.append(f"        push hl                 ;")
                                    nodes_code.append(f"        push bc                 ;")
                                    nodes_code.append(f"        call div_16b            ;  ({node.type})")
                                    nodes_code.append(f"        pop de                  ; DE has the result")
                                    nodes_code.append(f"        pop hl                  ; remainder, not used")
                                      
                                case "%=":
                                    nodes_code.append(f"        push hl                 ;")
                                    nodes_code.append(f"        push bc                 ;")
                                    nodes_code.append(f"        call div_16b            ;  ({node.type})")
                                    nodes_code.append(f"        pop hl                  ; result, not used")
                                    nodes_code.append(f"        pop de                  ; remainder, DE has the result")   
                                
                                case "&=":
                                    nodes_code.append(f"        ld a, h                 ; high byte")
                                    nodes_code.append(f"        and b                   ;")
                                    nodes_code.append(f"        ld d, a                 ;")
                                    nodes_code.append(f"        ld a, l                 ; low byte")
                                    nodes_code.append(f"        and c                   ;")
                                    nodes_code.append(f"        ld e, a                 ; DE has the result")
                                    
                                case "|=":
                                    nodes_code.append(f"        ld a, h                 ; high byte")
                                    nodes_code.append(f"        or b                   ;")
                                    nodes_code.append(f"        ld d, a                 ;")
                                    nodes_code.append(f"        ld a, l                 ; low byte")
                                    nodes_code.append(f"        or c                   ;")
                                    nodes_code.append(f"        ld e, a                 ; DE has the result")
                                
                                case "^=":
                                    nodes_code.append(f"        ld a, h                 ; high byte")
                                    nodes_code.append(f"        xor b                   ;")
                                    nodes_code.append(f"        ld d, a                 ;")
                                    nodes_code.append(f"        ld a, l                 ; low byte")
                                    nodes_code.append(f"        xor c                   ;")
                                    nodes_code.append(f"        ld e, a                 ; DE has the result")
                                    
                                case "<<=":
                                    asg_label = new_label("asg_")
                                    
                                    nodes_code.append(f"        ld b, c                 ; number of shifts")
                                    nodes_code.append(f"{asg_label} add hl, hl              ; shift left")
                                    nodes_code.append(f"        djnz {asg_label}            ;")                                    

                                    nodes_code.append(f"        push hl                 ;")
                                    nodes_code.append(f"        pop de                  ; DE has the result")
                                    
                                case ">>=":
                                    asg_label = new_label("asg_")
                                    nodes_code.append(f"        ld b, c                 ; number of shifts")
                                    nodes_code.append(f"{asg_label} srl h                   ; shift right 1")
                                    nodes_code.append(f"        rr l                    ; shift right 2")
                                    nodes_code.append(f"        djnz {asg_label}            ;")                                    
                                    nodes_code.append(f"        push hl                 ;")
                                    nodes_code.append(f"        pop de                  ; DE has the result")
                                               
                                case _:
                                    print (f"{node.type}: {operator_name} operation not supported for integers.")
                            
                            nodes_code.append(f"        pop hl                  ; <<< pop left side address")
                            nodes_code.append(f"        ld (hl), e              ; write value in destination address")
                            nodes_code.append(f"        inc hl                  ;")
                            nodes_code.append(f"        ld (hl), d              ;")
                            
                            nodes_code.append(f"                                ; ({node.type}) end of...")
                            
                        # string
                        case "str":
                            # process variable
                            process_node(node.left)
                            # process value
                            process_node(node.right)
                            
                            nodes_code.append(f"                                ; ({node.type}) *** {operator_name} *** copy string")
                            match operator_name:
                                case "=":
                                    copy_label= new_label ("cop_")
                                    # assign string address to variable
                                    nodes_code.append(f"        pop bc                  ; pop right string value, unused")
                                    nodes_code.append(f"        pop de                  ; pop right string address")
                                    nodes_code.append(f"        pop hl                  ; pop left variable value, unused")
                                    nodes_code.append(f"        pop hl                  ; pop left variable address")
                                    
                                    # find right string length
                                    nodes_code.append(f"        ld a, (de)              ; right length as counter, always < 256")
                                    nodes_code.append(f"        ld b, a                 ;")
                                    nodes_code.append(f"        inc b                   ; include length in byte count")
                                    nodes_code.append(f"        inc b                   ;\n")

                                    nodes_code.append(f"{copy_label} ld a, (de)              ; ({node.type}) {operator_name} string")
                                    nodes_code.append(f"        ld (hl), a              ;")
                                    nodes_code.append(f"        inc de                  ;")
                                    nodes_code.append(f"        inc hl                  ;")
                                    nodes_code.append(f"        djnz {copy_label}            ;\n")
                   
                                case _:
                                    print (f"{node.type}: {variable_name}, operation not supported for strings.")
                            
                        case _:
                            print (f"{node.type}: {variable_name}, type not supported.")
                    nodes_code.append ("")
                
                elif variable_name =="":
                    pass  
                else:
                    print (f"{node.type}: {variable_name} not declared as a variable.")
                                
            case "BlockStatement":
                for statement in node.body:
                    process_node(statement)

            case "ExpressionStatement":
                process_node(node.expression)
                
            #------------------------------------------------------------------            
            case "BinaryExpression":
                #print (node)
                
                #print (f"Binary expression:")
                #print (f"variable list: {variable_type_list}")
                #print (f"string list:   {string_type_list}")
                #print (f"array list:    {array_type_list}")
                #print (f"object list:   {object_type_list}")
                #print (f"matrix list:   {matrix_type_list}")
                
                operator_name= node.operator
                # find out the variable type
                # plain variables
                
                if node.left.name: 
                    parameter_left_name= add_underscore_to_var(node.left.name)
                    if parameter_left_name in variable_type_list:
                        value_type= variable_type_list[parameter_left_name]
                    if parameter_left_name in string_type_list:
                        value_type= string_type_list[parameter_left_name]
                elif node.right.name:
                    parameter_right_name= add_underscore_to_var(node.right.name)
                    if parameter_right_name in variable_type_list:
                        value_type= variable_type_list[parameter_right_name]
                    if parameter_right_name in string_type_list:
                        value_type= string_type_list[parameter_right_name]
                # literals
                elif node.left.type == "Literal":
                    value_type= type(node.left.value).__name__
                # unaries
                elif node.left.type == "UnaryExpression":
                    value_type= type(node.left.argument.value).__name__
                # arrays
                elif node.left.type == "MemberExpression":
                    node_object_name=add_underscore_to_var(node.left.object.name)
                    if node_object_name in array_type_list:
                        value_type= array_type_list[node_object_name]
                    if node_object_name in string_type_list:
                        value_type= string_type_list[node_object_name]
                else:
                    value_type= "int" # pending...default to this is not correct and rarely happens.
                                    
                process_node(node.left)  # Process left operand
                process_node(node.right)  # Process right operand
                
                match value_type:
                    case "int" | "NoneType": #temporary integer and boolean operations
                        nodes_code.append(f"                                ; ({node.type}) *** {operator_name} *** (int)")
                        nodes_code.append(f"        pop bc                  ; <<< pop right side value")
                        nodes_code.append(f"        pop de                  ; <<< pop right side address, not used")
                        nodes_code.append(f"        pop hl                  ; <<< pop left side value")
                        
                        match operator_name:
                            # comparison operations
                            case "==" | "!=" | "<" | ">" |"<=" | ">=":
                                nodes_code.append(f"        pop de                  ; <<< pop left side address, not used")
                                nodes_code.append(f"                                ; ({node.type}) operation: {operator_name}")
                                match operator_name:
                                    case "==":
                                        equ_label = new_label("equ_")
                                        nodes_code.append(f"        ld de, 1                ; assume condition is ok")
                                        nodes_code.append(f"        xor a                   ;")
                                        nodes_code.append(f"        sbc hl, bc              ;")
                                        nodes_code.append(f"        jp z, {equ_label}           ; if =, skip")
                                        nodes_code.append(f"        dec e                   ; false")
                                        nodes_code.append(f"{equ_label} push de                 ; >>> push condition boolean")
                                        
                                    case "!=":
                                        equ_label = new_label("neq_")
                                        nodes_code.append(f"        ld de, 1                ; assume condition is ok")
                                        nodes_code.append(f"        xor a                   ;")
                                        nodes_code.append(f"        sbc hl, bc              ;")
                                        nodes_code.append(f"        jp nz, {equ_label}           ; if =, skip")
                                        nodes_code.append(f"        dec e                   ; true")
                                        nodes_code.append(f"{equ_label} push de                 ; >>> push condition boolean")
                                        
                                    case "<":
                                        equ_label = new_label("les_")
                                        nodes_code.append(f"        ld de, 0                ; assume condition is not ok")
                                        nodes_code.append(f"        xor a                   ;")
                                        nodes_code.append(f"        sbc hl, bc              ;")
                                        nodes_code.append(f"        jp nc, {equ_label}          ;")
                                        nodes_code.append(f"        jp z, {equ_label}           ;")
                                        nodes_code.append(f"        inc e                   ; true")
                                        nodes_code.append(f"{equ_label} push de                 ; >>> push condition boolean")
                                        
                                    case ">":
                                        equ_label = new_label("mor_")
                                        nodes_code.append(f"        ld de, 0                ; assume condition is not ok")
                                        nodes_code.append(f"        xor a                   ;")
                                        nodes_code.append(f"        sbc hl, bc              ;")
                                        nodes_code.append(f"        jp c, {equ_label}           ;")
                                        nodes_code.append(f"        jp z, {equ_label}           ;")                        
                                        nodes_code.append(f"        inc e                   ; true")
                                        nodes_code.append(f"{equ_label} push de                 ; >>> push condition boolean")
                                        
                                    case ">=":
                                        equ_label = new_label("meq_")
                                        nodes_code.append(f"        ld de, 1                ;  assume condition is ok")
                                        nodes_code.append(f"        xor a                   ;")
                                        nodes_code.append(f"        sbc hl, bc              ;")
                                        nodes_code.append(f"        jp nc, {equ_label}          ;")
                                        nodes_code.append(f"        dec e                   ; false")
                                        nodes_code.append(f"{equ_label} push de                 ; >>> push condition boolean")
                                        
                                    case "<=":
                                        equ_label = new_label("leq_")
                                        nodes_code.append(f"        ld de, 1                ;")
                                        nodes_code.append(f"        xor a                   ;")
                                        nodes_code.append(f"        sbc hl, bc              ;")
                                        nodes_code.append(f"        jp c, {equ_label}           ;")
                                        nodes_code.append(f"        jp z, {equ_label}           ;")
                                        nodes_code.append(f"        dec e                   ; false")
                                        nodes_code.append(f"{equ_label} push de                 ; >>> push condition boolean")
                                        
                            # arithmetical operations
                            case "+" | "-" | "*" | "/" | "%":
                                nodes_code.append(f"        pop de                  ; <<< pop left side address, not used\n")
                                match operator_name:
                                    case "+":
                                        nodes_code.append(f"        add hl, bc              ; ({node.type}) 16-bit addition")
                                        
                                    case "-":
                                        nodes_code.append(f"        xor a                   ;")
                                        nodes_code.append(f"        sbc hl, bc              ; ({node.type}) 16-bit subtraction")
                                        
                                    case "*":
                                        nodes_code.append(f"        push hl                 ; >>> operand left")
                                        nodes_code.append(f"        push bc                 ; >>> operand right")
                                        nodes_code.append(f"        call mul_16b            ; ({node.type}) 16-bit multiplication")
                                        nodes_code.append(f"        pop hl                  ; <<< pop result")
                                        
                                    case "/":
                                        nodes_code.append(f"        push hl                 ; >>> operand left")
                                        nodes_code.append(f"        push bc                 ; >>> operand right")
                                        nodes_code.append(f"        call div_16b            ; ({node.type}) 16-bit division")
                                        nodes_code.append(f"        pop hl                  ; <<< pop result")
                                        nodes_code.append(f"        pop de                  ; <<< pop remainder, not used")
                                        
                                    case "%":
                                        nodes_code.append(f"        push hl                 ; >>> operand left")
                                        nodes_code.append(f"        push bc                 ; >>> operand right")
                                        nodes_code.append(f"        call div_16b            ; ({node.type}) 16-bit division")
                                        nodes_code.append(f"        pop de                  ; <<< pop result, not used")
                                        nodes_code.append(f"        pop hl                  ; <<< pop remainder")
                            
                                # common code
                                garbage_address=get_garbage_address(2)
                                nodes_code.append(f"        ex de, hl               ; result in DE")
                                nodes_code.append(f"        ld hl, {garbage_address}            ;")
                                nodes_code.append(f"        push hl                 ; >>> push address")
                                nodes_code.append(f"        ld (hl), e              ; copy result to garbage zone")
                                nodes_code.append(f"        inc hl                  ; ({node.type}) pop result")
                                nodes_code.append(f"        ld (hl), d              ; push garbage zone address")
                                nodes_code.append(f"        push de                 ; >>> push result\n")
                                    
                            # logical operations
                            case "&" | "|" | "^":
                                nodes_code.append(f"        pop de                  ; <<< pop left side address, not used\n")
                                match operator_name:
                                    case "&":
                                        nodes_code.append(f"        ld a, h                 ; high byte")
                                        nodes_code.append(f"        and b                   ;")
                                        nodes_code.append(f"        ld d, a                 ;")
                                        nodes_code.append(f"        ld a, l                 ; low byte")
                                        nodes_code.append(f"        and c                   ;")
                                        nodes_code.append(f"        ld e, a                 ;")
                                        
                                    case "|":
                                        nodes_code.append(f"        ld a, h                 ; high byte")
                                        nodes_code.append(f"        or b                    ;")
                                        nodes_code.append(f"        ld d, a                 ;")
                                        nodes_code.append(f"        ld a, l                 ; low byte")
                                        nodes_code.append(f"        or c                    ;")
                                        nodes_code.append(f"        ld e, a                 ;")
                                        
                                    case "^":
                                        nodes_code.append(f"        ld a, h                 ; high byte")
                                        nodes_code.append(f"        xor b                   ;")
                                        nodes_code.append(f"        ld d, a                 ;")
                                        nodes_code.append(f"        ld a, l                 ; low byte")
                                        nodes_code.append(f"        xor c                   ;")
                                        nodes_code.append(f"        ld e, a                 ;")
                                           
                                # common code
                                garbage_address=get_garbage_address(2)
                                nodes_code.append(f"        ld hl, {garbage_address}            ;")
                                nodes_code.append(f"        push hl                 ; >>> push address")
                                nodes_code.append(f"        ld (hl), e              ; copy result to garbage zone")
                                nodes_code.append(f"        inc hl                  ; ({node.type}) pop result")
                                nodes_code.append(f"        ld (hl), d              ; push garbage zone address")
                                nodes_code.append(f"        push de                 ; >>> push result\n")
        
                            case _:
                                print(f"{node.type}: Operation {node.operator} not supported for integers.")
                        
                        nodes_code.append(f"                                ; ({node.type}) end of...\n")
                    
                    # string operations            
                    case "str":
                        nodes_code.append(f"                                ; ({node.type}) *** {operator_name} *** (str)")
                        match operator_name:
                            case "==":
                                compare_label= new_label ("com_")
                                compare_exit_label= new_label ("cox_")
                                # assign string address to variable
                                nodes_code.append(f"        pop bc                  ; pop right string length")
                                nodes_code.append(f"        pop de                  ; pop right string address")
                                nodes_code.append(f"        pop hl                  ; pop left variable length, unused")
                                nodes_code.append(f"        pop hl                  ; pop left variable address")
                                nodes_code.append(f"        ld b, c                 ; prepare countdown")
                                nodes_code.append(f"        inc b                   ; include length in byte count")
                                nodes_code.append(f"        inc b                   ;\n")

                                nodes_code.append(f"        ld c, 0                 ; C=0, assume the strings are different")
                                nodes_code.append(f"{compare_label} ld a, (de)              ; ({node.type}) {operator_name} string")
                                nodes_code.append(f"        sub (hl)                ;")
                                nodes_code.append(f"        jr nz, {compare_exit_label}          ; if one character is different, exit")
                                nodes_code.append(f"        inc de                  ; next character")
                                nodes_code.append(f"        inc hl                  ; next character")
                                nodes_code.append(f"        djnz {compare_label}            ; countdown until B=0\n")
                                nodes_code.append(f"        inc c                   ; ")
                                nodes_code.append(f"{compare_exit_label} ld b, 0                 ;")
                                nodes_code.append(f"        push bc                 ;\n")
                            
                            case "+":
                                # get both sides strings processed
                                process_node(node.left)
                                process_node(node.right)
                                
                                
                            case _:
                                print(f"{node.type}: Operation {node.operator} not supported for strings.")
                        
                        nodes_code.append(f"                                ; ({node.type}) end of...\n")
            #------------------------------------------------------------------
            case "CallExpression":
                #print (node)

                function_name = node.callee.name
                # functions ---------------------------------------------------
                match function_name:
                    # eval(): fake calls for raw assembly
                    case "eval":
                        if node.arguments:
                            nodes_code.append(f"        {node.arguments[0].value}") # take the eval argument only
                    
                    # include(): read filenames and add them to the includes list
                    case "include": 
                        filename = node.arguments[0].value
                        include_filenames_list.append(filename)
                        
                    # read(): read keyboard
                    case "read":
                    # process argument
                        #arg = node.arguments[0]
                        variable_name = add_underscore_to_var(node.arguments[0].name)
                        if variable_name in string_type_list:
                            variable_type = string_type_list[variable_name]
                            
                            match variable_type:
                                case "int":
                                    # assembly code
                                    nodes_code.append(f"                                ; ({node.type}) read integer")
                                    nodes_code.append(f"        ld hl, {garbage_address}          ; garbage zone")
                                    nodes_code.append(f"        push hl                 ; push garbage zone address")
                                    nodes_code.append(f"        call rea_kbd            ; read integer\n")
                                    nodes_code.append(f"        call str2int            ; ({node.type}) string to integer")
                                    nodes_code.append(f"                                ; save value to variable")                    
                                    nodes_code.append(f"        pop hl                  ; pop decimal value")
                                    nodes_code.append(f"        ld ({variable_name}), hl      ; ")
                                    
                                case "str":
                                    # variable processing
                                    process_node(node.arguments[0]) # needed to create the variable
                                    # assembly code
                                    nodes_code.append(f"        call rea_kbd            ; ({node.type}) read string\n")
                                    
                        else: # variable does not exist
                            print(f"{node.type}: Undefined {variable_name}")
                        nodes_code.append ("")
                        
                    # Objects -----------------------------------------------------   
                    case _:
                        object_name = getattr(node.callee.object, "name", None)
                        property_name = getattr(node.callee.property, "name", None)
                        
                        #print (f" variable list: {variable_type_list}")
                        #print (f" array list: {array_type_list}")
                        #print (f" object list: {object_type_list}")
                        #print (f" matrix list: {matrix_type_list}")
                        #print (f" string list: {string_type_list}")
                        
                        # string objects methods ----------------------------------
                        if object_name and add_underscore_to_var(object_name) in string_type_list:
                            
                            # get string and index in the stack
                            process_node (node.callee.object)
                            process_node (node.arguments[0])
                                
                            nodes_code.append(f"                                ; ({node.type}) *** {property_name} ***")           
                            
                            string_name=add_underscore_to_var(node.callee.object.name)
                            match property_name: 
                                case "charAt" | "charCodeAt":
                                    nodes_code.append(f"        pop de                  ; <<< pop index value")
                                    nodes_code.append(f"        pop hl                  ; <<< pop index address, unused")
                                    nodes_code.append(f"        pop hl                  ; <<< pop string content, unused")
                                    nodes_code.append(f"        pop hl                  ; <<< pop string address\n")
                                    
                                    nodes_code.append(f"                                ; get char and put it garbage zone") 
                                    nodes_code.append(f"        inc hl                  ; skip length")
                                    nodes_code.append(f"        inc hl                  ;")
                                    nodes_code.append(f"        add hl, de              ; string record")
                                    nodes_code.append(f"        ld d, 0                 ; get char")
                                    nodes_code.append(f"        ld e, (hl)              ; get char")
                                    # send char to garbage zone
                                    garbage_address=get_garbage_address(2)
                                    nodes_code.append(f"        ld hl, {garbage_address}            ;")
                                    nodes_code.append(f"        push hl                 ; >>> record address")
                                    nodes_code.append(f"        push de                 ; >>> record value")
                                    nodes_code.append(f"        ld (hl), 1              ; set length")
                                    nodes_code.append(f"        inc hl                  ;")
                                    nodes_code.append(f"        ld (hl), 0              ; set length")
                                    nodes_code.append(f"        inc hl                  ;")
                                    nodes_code.append(f"        ld (hl), e              ; set char\n")
                                    
                                #case "charCodeAt":

                        # special case: console.log() call to print text
                        if object_name == "console":
                            
                            #print (f" variable list: {variable_type_list}")
                            #print (f" array list: {array_type_list}")
                            #print (f" object list: {object_type_list}")
                            #print (f" matrix list: {matrix_type_list}")
                            #print (f" string list: {string_type_list}")
                            match property_name:
                                # log for JS compatibility
                                case "log":
                                    if node.arguments:
                                        for argument in node.arguments: # for every parameter in the call
                                            process_node(argument)
                                            nodes_code.append(f"        call prt_str            ; ({node.type}) print string")
    
                                        # add new line after all arguments
                                        nodes_code.append(f"        ld a, 0x0d              ; ({node.type}) <cr> after prints") 
                                        nodes_code.append(f"        rst 16                  ;")
                                        nodes_code.append ("")                           

                                # print string
                                case "logstring":
                                    if node.arguments:
                                        for argument in node.arguments: # for every parameter in the call
                                            process_node(argument)
                                            nodes_code.append(f"        call prt_str            ; ({node.type}) print string")
                                            nodes_code.append ("") 
 
                                # print numbers
                                case "lognumber":
                                    if node.arguments:
                                        for argument in node.arguments: # for every parameter in the call
                                            process_node(argument)
                                            nodes_code.append(f"        call prt_num            ; ({node.type}) print number")
                                            nodes_code.append ("")   
                      
                                # print single chars   
                                case"logchar":
                                    if node.arguments:
                                        for argument in node.arguments: # for every parameter in the call
                                            process_node(argument)
                                            nodes_code.append(f"        call prt_chr            ; ({node.type}) print char")
                                            nodes_code.append ("")      
                                
                                case _:
                                    print (f"{node.type}: {object_name}, {property_name} property not supported.")
                                
                        # Math object
                        elif object_name == "Math":
                            match property_name:
                                case "random":
                                    garbage_address=get_garbage_address(2)
                                    nodes_code.append(f"        call rnd_16b            ; ({node.type}) get 16-bit random number\n")
                                    nodes_code.append(f"        pop de                  ; ({node.type}) take result to garbage zone")            
                                    nodes_code.append(f"        ld hl, {garbage_address}            ;")
                                    nodes_code.append(f"        push hl                 ; >>> push rand address")
                                    nodes_code.append(f"        ld (hl), e              ; copy result to garbage zone")
                                    nodes_code.append(f"        inc hl                  ;")
                                    nodes_code.append(f"        ld (hl), d              ;")
                                    nodes_code.append(f"        push de                 ; >>> push rand value")
                                    
                                case _:
                                    print (f"{node.type}: {object_name}, {property_name} property not supported.")                         
                        
                        # special case: read keyboard
                        elif property_name== "addEventListener":
                            event_name= node.arguments[0].value
                            # key pressed event
                            if event_name== "keydown":
                                keypressed_event_name= event_name
                                keypressed_function= add_underscore_to_var(node.arguments[1].name)
                                # need to add a variable that  allows us to remove the listener
                                # pending: only to be done once during declarations
                                variable_declarations.append(f'{keypressed_event_name}_activation defw 1               ; ({node.type}) add/remove flag')
                                # add a read keyboard routine
                                nodes_code.append(f"        ld hl, {keypressed_event_name}_activation           ; ({node.type}) {event_name} activate feature")
                                nodes_code.append(f"        ld (hl), 1              ; A=0")
                                nodes_code.append(f"rea_key                         ; ({node.type}) read key from keyboard")
                                nodes_code.append(f"        ld hl, 0x5C08           ; LASTKEY system variable")
                                nodes_code.append(f"        xor a                   ; A=0")
                                nodes_code.append(f"        ld (hl), a              ; reset LASTKEY")
                                nodes_code.append(f"key_loo add a, (hl)             ; load latest value of LASTKEY.")
                                nodes_code.append(f"        jr z, key_loo           ; loop until a key is pressed")
                                nodes_code.append(f"        ld e, a                 ;")
                                nodes_code.append(f"        ld d, 0                 ;")
                                nodes_code.append(f"        push de                 ; push key address (dummy), unused")
                                nodes_code.append(f"        push de                 ; push key value")
                                nodes_code.append(f"        call {keypressed_function}          ; if key pressed")
                                nodes_code.append(f"        ld hl, {keypressed_event_name}_activation           ;")
                                nodes_code.append(f"        ld a, (hl)              ; get low byte")
                                nodes_code.append(f"        or a                    ; check activation bit")
                                nodes_code.append(f"        jr nz, rea_key          ; loop while eventListener is active")
                                nodes_code.append(f"        ret                     ;\n")

                        elif property_name== "removeEventListener":
                            event_name= node.arguments[0].value
                            if event_name== "keydown":
                                keypressed_event_name= event_name
                                keypressed_function= add_underscore_to_var(node.arguments[1].name)
                                nodes_code.append(f"        ld hl, {keypressed_event_name}_activation           ; ({node.type}) {event_name} deactivate feature")
                                nodes_code.append(f"        ld (hl), 0              ; A=0\n")
                                nodes_code.append("")
                            
                            
                            else:
                                print (f"{node.type}: {property_name}, {event_name} not supported.")
                        
                        elif property_name== "removeEventListener":
                            pass
                                  
                        # special case: canvas methods
                        elif (object_name in object_type_list):
                            if (object_type_list[object_name]=="canvas"):
                                match property_name:
                                    case "moveTo":
                                        for arg in node.arguments:
                                            process_node(arg)
                                            
                                        nodes_code.append(f"                                ; ({node.type}) {property_name}, plot a point")
                                        nodes_code.append(f"        pop bc                  ; get y-coord value")
                                        nodes_code.append(f"        pop hl                  ; get y-coord address, unused")           
                                        nodes_code.append(f"        pop de                  ; get x-coord value")
                                        nodes_code.append(f"        pop hl                  ; get x-coord address, unused")          
                                        
                                        # save value in canvas
                                        nodes_code.append(f"        ld hl, {object_name}_x              ; save values in canvas object")
                                        nodes_code.append(f"        ld (hl), e              ;")
                                        nodes_code.append(f"        ld hl, {object_name}_y              ;")
                                        nodes_code.append(f"        ld (hl), c              ;")
                                        
                                        nodes_code.append(f"        ld d, e                  ; DE has to contain (x,y)")
                                        nodes_code.append(f"        ld e, c                  ;")
                                        nodes_code.append(f"        call plo_poi            ; ({node.type}) call function {object_name}")
                                
                                    case "lineTo":
                                        for arg in node.arguments:
                                            process_node(arg)
                                        nodes_code.append(f"                                ; ({node.type}) {property_name}, draw a line")
                                        
                                        # 2) origin is in the object, to be loaded in DE
                                        nodes_code.append(f"        ld hl, {object_name}_x              ;")
                                        nodes_code.append(f"        ld d, (hl)              ;")
                                        nodes_code.append(f"        ld hl, {object_name}_y              ;")
                                        nodes_code.append(f"        ld e, (hl)              ;")
                                        
                                        # 2) target is in the stack, to be loaded in HL
                                        nodes_code.append(f"        pop bc                  ; get y-coord value")
                                        nodes_code.append(f"        pop hl                  ; get y-coord address, unused")
                                        # save new origin y in canvas
                                        nodes_code.append(f"        ld hl, {object_name}_y            ; save new y")
                                        nodes_code.append(f"        ld (hl), c              ;")
                                        nodes_code.append(f"        ld a, c                 ; save target y-coord, later use")

                                        nodes_code.append(f"        pop bc                  ; get x-coord value")
                                        nodes_code.append(f"        pop hl                  ; get x-coord address, unused")
                                        # save new origin x in canvas
                                        nodes_code.append(f"        ld hl, {object_name}_x            ; save new x")
                                        nodes_code.append(f"        ld (hl), c              ;")
                                        
                                        # prepare registers before call
                                        # from de = end1 (d = x-axis, e = y-axis)
                                        # to   hl = end2 (h = x-axis, l = y-axis)
                                        nodes_code.append(f"        ld h, c                  ; HL has to contain target (x,y)")
                                        nodes_code.append(f"        ld l, a                  ;")
                                        
                                        nodes_code.append(f"        call dra_lin            ; ({node.type}) call function {object_name}")
                                          
                                    case "clearRect":
                                        nodes_code.append(f"        call cle_scr            ; ({node.type}) {object_name} clear screen")
                                nodes_code.append ("")
                        
                        
                        # other regular calls
                        else:
                            if node.callee.name:
                                function_name=add_underscore_to_var(node.callee.name)
                                nodes_code.append(f"                                ; ({node.type}): {function_name}")
                                for arg in node.arguments:
                                    process_node(arg)
                                nodes_code.append(f"        call {function_name}            ; ({node.type}): call {function_name}")
                                nodes_code.append ("")

                
                if hasattr(node.callee.object, "name"):
                    # generic string methods
                    if node.callee.object.name== "String": # here is where methods for literals should arrive at
                        nodes_code.append(f"                                ; ({node.type}) String methods")
                        for argument in node.arguments:
                            process_node(argument)
                        process_node(node.callee)
                        

                if hasattr(node.callee.object, "type"):
                    # genric literal methods
                    if node.callee.object.type== "Literal": 
                        literal_type= type(node.callee.object.value).__name__     
                        match literal_type:
                            case "int": # pending: not supported
                                pass
                            case "str": # pending: not supported
                                pass   
                 
            #------------------------------------------------------------------    
            case "DoWhileStatement": # contains one or more variable declaration
                #print(node)
                do_while_label = new_label("dow_")
                do_while_end_label = new_label("dox_")
                
                # loop body
                if node.body:
                    nodes_code.append(f"{do_while_label}                         ; ({node.type}) 1. body")
                    process_node(node.body)

                # condition test
                if node.test:
                    nodes_code.append(f"                                ; ({node.type}) 2. test")
                    process_node(node.test)
                    nodes_code.append(f"        pop de                  ; ({node.type}) ")
                    nodes_code.append(f"        xor a                   ; A=0")
                    nodes_code.append(f"        cp e                    ; if E=0, condition not fulfiled")
                    nodes_code.append(f"        jp z, {do_while_end_label}           ;")


                nodes_code.append(f"        jp {do_while_label}              ;")                
                nodes_code.append(f"{do_while_end_label}                         ; ({node.type}) end of...")
                nodes_code.append("")
                
            #------------------------------------------------------------------
            case "ForStatement":
                #print(node)
                for_label = new_label("for_")
                exit_label = new_label("fex_")
                update_label = new_label("fup_")
                break_label = exit_label
                
                # initialization
                nodes_code.append(f"                                ; ({node.type}) 1. init --------------")
                process_node(node.init)
                #else:
                #    print(f"{node.type}, init: {init_name} not declared.")           

                # condition test
                if node.test:
                    nodes_code.append(f"{for_label}                         ; ({node.type}) 2. test --------------")
                    process_node(node.test)
                    nodes_code.append(f"        pop de                  ; ({node.type}) ")
                    nodes_code.append(f"        xor a                   ; A=0")
                    nodes_code.append(f"        cp e                    ; if E=0, condition not fulfilled")
                    nodes_code.append(f"        jp z, {exit_label}           ;")
                    
                # loop body
                if node.body:
                    nodes_code.append(f"                                ; ({node.type}) 3. body -------------")
                    process_node(node.body)
                    
                # condition update
                if node.update:
                    #nodes_code.append(f"{update_label}                         ; ({node.type}) 4. update ---------")
                    nodes_code.append(f"                                ; ({node.type}) 4. update ---------")
                    process_node(node.update)
                nodes_code.append(f"        jp {for_label}              ;")
                nodes_code.append(f"{exit_label}                         ; ({node.type}) end of...")
                nodes_code.append("")
                
            case "ContinueStatement":
                nodes_code.append(f"        jp {update_label}              ;  ({node.type})")  

            #------------------------------------------------------------------
            case "FunctionDeclaration": # Function Call, step 2: function tag, pop parameters
                #print (node)
                function_exit_tag=new_label("fex_")
                
                # 1) 'id' section 
                function_name = add_underscore_to_var(node.id.name)
                if function_name not in function_declarations:
                    function_declarations.append(function_name)
                    
                nodes_code.append(f"; ({node.type}) Function: {function_name}")
                nodes_code.append(f"{function_name}                        ; ({node.type}) *** {function_name} ***")

                # 2) return address
                nodes_code.append(f"                                ; save return address")
                nodes_code.append(f"        ld hl, sta_ck2          ; needed in case another function comes in")
                nodes_code.append(f"        ld e, (hl)              ; address pointed in DE")
                nodes_code.append(f"        inc hl                  ;")
                nodes_code.append(f"        ld d, (hl)              ;")
                nodes_code.append(f"        ex de, hl               ; de= sta_ck2, hl= stack pointer")
                
                nodes_code.append(f"        pop bc                  ; <<< pop return address")
                nodes_code.append(f"        ld (hl), c              ;")
                nodes_code.append(f"        inc hl                  ;")
                nodes_code.append(f"        ld (hl), b              ;")
                
                nodes_code.append(f"        ld hl, sta_ck2          ;")
                nodes_code.append(f"        inc (hl)                ;")
                nodes_code.append(f"        inc (hl)                ;\n")

                # 3) 'params' section
                nodes_code.append(f"                                ; ({node.type}) collect parameters\n")
                for param in reversed(node.params): # Handle parameters (if any) for the function
                    parameter_name = add_underscore_to_var(param.name)  # Add underscore to variable name
                    if parameter_name not in variable_type_list:
                        variable_type_list[parameter_name] = "int" # Pending: wrong assumption. all parameters are marked as integer
                        # variable declaration
                        variable_declarations.append(f'{parameter_name}   defw 0                ; ({node.type}) literal int/bool')
                        # assembly code: load variable with values in stack in reverse order
                        nodes_code.append(f"        ld hl, {parameter_name}            ;")
                        nodes_code.append(f"        pop de                  ; <<< pop *** {parameter_name} ***")
                        nodes_code.append(f"        pop bc                  ; <<< pop address, unused")
                        nodes_code.append(f"        ld (hl), e              ; store it in memory")
                        nodes_code.append(f"        inc hl                  ;")
                        nodes_code.append(f"        ld (hl), d              ;\n")

                    else:
                        print(f"{node.type}: duplicated {parameter_name}")
                                    
                # 4) 'body' section (actually, body.body)
                nodes_code.append(f"                                ; ({node.type}) function body\n")
                #for statement in node.body.body:
                        #process_node(statement)  # typically contains a 'return' that triggers a returnStatement
                process_node(node.body)
                
                # 5) return address
                nodes_code.append(f"                                ; recover return address")
                nodes_code.append(f"        ld hl, sta_ck2          ; update stack2 pointer")
                nodes_code.append(f"        ld e, (hl)              ; pick stack pointer")
                nodes_code.append(f"        inc hl                  ; update pointer")
                nodes_code.append(f"        ld d, (hl)              ; pick stack pointer")
                nodes_code.append(f"        ex de, hl               ; de= sta_ck2, hl= stack pointer")
                
                nodes_code.append(f"        dec hl                  ;")
                nodes_code.append(f"        ld b, (hl)              ; get return address from stack")
                nodes_code.append(f"        dec hl                  ;")
                nodes_code.append(f"        ld c, (hl)              ;")
                nodes_code.append(f"        push bc                 ; >>> push return address")
                
                nodes_code.append(f"        ld hl, sta_ck2          ;")
                nodes_code.append(f"        dec (hl)                ;")
                nodes_code.append(f"        dec (hl)                ;\n")                
                
                # 6) exit
                nodes_code.append(f"{function_exit_tag} ret                     ; ({node.type}) end of...\n")
                nodes_code.append(f"{function_end_tag}")
             
            #------------------------------------------------------------------             
                
            case "ReturnStatement": # Function Call, step 3: return values
                #print (node)
                nodes_code.append(f"                                ; ({node.type}) process return expression")
                if node.argument:
                    # Process the arguments of the return statement (expression to be returned)
                    process_node(node.argument)  # Evaluate the expression
                nodes_code.append("")
                # assembly code
                nodes_code.append(f"                                ; ({node.type}) restore return address")

                nodes_code.append(f"        ld hl, sta_ck2          ; update stack2 pointer")
                nodes_code.append(f"        ld e, (hl)              ; pick stack pointer")
                nodes_code.append(f"        inc hl                  ; update pointer")
                nodes_code.append(f"        ld d, (hl)              ; pick stack pointer")
                nodes_code.append(f"        ex de, hl               ; de= sta_ck2, hl= stack pointer")
                
                nodes_code.append(f"        dec hl                  ;")
                nodes_code.append(f"        ld b, (hl)              ; get return address from stack")
                nodes_code.append(f"        dec hl                  ;")
                nodes_code.append(f"        ld c, (hl)              ;")
                nodes_code.append(f"        push bc                 ; >>> push return address")
                
                nodes_code.append(f"        ld hl, sta_ck2          ;")
                nodes_code.append(f"        dec (hl)                ;")
                nodes_code.append(f"        dec (hl)                ;") 
                nodes_code.append(f"        ret                     ; return from function")
                nodes_code.append("")
                                
            #------------------------------------------------------------------
            case "IfStatement":
                #print (node)
                else_label = new_label("els_")
                end_label = new_label("ski_")
                break_label = new_label("bre_")
                # assembly code
                nodes_code.append(f"                                ; ({node.type}) ")
                process_node(node.test)
                nodes_code.append(f"        pop de                  ; ({node.type}) ")
                nodes_code.append(f"        xor a                   ; reset flags")
                nodes_code.append(f"        cp e                    ; if E=1, condition fulfiled")
                nodes_code.append(f"        jp z, {else_label}           ;\n")
                # if
                process_node(node.consequent)
                nodes_code.append(f"        jp {end_label}              ; ({node.type})")
                nodes_code.append(f"{else_label}                         ; else\n")
                # else
                if node.alternate:
                    process_node(node.alternate)
                nodes_code.append(f"{end_label}                         ; ({node.type}) end of...")
                nodes_code.append("")
            
            #------------------------------------------------------------------
            case "Literal":
                #print (node)
                literal_value = node.value
                # integer literal
                if isinstance(literal_value, int): # this works for both integer and boolean
                    garbage_address= get_garbage_address(2)
                    # assembly code
                    nodes_code.append(f"                                ; ({node.type}) *** {literal_value} ***")
                    nodes_code.append(f"        ld hl, {garbage_address}            ; get a garbage zone address")
                    nodes_code.append(f"        ld de, {literal_value}                ; set value")
                    nodes_code.append(f"        push hl                 ; >>> push garbage zone address")
                    nodes_code.append(f"        ld (hl), e              ; save value in garbage zone")
                    nodes_code.append(f"        inc hl                  ;")
                    nodes_code.append(f"        ld (hl), d              ;")
                    nodes_code.append(f"        push de                 ; >>> push value")     
                                                    
                # string literals
                if isinstance(node.value, str):
                    literal_length = len(literal_value)
                    literal_value= basic_ascii(literal_value) # remove exotic characters
                    literal_name = new_label("stn_")  # Generate a unique label
                    garbage_address = get_garbage_address(literal_length+2)
                    
                    # one-char literal becomes an integer...
                    if literal_length == 1:
                        ascii_value = ord(literal_value)  # Convert character to ASCII
                        nodes_code.append(f"                                ; ({node.type}) *** '{literal_value}' (ASCII {ascii_value}) ***")
                        nodes_code.append(f"        ld hl, {garbage_address}            ; get a garbage zone address")
                        nodes_code.append(f'        ld de, "{literal_value}"                ; collect ASCII value?')
                        nodes_code.append(f"        push hl                 ; >>> push garbage zone address")
                        nodes_code.append(f"        ld (hl), e              ; save value in garbage zone")
                        nodes_code.append(f"        inc hl                  ;")
                        nodes_code.append(f"        ld (hl), d              ;")
                        nodes_code.append(f"        push de                 ; >>> push value")  
                    
                    # there strings are declared as such
                    else:
                        # literal declaration
                        variable_declarations.append(f'{literal_name} defb {literal_length}, 0, "{literal_value}"        ; ({node.type}) string')
                        # assembly code
                        nodes_code.append(f"                                ; ({node.type}) *** '{literal_value}' ***")
                        nodes_code.append(f"        ld hl, {literal_name}          ; literal string address")
                        nodes_code.append(f"        ld de, {len(literal_name)}                ; dummy content value, unused")
                        nodes_code.append(f"        push hl                 ; >>> push literal address")
                        nodes_code.append(f"        push de                 ; >>> push dummy content")  
                        
                    
   
                nodes_code.append("")

            case "Identifier":
                variable_name= add_underscore_to_var(node.name)
                # assembly code
                nodes_code.append(f"                                ; ({node.type}) *** {variable_name} ***")
                nodes_code.append(f"        ld hl, {variable_name}            ; variable address")
                nodes_code.append(f"        push hl                 ; >>>")
                nodes_code.append(f"        ld hl, ({variable_name})          ; variable content")
                nodes_code.append(f"        push hl                 ; >>>")
                
                nodes_code.append("")
                
            #------------------------------------------------------------------ 
            case "MemberExpression":
                #print (node); print (f" Member expression:"); print (f" variable list: {variable_type_list}"); print (f" string list: {string_type_list}")
                #print (f" array list: {array_type_list}"); print (f" object list: {object_type_list}"); print (f" matrix list: {matrix_type_list}")
                
                # 2D matrices 
                if node.object.object and node.object.object.name: 
                    matrix_name=add_underscore_to_var(node.object.object.name)
                    if matrix_type_list.get(matrix_name) or array_type_list.get(matrix_name) :  
                        nodes_code.append(f"                                ; ({node.type}) matrix name")
                        nodes_code.append(f"        ld hl, {matrix_name}            ; variable address")
                        nodes_code.append(f"        push hl                 ; >>>")
                        nodes_code.append(f"        ld hl, ({matrix_name})          ; variable content")
                        nodes_code.append(f"        push hl                 ; >>>\n")
                        
                        nodes_code.append(f"                                ; ({node.type}) matrix column")
                        process_node(node.object.property)
                        nodes_code.append(f"                                ; ({node.type}) matrix row")
                        process_node(node.property)
                        
                        nodes_code.append(f"                                ; ({node.type}) matrix access")                 
                        nodes_code.append(f"        pop ix                  ; <<< pop column content")
                        nodes_code.append(f"        pop de                  ; <<< pop column address, unused")
                        nodes_code.append(f"        pop de                  ; <<< pop row content")
                        nodes_code.append(f"        pop bc                  ; <<< pop row address, unused")
                        nodes_code.append(f"        pop bc                  ; <<< pop matrix size (cols, rows)")
                        # record address: matrix@ + 2 * ((row# * row_size) + column#) + 2 <- matrix header
                        nodes_code.append(f"        ld b, 0                 ; leave rows only")
                        nodes_code.append(f"        push ix                 ; >>> push row size")
                        nodes_code.append(f"        push bc                 ; >>> push row size")
                        nodes_code.append(f"        push de                 ; >>> push row number")
                        nodes_code.append(f"        call mul_16b            ;")
                        nodes_code.append(f"        pop hl                  ; <<< pop row index") # HL= (row# * row_size)
                        nodes_code.append(f"        pop de                  ; <<< pop column content")
                        nodes_code.append(f"        add hl, de              ; record position") # HL= (row# * row_size) + column#
                        nodes_code.append(f"        add hl, hl              ; record position") # HL= 2 * ((row# * row_size) + column#)
                        nodes_code.append(f"        ld de, 2                ; header size")
                        nodes_code.append(f"        add hl, de              ; record position + header") # HL= 2 * ((row# * row_size) + column#) + 2
                        nodes_code.append(f"        pop de                  ; <<< pop matrix address")
                        nodes_code.append(f"        add hl, de              ; exact position!") # matrix@ + 2 * ((row# * row_size) + column#) + 2
                        
                        nodes_code.append(f"        push hl                 ; >>> push address")
                        nodes_code.append(f"        ld e, (hl)              ; position content!")
                        nodes_code.append(f"        inc hl                  ;")
                        nodes_code.append(f"        ld d, (hl)              ;")
                        nodes_code.append(f"        push de                 ; >>> push value\n") 
                
                # object, dictionary        
                elif node.object.name:
                    object_name=add_underscore_to_var(node.object.name)
                    if object_type_list.get(object_name):
                        process_node(node.object)
                        process_node(node.property)
                        dict_label= new_label("dic_")
                        dict_found_label= new_label("dfo_")
                        dict_exit_label= new_label("dex_")
                        
                        #assembly 
                        nodes_code.append(f"                                ; ({node.type}) dictionary access")                 
                        nodes_code.append(f"        pop hl                  ; <<< pop value to search")
                        nodes_code.append(f"        pop de                  ; <<< pop value address, unused")
                        nodes_code.append(f"        pop de                  ; <<< pop dictionary size")
                        nodes_code.append(f"        ld b, e                 ; count through the dictionary, DE is free")
                        nodes_code.append(f"        pop ix                  ; <<< pop dictionary address\n")
                        
                        # loop through the dictionary
                        nodes_code.append(f"{dict_label} inc ix                  ; skip size")         
                        nodes_code.append(f"        inc ix                  ;")
                        nodes_code.append(f"        ld e, (ix+0)            ; read key, byte 1, from dictionary")
                        nodes_code.append(f"        ld d, (ix+1)            ; read key, byte 2")
                        nodes_code.append(f"        inc ix                  ; skip key, byte 2")
                        nodes_code.append(f"        inc ix                  ; skip value")             
                        nodes_code.append(f"        xor a                   ;")
                        nodes_code.append(f"        push hl                 ; >>> value to search")
                        nodes_code.append(f"        sbc hl, de              ; compare search value with key")
                        nodes_code.append(f"        pop hl                  ; <<< pop value to search")
                        nodes_code.append(f"        jr z, {dict_found_label}           ;")
                        nodes_code.append(f"        djnz {dict_label}            ;\n")
                        
                        nodes_code.append(f"        ld de, 0                ; if not found, value= 0")
                        nodes_code.append(f"        ld bc, 0                ; if not found, address= 0")
                        nodes_code.append(f"        push bc                 ; >>> push value address")
                        nodes_code.append(f"        push de                 ; >>> push value")
                        nodes_code.append(f"        jr {dict_exit_label}              ; skip match\n")
                        
                        # return result, if any
                        nodes_code.append(f"{dict_found_label} ld e, (ix+0)            ; read value, byte 1, from dictionary")
                        nodes_code.append(f"        ld d, (ix+1)            ; read value, byte 2")
                        nodes_code.append(f"        push ix                 ; >>> push value address")
                        nodes_code.append(f"        push de                 ; >>> push value ")

                        nodes_code.append(f"{dict_exit_label}                         ; ({node.type}) exit dictionary access\n")
                        
                    if array_type_list.get(object_name):
                        array_name=object_name
                        process_node(node.object)
                        process_node(node.property)
                        
                        nodes_code.append(f"                                ; ({node.type}) array access")                 
                        nodes_code.append(f"        pop hl                  ; <<< pop record index")
                        nodes_code.append(f"        pop de                  ; <<< pop record index address, unused")
                        nodes_code.append(f"        pop de                  ; <<< pop array content, unused")
                        nodes_code.append(f"        pop de                  ; <<< pop array address")

                        # record address: array@ + 2 * (record# + 1)
                        nodes_code.append(f"        inc hl                  ;") # HL= (record# + 1)
                        nodes_code.append(f"        add hl, hl              ; record position") # HL= 2 * (record# + 1)
                        nodes_code.append(f"        add hl, de              ; array address + record position") # HL= 2 * ((row# * row_size) + column#) + 2
                        
                        nodes_code.append(f"        push hl                 ; >>> push address")
                        nodes_code.append(f"        ld e, (hl)              ; position content!")
                        nodes_code.append(f"        inc hl                  ;")
                        nodes_code.append(f"        ld d, (hl)              ;")
                        nodes_code.append(f"        push de                 ; >>> push content\n") 

                # string methods
                if node.object.name:
                    variable_name= add_underscore_to_var(node.object.name)
                    property_name= node.property.name
                    property_type= node.property.type
                    if variable_name == "String_": # generic String methods
                        if property_name == "fromCharCode":
                            # pending: only one character supported
                            garbage_address=get_garbage_address(4)
                            nodes_code.append(f"                                ; ({node.type}) Ascii to Char")
                            nodes_code.append(f"        pop de                  ; <<< pop char value")
                            nodes_code.append(f"        pop bc                  ; <<< pop char address")
                            nodes_code.append(f"        ld hl, {garbage_address}            ; save value in garbage zone")
                            nodes_code.append(f"        push hl                 ; >>> push address")
                            nodes_code.append(f"        ld (hl), 1              ; string length")
                            nodes_code.append(f"        inc hl                  ;")
                            nodes_code.append(f"        ld (hl), 0              ; string length")
                            nodes_code.append(f"        ld bc, 1                ; string length")
                            nodes_code.append(f"        push bc                 ; >>> push address")
                            nodes_code.append(f"        inc hl                  ;")
                            nodes_code.append(f"        ld (hl), e              ; string value")
                            nodes_code.append(f"        inc hl                  ;")
                            nodes_code.append(f"        ld (hl), d              ;\n")
                    
                    if variable_name in string_type_list:
                        # string length
                        # pending: i don´t like how it's done. no stack consumption
                        if property_name == "length":
                            nodes_code.append(f"                                ; ({node.type}) string length")
                            nodes_code.append(f"        ld hl, {variable_name}            ; variable address")
                            nodes_code.append(f"        push hl                 ; >>> push string address")
                            nodes_code.append(f"        ld e, (hl)              ; get length")
                            nodes_code.append(f"        inc hl                  ;")
                            nodes_code.append(f"        ld d, (hl)              ; variable content")
                            nodes_code.append(f"        push de                 ; >>> push length\n")
                    
                        # string character
                        elif property_type== "Literal":
                            print(f"{node.type}: character in string not supported.")
                            # process children
                            #process_node(node.object)
                            #process_node(node.property)
                
                            
            #------------------------------------------------------------------ 
            case "ObjectExpression":
                pass                
                       
            #------------------------------------------------------------------ 
            case "SwitchStatement":
                print (node)
                break_label = new_label("bre_")
                discriminant_name=add_underscore_to_var(node.discriminant.name)
                
                if discriminant_name in variable_type_list:
                    nodes_code.append(f"                                ; ({node.type})")
                 
                    # cases
                    for switchcase in node.cases:
                        process_node(switchcase)
                    
                    nodes_code.append(f"{break_label}                         ; ({node.type})\n")    
                    nodes_code.append("")
                
                else:
                    print(f"{node.type}: {discriminant_name} not in variable list.")
                    
            case "SwitchCase":
                #print (node)

                switch_label = new_label("swi_")
                nodes_code.append(f"                                ; ({node.type})")
                # test, contains the value to be tested
                process_node(node.test)
                
                # assembly code
                nodes_code.append(f"        pop hl                  ; <<< pop left side value\n")
                nodes_code.append(f"        xor a                   ;")
                nodes_code.append(f"        sbc hl, bc              ;")
                nodes_code.append(f"        jp nz, {switch_label}          ; if =, skip")
                
                # consequent
                for conseq in node.consequent:
                        process_node(conseq)
                
                nodes_code.append(f"{switch_label}                         ; ({node.type})")
                nodes_code.append("")
                
            case "BreakStatement":
                #print (node)
                nodes_code.append(f"        jp {break_label}              ; ({node.type})")
                nodes_code.append("")
            
            #-------------------------------------------------------------------
            case "UnaryExpression":
                
                nodes_code.append(f"                                ; ({node.type}) *** {node.operator} ***")
                match node.operator:
                    case "~":
                        # evaluate expression
                        process_node(node.argument)
                        # apply not
                        garbage_address=get_garbage_address(2)
                        nodes_code.append(f"        pop de                  ; pop value")
                        nodes_code.append(f"        pop hl                  ; pop address, unused")
                        nodes_code.append(f"        ld a, e                 ;")
                        nodes_code.append(f"        cpl                     ; negate low byte")
                        nodes_code.append(f"        ld e, a                 ;")
                        nodes_code.append(f"        ld a, d                 ;")
                        nodes_code.append(f"        cpl                     ; negate high byte")
                        nodes_code.append(f"        ld d, a                 ;")
                        nodes_code.append(f"                                ;")
                                              
                        nodes_code.append(f"        ld hl, {garbage_address}            ; result to garbage zone")
                        nodes_code.append(f"        push hl                 ;")
                        nodes_code.append(f"        ld (hl), e              ;")
                        nodes_code.append(f"        inc hl                  ;")
                        nodes_code.append(f"        ld (hl), d              ;\n")
                        nodes_code.append(f"        push de                 ;")
                    
                    case "-":
                        # evaluate expression
                        process_node(node.argument)
                        # apply not
                        garbage_address=get_garbage_address(2)
                        nodes_code.append(f"        pop de                  ; pop value")
                        nodes_code.append(f"        pop hl                  ; pop address, unused")
                        nodes_code.append(f"        xor a                   ;")
                        nodes_code.append(f"        ld hl, 0               ;")
                        nodes_code.append(f"        sbc hl, de              ; HL = -BC")
                        nodes_code.append(f"        ex de, hl               ; DE = HL")
                        
                        nodes_code.append(f"        ld hl, {garbage_address}            ; result to garbage zone")
                        nodes_code.append(f"        push hl                 ;")
                        nodes_code.append(f"        ld (hl), e              ;")
                        nodes_code.append(f"        inc hl                  ;")
                        nodes_code.append(f"        ld (hl), d              ;\n")
                        nodes_code.append(f"        push de                 ;")
                                                
            #-------------------------------------------------------------------
            case "UpdateExpression":
                process_node(node.argument)
                nodes_code.append(f"                                ; ({node.type}) *** {node.operator} ***")
                nodes_code.append(f"        pop hl                  ; <<< pop left side value, not used")
                nodes_code.append(f"        pop hl                  ; <<< pop left side address")
    
                
                match node.operator:
                    case "++":  # Handle increment (++) operator
                        nodes_code.append(f"        inc (hl)                ; ({node.type}) increment")
                        
                    case "--":  # Handle decrement (--) operator
                        nodes_code.append(f"        dec (hl)                ; ({node.type}) decrement")
                        
                    case _:
                        print(f"{node.type}: Unsupported operator: {node.operator}")
                
                nodes_code.append("")
            #------------------------------------------------------------------ 
            case "VariableDeclaration": # contains one or more variable declaration
                #print(node)
                for declaration in node.declarations:
                    variable_kind=node.kind
                    process_node(declaration)

            case "VariableDeclarator": # deals with all variable and constant declarations
                #print(node)
                variable_name= add_underscore_to_var(node.id.name)
                if hasattr(node.init, "value"): # value is literal
                    variable_value= node.init.value
                else: # pending: declaration value is not literal
                    print(f"{node.type}: non-literal declarations not supported.")
                
                # constants
                if variable_kind== "const":
                    variable_type_list[variable_name]= "int" # not a variable, but for this type it works
                    variable_declarations.append(f"        {variable_name} equ {variable_value}             ;")
                
                # all other types
                else:
                # integers --------------------------------------------------------
                    if isinstance(variable_value, int):
                        # variable creation
                        if variable_name not in variable_type_list:
                            variable_type_list[variable_name]= "int"
                            
                            # assembly code
                            variable_declarations.append(f'{variable_name}   defw {int(variable_value)}                 ; ({node.type}) variable int/bool')
                        else:
                            print(f"{node.type}: {variable_name} already declared.")
                    
                # strings ---------------------------------------------------------                        
                    elif isinstance(variable_value, str):
                        if variable_name not in variable_type_list:
                            string_type_list[variable_name]= "str"
                            # replace exotic characters    
                            variable_value= basic_ascii(variable_value)
                            
                            # one-char string becomes an integer
                            if len(variable_value)==1:
                                variable_declarations.append(f'{variable_name}   defw "{variable_value}"          ; ({node.type}) variable string')
                            
                            # other strings    
                            else:
                                # assembly code
                                #filler_size= string_max_length - len(variable_value) -1 # reserve 1 byte for the length
                                variable_declarations.append(f'{variable_name}   defb {len(variable_value)}, 0, "{variable_value}"          ; ({node.type}) variable string')
                                #variable_declarations.append(f'        defs {filler_size}, 0xff             ;')
                                
                        else:
                            print(f"{node.type}: {variable_name} already declared.")
                    
                    
                    else:
                        if hasattr(node.init, 'type'):
                            
                # arrays/matrices -------------------------------------------------
                            if node.init.type == "ArrayExpression":
                                matrix_name = add_underscore_to_var(node.id.name)  # Extract variable name
                                matrix_rows = len(node.init.elements)  # Number of rows
                                
                                # pending: check matrix duplicity                        
                            
                                # Check if all elements are ArrayExpression (to confirm it's a 2D matrix)
                                is_2d = all(e.type == "ArrayExpression" for e in node.init.elements)
                            
                                if is_2d:
                                    # in not a constant, add it to variable list
                                    #if variable_kind != "const":
                                    matrix_type_list[variable_name]= "int" # pending: all matrices and arrays are treated as integers.
                                        
                                    # Get the max column count across all rows
                                    matrix_cols = max(len(e.elements) for e in node.init.elements) if matrix_rows > 0 else 0
                                    
                                else: # arrays
                                    # in not a constant, add it to variable list
                                    #if variable_kind != "const":
                                    array_type_list[variable_name]= "int" # pending: all matrices and arrays are treated as integers.
                                    # It's a 1D array
                                    matrix_cols = matrix_rows
                                    matrix_rows = 1
    
                                variable_declarations.append(f"{matrix_name}   defb {matrix_cols}, {matrix_rows}              ; ({node.type}) matrix (cols, rows)")
    
                                process_node(node.init) # creates the matrix elements
                                
                            # object calls
                            if node.init.type == "CallExpression":
                                if node.init.callee.name:
                                    callee_type_name=node.init.callee.name
                                    
                # non-standard: empty string (str=String(5))----------
                                    if callee_type_name == "String":  
                                        string_name= add_underscore_to_var(node.id.name)
                                        string_chars= node.init.arguments[0].value
                                        # save string in strings list
                                        string_type_list[string_name]= "str"
                                        variable_declarations.append(f"{string_name}   defb {string_chars}, 0                    ; ({node.type}) empty string")
                                        variable_declarations.append(f"        defs {string_chars}, 0x88                    ; ({node.type})")

                                    
                # non-standard: empty array and matrices (mat=Array(3,3))----------
                                    if callee_type_name == "Array":  
                                        matrix_name= add_underscore_to_var(node.id.name)
                                        # pending: check matrix duplicity
                                        match len(node.init.arguments):
                                            case 1: # 1 dimension array
                                                matrix_rows = 1
                                                matrix_cols = node.init.arguments[0].value
                                                array_type_list[matrix_name]= "int" # pending: all matrices and arrays are treated as integers.
                                            case 2: # 2D matrix
                                                matrix_rows= node.init.arguments[0].value
                                                matrix_cols = node.init.arguments[1].value
                                                matrix_type_list[matrix_name]= "int" # pending: all matrices and arrays are treated as integers.
                                            case _: # higher dimensions
                                                print(f"{node.type}: {matrix_name}, number of dimensions not supported.")
                                        
                                        variable_declarations.append(f"{matrix_name}   defb {matrix_cols}, {matrix_rows}              ; ({node.type}) empty matrix (cols, rows)")
                                        for i in range(matrix_rows):
                                            # Create a string with 'defw' followed by '0' repeated matrix_cols times, separated by commas
                                            row_values = ', '.join(['0'] * matrix_cols)
                                            variable_declarations.append(f"        defw {row_values} ;")
                                    
                # non-standard: empty dictionaries creation (dict=Map(5,2))--------      
                                    if callee_type_name == "Map": 
                                        map_name= add_underscore_to_var(node.id.name)
                                        map_rows= node.init.arguments[0].value
                                        map_cols= node.init.arguments[1].value
                                        
                                        variable_type_list[map_name]= "int" # pending: all matrices and arrays are treated as integers.
                                        variable_type_list[map_name]= "int"
                                        
                                        variable_declarations.append(f"{map_name}   defb {map_cols}, {map_rows}              ; ({node.type}) map (key+values, rows)")
                                        for i in range(map_rows):
                                            # Create a string with 'defw' followed by '0' repeated matrix_cols times, separated by commas
                                            row_values = ', '.join(['0'] * map_cols)
                                            variable_declarations.append(f"        defw {row_values} ;")
    
                # general object methods ------------------------------------------
                                elif node.init.callee.object.name:
                # non-standard: used for canvas creation --------------------------                             
                                        two_d_property=node.init.arguments[0].value
                                        if two_d_property == "2d": 
                                            #variable_name=add_underscore_to_var(node.id.name) # pending: make sure "ctx" is "ctx_"
                                            variable_name=node.id.name
                                            object_type_list[variable_name]="canvas"
                                            #variable declaration
                                            variable_declarations.append(f"{variable_name}           defw 0         ; ({node.type}) canvas")
                                            variable_declarations.append(f"{variable_name}_x         defw 128       ;")
                                            variable_declarations.append(f"{variable_name}_y         defw 96        ;")
                                            
                # dictionaries ----------------------------------------------------
                            if node.init.type == "ObjectExpression": # so far, only used for dictionaries
                                dictionary_name=add_underscore_to_var(node.id.name)
                                dictionary_items=len(node.init.properties)
                                object_type_list[dictionary_name]= "int"
                                
                                variable_declarations.append(f"{dictionary_name}   defw {dictionary_items}                  ; ({node.type}) dictionary")
                                # declare dictionary elements
                                for propert in node.init.properties:
                                    value_content_type= type(propert.value.value).__name__
                                    dictionary_key=propert.key.value
                                    dictionary_value=propert.value.value
                                    match value_content_type:
                                        case "int":
                                            variable_declarations.append(f"        defw {dictionary_key}, {dictionary_value}              ;")  
                                        case "str":
                                            if len(dictionary_value) ==1: # it's a char
                                                variable_declarations.append(f'        defw {dictionary_key}, "{dictionary_value}"              ;')  
                                            else: # pending: string value
                                                pass
    
            # matrix declaration, part 2 --------------------------------------
            case "ArrayExpression": 
                #print (node)
                declarations_line=("        defw ")
          
                for element in node.elements: #
                    node_type=element.type
                    
                    match node_type:
                        case "Literal": # if it's a literal we declare it
                            node_value=element.value
                            declarations_line+=(f"{node_value}, ") # add one record to the declaration line
                            
                        case "ArrayExpression": # this is another dimension in the matrix, so recursion is needed
                            process_node(element)
                            
                        case "Identifier":
                            node_name=add_underscore_to_var(element.name)
                            declarations_line+=(f"{node_name}, ") # add one record to the declaration line
                            
                if node_type=="Literal" or node_type=="Identifier":
                    declarations_line=declarations_line[:-2]+ " ;" # full line, last comma removed
                    variable_declarations.append(declarations_line)
                                  
            #------------------------------------------------------------------    
            case "WhileStatement": # contains one or more variable declaration
                #print(node)
                while_label = new_label("whi_")
                while_end_label = new_label("whx_")
                
                # condition test
                if node.test:
                    nodes_code.append(f"{while_label}                         ; ({node.type}) 1. test")
                    process_node(node.test)
                    nodes_code.append(f"        pop af                  ; ({node.type}) condition")
                    nodes_code.append(f"        or a                    ; if 0, z=1")
                    nodes_code.append(f"        jp z, {while_end_label}           ; exit loop\n")
                    
                # loop body
                if node.body:
                    nodes_code.append(f"                                ; ({node.type}) 2. body")
                    process_node(node.body)

                nodes_code.append(f"        jp {while_label}              ;")                
                nodes_code.append(f"{while_end_label}                         ; end loop")
                nodes_code.append("") # why???
            
            #------------------------------------------------------------------
            case _: # other node types
                pass

    nodes_code.append(function_end_tag) # added to the top of the code, in case no function is used
    nodes_code.append("")
    
    # process each top-level statement in the AST
    for statement in ast.body:
        process_node(statement)
    
    return (nodes_code, variable_declarations, include_filenames_list)


