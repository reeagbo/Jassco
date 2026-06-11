from config import (
    nodes_code,
    label_count,
    include_filenames_list,
    function_declarations, variable_declarations,
    function_end_tag, function_exit_tag,
    break_label_stack, update_label, update_label_stack,
    matrix_type_list, object_type_list, variable_type_list, array_type_list, string_type_list, constant_type_list,
    constant_value_list,
    string_max_length
)
from utils import *
import esprima

def resolve_static_value(node):
    node_type = getattr(node, "type", None)

    if node_type == "Literal":
        return getattr(node, "value", None)

    if node_type == "Identifier":
        variable_name = add_underscore_to_var(getattr(node, "name", ""))
        return constant_value_list.get(variable_name)

    if node_type == "UnaryExpression":
        operator = getattr(node, "operator", None)
        argument_value = resolve_static_value(getattr(node, "argument", None))
        if isinstance(argument_value, int):
            if operator == "-":
                return -argument_value
            if operator == "+":
                return argument_value

    return None

def first_array_static_value(elements):
    for element in elements:
        if getattr(element, "type", None) == "ArrayExpression":
            nested_value = first_array_static_value(getattr(element, "elements", []))
            if nested_value is not None:
                return nested_value
        else:
            value = resolve_static_value(element)
            if value is not None:
                return value
    return None

def translate_to_assembly(js_code):
    #--------------------------------------------------------------------------         
    # Parse JavaScript using esprima
    ast = esprima.parseScript(js_code)

    def process_node(node):
        global garbage_address, discriminant_name, array_name, variable_declarations, \
            function_end_tag, function_exit_tag, \
            matrix_type_list, object_type_list, variable_type_list, array_type_list, string_type_list, constant_type_list, \
            constant_value_list, \
            variable_kind, \
            exit_label, break_label, update_label, break_label_stack, update_label_stack
        
        #print (node)
        
        match node.type:          
            #------------------------------------------------------------------
            case "AssignmentExpression":
                #print (f"({node.type}) Node:\n {node}")
                
                #print (f" variable list: {variable_type_list}")
                #print (f" array list: {array_type_list}")
                #print (f" object list: {object_type_list}")
                #print (f" matrix list: {matrix_type_list}")
                #print (f" string list: {string_type_list}")
                
                operator_name= node.operator
                left_node = node.left
                left_object = getattr(left_node, "object", None)
                left_nested_object = getattr(left_object, "object", None)
                
                # figure out variable name and check declaration
                variable_name="" # numerical variables
                array_name="" # arrays
                matrix_name="" # 2D matrices
                object_name="" # dictionaries
                
                # find the structure type and its name
                if getattr(left_node, "name", None) != None: # literals and variables
                    variable_name= add_underscore_to_var(left_node.name)
                elif getattr(left_object, "name", None) != None: # arrays or dictionaries have the same structure
                    object_name= add_underscore_to_var(left_object.name)
                if left_nested_object and getattr(left_nested_object, "name", None) != None: # matrices
                    matrix_name= add_underscore_to_var(left_nested_object.name)
                
                # if the variable has been declared, proceed to establish content type
                content_type="int" # pending: default to integer. rough take
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
                if variable_name in constant_type_list:
                    report_error(f"({node.type}) Constants cannot be altered.")
                
                #print (f"({node.type}) AssignmentExpression: {variable_name}{object_name}: {content_type}")       
                
                # integers ----------------------------------------------------
                if variable_name in variable_type_list: 
                    if content_type == "int":
                        # process variable
                        process_node(node.left)
                        # process value
                        process_node(node.right)
                        
                        # read right node (DE= address, HL= value)
                        nodes_code.append(f"                                ; ({node.type}) * {operator_name} * (int)")
                        nodes_code.append(f"        pop bc                  ; <<< pop right side value")
                        nodes_code.append(f"        pop de                  ; <<< pop right side address")
                        nodes_code.append(f"        pop hl                  ; <<< pop left side value\n")
    
                        # read left node and run operation
                        match operator_name:
                            case "=":
                                nodes_code.append(f"        push bc                 ; >>> push right side value")
                                nodes_code.append(f"        pop de                  ; <<< pop right side value")
                    
                            case "+=":
                                nodes_code.append(f"        add hl, bc              ; HL has the result")
                                nodes_code.append(f"        ex de, hl               ; DE has the result")
                                                                    
                            case "-=":
                                nodes_code.append(f"        xor a                   ; clear carry before subtraction")
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
                                nodes_code.append(f"        ld a, h                 ; MSB")
                                nodes_code.append(f"        and b                   ;")
                                nodes_code.append(f"        ld d, a                 ;")
                                nodes_code.append(f"        ld a, l                 ; LSB")
                                nodes_code.append(f"        and c                   ;")
                                nodes_code.append(f"        ld e, a                 ; DE has the result")
                                
                            case "|=":
                                nodes_code.append(f"        ld a, h                 ; MSB")
                                nodes_code.append(f"        or b                   ;")
                                nodes_code.append(f"        ld d, a                 ;")
                                nodes_code.append(f"        ld a, l                 ; LSB")
                                nodes_code.append(f"        or c                   ;")
                                nodes_code.append(f"        ld e, a                 ; DE has the result")
                            
                            case "^=":
                                nodes_code.append(f"        ld a, h                 ; MSB")
                                nodes_code.append(f"        xor b                   ;")
                                nodes_code.append(f"        ld d, a                 ;")
                                nodes_code.append(f"        ld a, l                 ; LSB")
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
                                report_error(f"{node.type}: {operator_name} operation not supported for integers.")
                        
                        nodes_code.append(f"\n        pop hl                  ; <<< pop left side address")
                        nodes_code.append(f"        ld (hl), e              ; write value in destination address")
                        nodes_code.append(f"        inc hl                  ;")
                        nodes_code.append(f"        ld (hl), d              ;")
                        
                        nodes_code.append(f"                                ; ({node.type}) end of...")
                
                # strings -----------------------------------------------------
                if variable_name in string_type_list:                             
                    if content_type == "str":
                        # process variable
                        process_node(node.left)
                        # process value
                        process_node(node.right)
                        
                        nodes_code.append(f"                                ; ({node.type}) * {operator_name} * assign string")
                        match operator_name:
                            case "=":
                                # assign string address to variable
                                nodes_code.append(f"        pop de                  ; pop right string address")
                                nodes_code.append(f"        pop hl                  ; pop right string value, unused")
                                nodes_code.append(f"        pop hl                  ; pop left variable value, unused")
                                nodes_code.append(f"        pop hl                  ; pop left variable address")
                                
                                # point left variable string at right immutable string                                
                                nodes_code.append(f"        ld (hl), e              ; copy immutable address string LSB")
                                nodes_code.append(f"        inc hl                  ;")
                                nodes_code.append(f"        ld (hl), d              ; copy immutable address string MSB")
                                
                            case _:
                                report_error(f"{node.type}: {variable_name}, operation not supported for strings.")
                
                # arrays-------------------------------------------------------
                if (object_name in array_type_list or object_name in matrix_type_list
                        or matrix_name in matrix_type_list
                        or variable_name in array_type_list or variable_name in matrix_type_list): 
                    if content_type == "int":
                        right_elements = getattr(node.right, "elements", None)
                        if right_elements: # array = [x, y] assignment
                            nodes_code.append(f"                                ; ({node.type}) * {operator_name} * array to array assignment")
                            nodes_code.append(f"        ld hl, {variable_name}          ; destination address")
                            nodes_code.append(f"        inc hl                  ; skip dimensions")
                            nodes_code.append(f"        inc hl                  ; 2 bytes\n")

                            for element in right_elements:
                                process_node(element)

                        if getattr(node.left, "type", None)=="MemberExpression": # array [x] = y assignment type
                            nodes_code.append(f"                                ; ({node.type}) * {operator_name} * value to array assignment")
                            # get value
                            process_node(node.right)
                            # calculate array position
                            process_node(node.left)
                            # assign value to position
                            nodes_code.append(f"        pop bc                  ; <<< pop right array value, unused")
                            nodes_code.append(f"        pop hl                  ; <<< pop right array address")
                            nodes_code.append(f"        pop de                  ; <<< pop right array value")
                            nodes_code.append(f"        pop bc                  ; <<< pop right array address, unused")
                            
                            nodes_code.append(f"        ld (hl), e              ; write LSB")
                            nodes_code.append(f"        inc hl                  ; next")
                            nodes_code.append(f"        ld (hl), d              ; write MSB")
                            nodes_code.append(f"        inc hl                  ; next\n")
                                                                                
                nodes_code.append ("")
                
                if content_type =="":
                    report_error(f"{node.type}: {variable_name} not declared as a variable.")
                                
            case "BlockStatement":
                for statement in node.body:
                    process_node(statement)

            case "ExpressionStatement":
                process_node(node.expression)
                
            #------------------------------------------------------------------            
            case "BinaryExpression":
                #print (f"({node.type}) Node:\n {node}")
                #print (f"Binary expression:")
                #print (f"variable list: {variable_type_list}")
                #print (f"string list:   {string_type_list}")
                #print (f"array list:    {array_type_list}")
                #print (f"object list:   {object_type_list}")
                #print (f"matrix list:   {matrix_type_list}")
                
                operator_name= node.operator
                # find out the variable type
                # plain variables
                left_name = getattr(node.left, "name", None)
                right_name = getattr(node.right, "name", None)
                if left_name: 
                    parameter_left_name= add_underscore_to_var(left_name)
                    if parameter_left_name in variable_type_list:
                        value_type= variable_type_list[parameter_left_name]
                    elif parameter_left_name in string_type_list:
                        value_type= string_type_list[parameter_left_name]
                    elif parameter_left_name in constant_type_list:
                        value_type= constant_type_list[parameter_left_name]
                    else:
                        value_type= "int"
                elif right_name:
                    parameter_right_name= add_underscore_to_var(right_name)
                    if parameter_right_name in variable_type_list:
                        value_type= variable_type_list[parameter_right_name]
                    elif parameter_right_name in string_type_list:
                        value_type= string_type_list[parameter_right_name]
                    elif parameter_right_name in constant_type_list:
                        value_type= constant_type_list[parameter_right_name]
                    else:
                        value_type= "int"
                # literals
                elif node.left.type == "Literal":
                    value_type= type(getattr(node.left, "value", None)).__name__
                    if value_type == "bool":
                        value_type = "int"
                # unaries
                elif node.left.type == "UnaryExpression":
                    unary_argument = getattr(node.left, "argument", None)
                    value_type= type(getattr(unary_argument, "value", None)).__name__
                    if value_type == "bool":
                        value_type = "int"
                # arrays
                elif node.left.type == "MemberExpression":
                    left_object = getattr(node.left, "object", None)
                    left_object_name = getattr(left_object, "name", None)
                    if left_object_name:
                        node_object_name=add_underscore_to_var(left_object_name)
                        if node_object_name in array_type_list:
                            value_type= array_type_list[node_object_name]
                        elif node_object_name in string_type_list:
                            value_type= string_type_list[node_object_name]
                        elif node_object_name in variable_type_list:
                            value_type= variable_type_list[node_object_name]
                    else:
                        value_type= "int"
                else:
                    value_type= "int" # pending...default to this is not correct and rarely happens.
                                    
                process_node(node.left)  # Process left operand
                process_node(node.right)  # Process right operand
                                
                match value_type:
                    case "int" | "NoneType": #temporary integer and boolean operations
                        nodes_code.append(f"                                ; ({node.type}) * {operator_name} * (int)")
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
                                        nodes_code.append(f"        ld de, 1                ; assume condition=true")
                                        nodes_code.append(f"        xor a                   ;")
                                        nodes_code.append(f"        sbc hl, bc              ;")
                                        nodes_code.append(f"        jp z, {equ_label}           ; if =, true -> skip change")
                                        nodes_code.append(f"        dec e                   ; condition=false")
                                        nodes_code.append(f"{equ_label} push de                 ; >>> push condition boolean")
                                        
                                    case "!=":
                                        equ_label = new_label("neq_")
                                        nodes_code.append(f"        ld de, 1                ; assume condition=true")
                                        nodes_code.append(f"        xor a                   ;")
                                        nodes_code.append(f"        sbc hl, bc              ;")
                                        nodes_code.append(f"        jp nz, {equ_label}           ; if !=, true -> skip change")
                                        nodes_code.append(f"        dec e                   ; condition=false")
                                        nodes_code.append(f"{equ_label} push de                 ; >>> push condition boolean")
                                        
                                    case "<":
                                        equ_label = new_label("les_")
                                        nodes_code.append(f"        ld de, 0                ; assume condition=false")
                                        nodes_code.append(f"        xor a                   ;")
                                        nodes_code.append(f"        sbc hl, bc              ;")
                                        nodes_code.append(f"        jp nc, {equ_label}          ; if >=, false -> change")
                                        nodes_code.append(f"        inc e                   ; condition=true")
                                        nodes_code.append(f"{equ_label} push de                 ; >>> push condition boolean")
                                        
                                    case ">":
                                        equ_label = new_label("mor_")
                                        nodes_code.append(f"        ld de, 0                ; assume condition=false")
                                        nodes_code.append(f"        xor a                   ;")
                                        nodes_code.append(f"        sbc hl, bc              ;")
                                        nodes_code.append(f"        jp m, {equ_label}           ; if <, false -> change")
                                        nodes_code.append(f"        jp z, {equ_label}           ; if =, false -> change")                        
                                        nodes_code.append(f"        inc e                   ; condition=true")
                                        nodes_code.append(f"{equ_label} push de                 ; >>> push condition boolean")
                                        
                                    case ">=":
                                        equ_label = new_label("meq_")
                                        nodes_code.append(f"        ld de, 1                ; assume condition=true")
                                        nodes_code.append(f"        xor a                   ;")
                                        nodes_code.append(f"        sbc hl, bc              ;")
                                        nodes_code.append(f"        jp nc, {equ_label}          ; if >=, true -> skip change")
                                        nodes_code.append(f"        dec e                   ; condition=false")
                                        nodes_code.append(f"{equ_label} push de                 ; >>> push condition boolean")
                                        
                                    case "<=":
                                        equ_label = new_label("leq_")
                                        nodes_code.append(f"        ld de, 1                ; assume condition=true")
                                        nodes_code.append(f"        xor a                   ;")
                                        nodes_code.append(f"        sbc hl, bc              ;")
                                        nodes_code.append(f"        jp c, {equ_label}           ; if <, true -> skip change")
                                        nodes_code.append(f"        jp z, {equ_label}           ; if =, true -> skip change")
                                        nodes_code.append(f"        dec e                   ; condition=false")
                                        nodes_code.append(f"{equ_label} push de                 ; >>> push condition boolean")
                                
                                # align to 2 values pushed
                                nodes_code.append(f"        push de                 ; >>> push bogus value, unused")
                                        
                            # arithmetical operations
                            case "+" | "-" | "*" | "/" | "%":
                                nodes_code.append(f"        pop de                  ; <<< pop left side address, not used\n")
                                match operator_name:
                                    case "+":
                                        nodes_code.append(f"        add hl, bc              ; ({node.type}) 16-bit addition")
                                        
                                    case "-":
                                        nodes_code.append(f"        xor a                    ;")
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
                                nodes_code.append(f"        push hl                 ; >>> bogus record address, unused")
                                nodes_code.append(f"        push hl                 ; >>> record value") 
                                 
                            # logical operations
                            case "&" | "|" | "^":
                                nodes_code.append(f"        pop de                  ; <<< pop left side address, not used\n")
                                match operator_name:
                                    case "&":
                                        nodes_code.append(f"        ld a, h                 ; MSB")
                                        nodes_code.append(f"        and b                   ;")
                                        nodes_code.append(f"        ld d, a                 ;")
                                        nodes_code.append(f"        ld a, l                 ; LSB")
                                        nodes_code.append(f"        and c                   ;")
                                        nodes_code.append(f"        ld e, a                 ;")
                                        
                                    case "|":
                                        nodes_code.append(f"        ld a, h                 ; MSB")
                                        nodes_code.append(f"        or b                    ;")
                                        nodes_code.append(f"        ld d, a                 ;")
                                        nodes_code.append(f"        ld a, l                 ; LSB")
                                        nodes_code.append(f"        or c                    ;")
                                        nodes_code.append(f"        ld e, a                 ;")
                                        
                                    case "^":
                                        nodes_code.append(f"        ld a, h                 ; MSB")
                                        nodes_code.append(f"        xor b                   ;")
                                        nodes_code.append(f"        ld d, a                 ;")
                                        nodes_code.append(f"        ld a, l                 ; LSB")
                                        nodes_code.append(f"        xor c                   ;")
                                        nodes_code.append(f"        ld e, a                 ;")
                                           
                                # common code                               
                                nodes_code.append(f"        push de                 ; >>> bogus record address, unused")
                                nodes_code.append(f"        push de                 ; >>> record value") 
                            
                            # bitwise operations
                            case "<<" | ">>" | ">>>":
                                nodes_code.append(f"        pop de                  ; <<< pop left side address, not used\n")
                                match operator_name:
                                    case "<<":
                                        bsh_label = new_label("bsh_")
                                    
                                        nodes_code.append(f"        ld b, c                 ; number of shifts")
                                        nodes_code.append(f"{bsh_label} add hl, hl              ; shift left")
                                        nodes_code.append(f"        djnz {bsh_label}            ;")                                    
    
                                    case ">>": # pending: missing 
                                        bsh_label = new_label("bsh_")
                                        
                                        nodes_code.append(f"        ld b, c                 ; number of shifts")
                                        nodes_code.append(f"{bsh_label} sra h                   ; shift right 1")
                                        nodes_code.append(f"        rr l                    ; shift right 2")
                                        nodes_code.append(f"        djnz {bsh_label}            ;")                                    

                                    case ">>>":
                                        bsh_label = new_label("bsh_")
                                        
                                        nodes_code.append(f"        ld b, c                 ; number of shifts")
                                        nodes_code.append(f"{bsh_label} srl h                   ; shift right 1")
                                        nodes_code.append(f"        rr l                    ; shift right 2")
                                        nodes_code.append(f"        djnz {bsh_label}            ;")                                    
                                
                                # common code                               
                                nodes_code.append(f"        push hl                 ; >>> bogus record address, unused")
                                nodes_code.append(f"        push hl                 ; >>> record value") 
                            
                            case _:
                                report_error(f"{node.type}: Operation {node.operator} not supported for integers.")
                        
                        nodes_code.append(f"                                ; ({node.type}) end of...\n")
                    
                    # string operations            
                    case "str":
                        nodes_code.append(f"                                ; ({node.type}) * {operator_name} * (str)")
                        match operator_name:
                            case "==":
                                compare_label= new_label ("com_")
                                compare_exit_label= new_label ("cox_")
                                # assign string address to variable
                                nodes_code.append(f"        pop de                  ; pop right string length")
                                nodes_code.append(f"        pop bc                  ; pop right string address")
                                nodes_code.append(f"        pop hl                  ; pop left variable length, unused")
                                nodes_code.append(f"        pop bc                  ; pop left variable address")
                                nodes_code.append(f"        ld b, (hl)              ; prepare countdown")
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
                                nodes_code.append(f"{compare_exit_label}        push bc                 ;\n")
                            
                            case "+":
                                # get both sides strings processed
                                process_node(node.left)
                                process_node(node.right)
                                 
                            case _:
                                report_error(f"{node.type}: Operation {node.operator} not supported for strings.")
                        
                        nodes_code.append(f"                                ; ({node.type}) end of...\n")
                        
            #------------------------------------------------------------------
            case "CallExpression":
                #print (f"({node.type}) Node:\n {node}")

                callee = node.callee
                callee_name = getattr(callee, "name", None)
                callee_object = getattr(callee, "object", None)
                callee_property = getattr(callee, "property", None)

                #lowercase the function name
                if callee_name:
                    function_name = callee_name.lower()
                else:
                    function_name =""
                # known functions ---------------------------------------------------
                match function_name:
                    # eval(): fake calls for raw assembly
                    case "eval":
                        if node.arguments:
                            assembly_line = getattr(node.arguments[0], "value", None)
                            if assembly_line is None:
                                report_error(f"{node.type}: eval() requires a literal assembly string.")
                                return
                            nodes_code.append(f"        {assembly_line}") # take the eval argument only
                     
                    # include(): read filenames and add them to the includes list
                    case "include": 
                        if len(node.arguments) < 1:
                            report_error(f"{node.type}: include() requires a filename.")
                            return
                        filename = getattr(node.arguments[0], "value", None)
                        if filename is None:
                            report_error(f"{node.type}: include() requires a literal filename.")
                            return
                        include_filenames_list.append(filename)
                         
                    # read(): read keyboard
                    case "read":
                        if len(node.arguments) < 1:
                            report_error(f"{node.type}: read() requires a destination variable.")
                            return
                        # process argument
                        read_argument_name = getattr(node.arguments[0], "name", None)
                        if not read_argument_name:
                            report_error(f"{node.type}: read() destination must be a variable.")
                            return
                        variable_name = add_underscore_to_var(read_argument_name)
                        if variable_name in string_type_list:
                            variable_type = string_type_list[variable_name]
                        elif variable_name in variable_type_list:
                            variable_type = variable_type_list[variable_name]
                            
                            match variable_type:
                                case "int":
                                    # assembly code
                                    # pending: garbage assignment size?
                                    garbage_address=get_garbage_address(2)
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
                            report_error(f"{node.type}: Undefined {variable_name}")
                    
                    # setInterval(): set timer
                    case "setinterval":
                        if len(node.arguments) < 2:
                            report_error(f"{node.type}: setInterval() requires a function and a period.")
                            return
                        #interrupt_function=add_underscore_to_var(node.arguments[0].name)
                        interval_value = getattr(node.arguments[1], "value", None)
                        if interval_value is None:
                            report_error(f"{node.type}: setInterval() period must be a literal value.")
                            return
                        interrupt_period=int(interval_value/1000*50) # /1000 milliseconds* 50 ticks/second

                        # declarations
                        variable_declarations.append(f"                               ; ({function_name}) timer parameters")
                        variable_declarations.append(f"int_tik defw {interrupt_period}                ; ticks per interrupt (fixed)")
                        variable_declarations.append(f"tik_cou defw {interrupt_period}                ; tick count (decreasing)")
                        variable_declarations.append(f"interrupt_activation defw 0                 ; seconds count")
                        
                        # assembly code
                        nodes_code.append(f"        call set_int            ; calls the interruptions routine")
               
                    # clearInterval(): stop timer
                    case "clearinterval":
                        # configure 
                        #nodes_code.append(f"        di                      ; stops the interruptions routine")
                        nodes_code.append(f"        ld hl, interrupt_activation    ; interrupts state")
                        nodes_code.append(f"        ld (hl), 0                 ; active now")
                    
                    # regular calls
                    case _:
                        if callee_name:
                            function_name=add_underscore_to_var(callee_name)
                            nodes_code.append(f"                                ; ({node.type}): regular call prep ***{function_name}***\n")
                            
                            # process arguments
                            # stack frame!
                            # for arg in node.arguments:
                            for arg in reversed(node.arguments):
                                if getattr(arg, "type", None) not in ("Identifier", "Literal"):
                                    report_warning(
                                        f"{node.type}: complex function call arguments are not supported. "
                                        f"Assign the expression to a variable before calling {function_name}."
                                    )
                                process_node(arg)
                            
                            # call function    
                            nodes_code.append(f"        call {function_name}            ; ({node.type}): call ***{function_name}***")
                                                    
                # Objects -----------------------------------------------------   

                object_name = getattr(callee_object, "name", None)
                property_name = getattr(callee_property, "name", None)
                        
                #print (f" variable list: {variable_type_list}")
                #print (f" array list: {array_type_list}")
                #print (f" object list: {object_type_list}")
                #print (f" matrix list: {matrix_type_list}")
                #print (f" string list: {string_type_list}")
                        
                if object_name:
                    # string objects methods ----------------------------------
                    if add_underscore_to_var(object_name) in string_type_list:
                        # get string and index in the stack
                        process_node (callee_object)
                        process_node (node.arguments[0])
                                    
                        nodes_code.append(f"                                ; ({node.type}) String *** {property_name} ***")           
                                
                        string_name=add_underscore_to_var(callee_object.name)
                        match property_name:
                            case "charAt" | "charat":
                                char_address = get_garbage_address(3)
                                nodes_code.append(f"        pop de                  ; <<< pop index value")
                                nodes_code.append(f"        pop hl                  ; <<< pop index address, unused")
                                nodes_code.append(f"        pop hl                  ; <<< pop string content pointer")
                                nodes_code.append(f"        pop bc                  ; <<< pop string variable address, unused")
                                nodes_code.append(f"        inc hl                  ; skip length")
                                nodes_code.append(f"        inc hl                  ;")
                                nodes_code.append(f"        add hl, de              ; string character address")
                                nodes_code.append(f"        ld a, (hl)              ; character")
                                nodes_code.append(f"        ld hl, {char_address}          ; one-character string buffer")
                                nodes_code.append(f"        ld (hl), 1              ; string length LSB")
                                nodes_code.append(f"        inc hl                  ;")
                                nodes_code.append(f"        ld (hl), 0              ; string length MSB")
                                nodes_code.append(f"        inc hl                  ;")
                                nodes_code.append(f"        ld (hl), a              ; string character")
                                nodes_code.append(f"        ld de, {char_address}          ; string content pointer")
                                nodes_code.append(f"        push de                 ; >>> bogus string variable address")
                                nodes_code.append(f"        push de                 ; >>> string content pointer")

                            case "charCodeAt" | "charcodeat":
                                nodes_code.append(f"        pop de                  ; <<< pop index value")
                                nodes_code.append(f"        pop hl                  ; <<< pop index address, unused")
                                nodes_code.append(f"        pop hl                  ; <<< pop string content pointer")
                                nodes_code.append(f"        pop bc                  ; <<< pop string variable address, unused\n")
                                        
                                nodes_code.append(f"                                ; get char and put it garbage zone") 
                                nodes_code.append(f"        inc hl                  ; skip length")
                                nodes_code.append(f"        inc hl                  ;")
                                nodes_code.append(f"        add hl, de              ; string record")
                                nodes_code.append(f"        ld d, 0                 ; get char")
                                nodes_code.append(f"        ld e, (hl)              ; get char")
                                
                                nodes_code.append(f"        push de                 ; >>> bogus record address, unused")
                                nodes_code.append(f"        push de                 ; >>> record value")
                    
                    # string objects methods ----------------------------------
                    elif add_underscore_to_var(object_name) in array_type_list:
                        array_name=add_underscore_to_var(callee_object.name)      
                        process_node (callee_object)
                        
                        nodes_code.append(f"                                ; ({node.type}) Array *** {property_name} ***")

                        match property_name:
                            case "Fill" | "fill":
                                if len(node.arguments) < 1:
                                    report_error(f"{node.type}: Array.fill() requires a value.")
                                    return
                                fill_value = getattr(node.arguments[0], "value", None)
                                if fill_value is None:
                                    report_error(f"{node.type}: Array.fill() currently requires a literal value.")
                                    return
                                fill_value_16b = int(fill_value) & 0xFFFF
                                fill_value_lsb = fill_value_16b & 0xFF
                                fill_value_msb = fill_value_16b >> 8
                                fill_loop_label= new_label ("flo_")
                                nodes_code.append(f"        pop hl                  ; <<< pop array content, unused")
                                nodes_code.append(f"        pop hl                  ; <<< pop array address\n")
                                
                                nodes_code.append(f"        ld b, (hl)              ; prepare counter")
                                nodes_code.append(f"        inc hl                  ; skip header")
                                nodes_code.append(f"        inc hl                  ; skip header")
                                nodes_code.append(f"{fill_loop_label} ld (hl), {fill_value_lsb}              ; fill value LSB")
                                nodes_code.append(f"        inc hl                  ; next byte")
                                nodes_code.append(f"        ld (hl), {fill_value_msb}              ; fill value MSB")
                                nodes_code.append(f"        inc hl                  ; next element")
                                nodes_code.append(f"        djnz {fill_loop_label}            ; loop ")
                                
                                   
                    # special case: console.log() call to print text
                    elif object_name in ("Console", "console"):
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
                                        variable_content_type= get_content_type(argument) # get type from variable list
                                        match variable_content_type:
                                            # integer
                                            case "int":
                                                nodes_code.append(f"        call prt_num            ; ({node.type}) print literal number\n")
                                            # string    
                                            case "str":
                                                argument_value = getattr(argument, "value", None)
                                                if argument_value and len(argument_value)==1:
                                                    nodes_code.append(f"        call prt_chr            ; ({node.type}) print literal char\n")
                                                else:
                                                    nodes_code.append(f"        call prt_str            ; ({node.type}) print literal string\n")
                                            case _:
                                                report_error(f"{node.type}: Console.log, content type not supported.")
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
                                                   
                            case "clear":
                                    nodes_code.append(f"        call cls_rom            ; ({node.type}) clear screen")
                            case _:
                                    report_error(f"{node.type}: {object_name}, {property_name} property not supported.")  
                                                                       
                    # special case: console.log() call to print text
                    elif object_name in ("Memory", "memory"):
                        match property_name:
                            case "read":
                                if len(node.arguments) < 1:
                                    report_error(f"{node.type}: memory.read() requires an address.")
                                    return
                                if node.arguments:
                                    for argument in node.arguments: # for every parameter in the call
                                        process_node(argument)
                                    nodes_code.append(f"        call mem_rea            ; ({node.type}) print string")
                                    nodes_code.append ("")

                            case "write":
                                if len(node.arguments) < 2:
                                    report_error(f"{node.type}: memory.write() requires an address and a value.")
                                    return
                                if node.arguments:
                                    for argument in node.arguments: # for every parameter in the call
                                        process_node(argument)
                                    nodes_code.append(f"        call mem_wri            ; ({node.type}) print string")
                                    nodes_code.append ("")   
                            
                            case "copy":
                                if len(node.arguments) < 3:
                                    report_error(f"{node.type}: memory.copy() requires source, target, and size.")
                                    return
                                if node.arguments:
                                    for argument in node.arguments: # for every parameter in the call
                                        process_node(argument)
                                    nodes_code.append(f"        call mem_mov            ; ({node.type}) print string")
                                    nodes_code.append ("")                        
                     
                    elif object_name in ("Math", "math"):
                        match property_name:
                            case "random":
                                garbage_address=get_garbage_address(2)
                                nodes_code.append(f"        call rnd_16b            ; ({node.type}) get 16-bit random number")
                            case _:
                                report_error(f"{node.type}: {object_name}.{property_name} method not supported.")
                            
                    # special case: read keyboard
                    elif property_name in ("addEventListener", "addeventlistener"):
                        if len(node.arguments) < 2:
                            report_error(f"{node.type}: addEventListener() requires an event name and a function.")
                            return
                        event_name= getattr(node.arguments[0], "value", None)
                        keypressed_raw_name = getattr(node.arguments[1], "name", None)
                        if event_name is None or not keypressed_raw_name:
                            report_error(f"{node.type}: addEventListener() requires a literal event name and a named function.")
                            return
                        # key pressed event
                        if event_name== "keydown":
                            keypressed_event_name= event_name
                            keypressed_function= add_underscore_to_var(keypressed_raw_name)
                            # pending: only to be done once during declarations
                            # pending: to be moved to io.asc
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
                            nodes_code.append(f"        ld a, (hl)              ; get LSB")
                            nodes_code.append(f"        or a                    ; check activation bit")
                            nodes_code.append(f"        jr nz, rea_key          ; loop while eventListener is active")
                            nodes_code.append(f"        ret                     ;\n")
    
                    elif property_name== "removeEventListener":
                        if len(node.arguments) < 2:
                            report_error(f"{node.type}: removeEventListener() requires an event name and a function.")
                            return
                        event_name= getattr(node.arguments[0], "value", None)
                        keypressed_raw_name = getattr(node.arguments[1], "name", None)
                        if event_name is None or not keypressed_raw_name:
                            report_error(f"{node.type}: removeEventListener() requires a literal event name and a named function.")
                            return
                        if event_name== "keydown":
                            keypressed_event_name= event_name
                            keypressed_function= add_underscore_to_var(keypressed_raw_name)
                            nodes_code.append(f"        ld hl, {keypressed_event_name}_activation           ; ({node.type}) {event_name} deactivate feature")
                            nodes_code.append(f"        ld (hl), 0              ; A=0\n")
                            nodes_code.append("")
                                
                        else:
                            report_error(f"{node.type}: {property_name}, {event_name} not supported.")
                                      
                    # special case: canvas methods
                    elif (object_name in object_type_list):
                        if (object_type_list[object_name]=="canvas"):
                            match property_name:
                                case "moveTo" | "moveto":
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
                                    
                                case "lineTo" | "lineto":
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
                    
                                case "clearScreen" | "clearscreen":
                                    nodes_code.append(f"        call cle_scr            ; ({node.type}) clear screen")
                    else:
                        report_error(f"{node.type}: '{object_name}' object not supported.")
                
                nodes_code.append ("")

                if hasattr(callee_object, "name"):
                    # generic string methods
                    if callee_object.name== "String": # here is where methods for literals should arrive at
                        nodes_code.append(f"                                ; ({node.type}) String methods")
                        for argument in node.arguments:
                            process_node(argument)
                        process_node(callee)

                if hasattr(callee_object, "type"):
                    # genric literal methods
                    if callee_object.type== "Literal": 
                        literal_type= type(callee_object.value).__name__     
                        match literal_type:
                            case "int": # pending: not supported
                                report_warning(f"{node.type}: methods on integer literals are not supported yet.")
                            case "str": # pending: not supported
                                report_warning(f"{node.type}: methods on string literals are not supported yet.")
 
            #------------------------------------------------------------------    
            case "ConditionalExpression": # contains one or more variable declaration
                #print (f"({node.type}) Node:\n {node}")
                conditional_alternate_label = new_label("cal_")
                conditional_exit_label = new_label("cex_")
                nodes_code.append(f"                                ; ({node.type}) 1. test")
                process_node(node.test)
                
                nodes_code.append(f"        pop de                  ; ({node.type}) <<< pop condition value")
                nodes_code.append(f"        pop hl                  ; <<< pop address, unused")
                nodes_code.append(f"        xor a                   ; A=0")
                nodes_code.append(f"        cp e                    ; if E=0, condition not fulfiled")
                nodes_code.append(f"        jr z, {conditional_alternate_label}           ;")
                
                # depending on the result: if true -> consequent, if false -> alternate
                nodes_code.append(f"                                ; ({node.type}) 2. consequent")
                process_node(node.consequent)
                nodes_code.append(f"        jr {conditional_exit_label}              ;")
                
                nodes_code.append(f"{conditional_alternate_label}                         ; ({node.type}) 3. alternate")
                process_node(node.alternate)
                
                nodes_code.append(f"{conditional_exit_label}                         ; ({node.type}) end of...")
                nodes_code.append("")
                
            #------------------------------------------------------------------    
            case "DoWhileStatement": # contains one or more variable declaration
                #print (f"({node.type}) Node:\n {node}")
                do_while_label = new_label("dow_")
                #do_while_end_label = new_label("dox_")
                break_label_stack.append(new_label("dox_"))
                update_label_stack.append(new_label("wup_"))
                
                # loop body
                if node.body:
                    nodes_code.append(f"{do_while_label}                         ; ({node.type}) 1. body")
                    process_node(node.body)

                # condition test
                if node.test:
                    nodes_code.append(f"                                ; ({node.type}) 2. test")
                    process_node(node.test)
                    nodes_code.append(f"        pop de                  ; ({node.type}) <<< pop condition value")
                    nodes_code.append(f"        pop hl                  ; <<< pop address, unused")                    
                    nodes_code.append(f"        xor a                   ; A=0")
                    nodes_code.append(f"        cp e                    ; if E=0, condition not fulfiled")
                    nodes_code.append(f"        jp z, {break_label_stack[-1]}           ;")
                        
                nodes_code.append(f"        jp {do_while_label}              ;")                
                nodes_code.append(f"{break_label_stack.pop()}                         ; ({node.type}) end of...")
                nodes_code.append("")
            
            #------------------------------------------------------------------            
            case "EmptyStatement":
                report_warning(f"{node.type}: no impact in your code. Likely an unneeded semicolon.")
            #------------------------------------------------------------------
            case "ForStatement":
                #print (f"({node.type}) Node:\n {node}")
                for_label = new_label("for_")
                break_label_stack.append(new_label("fex_"))
                update_label_stack.append(new_label("fup_"))
            
                # Initialization
                nodes_code.append(f"                                ; ({node.type}) 1. init --------------")
                if node.init:
                    process_node(node.init)
            
                if node.test:
                    nodes_code.append(f"{for_label}                         ; ({node.type}) 2. test --------------")
                    process_node(node.test)
                    nodes_code.append(f"        pop de                  ; ({node.type}) <<< pop condition value")
                    nodes_code.append(f"        pop hl                  ; <<< pop address, unused")
                    nodes_code.append(f"        xor a                   ; A=0")
                    nodes_code.append(f"        cp e                    ; if E=0, condition not fulfiled")
                    nodes_code.append(f"        jp z, {break_label_stack[-1]}           ;")
                        
                    nodes_code.append("")
                if node.body:
                    nodes_code.append(f"                                ; ({node.type}) 3. body -------------")
                    process_node(node.body)
                        
                if node.update:
                    nodes_code.append(f"{update_label_stack.pop()}                         ; ({node.type}) 4. update ---------")
                    process_node(node.update)
            
                nodes_code.append(f"        jp {for_label}")
            
                # Safely pop the exit label and use it
                nodes_code.append(f"{break_label_stack.pop()}                         ; ({node.type}) end of...")
                nodes_code.append("")

            #------------------------------------------------------------------
            case "ContinueStatement":
                #print (f"({node.type}) Node:\n {node}")
                if not update_label_stack:
                    report_error(f"{node.type}: continue used outside a loop.")
                    return
                nodes_code.append(f"        jp {update_label_stack[-1]}              ; ({node.type})")
                nodes_code.append("")

            #------------------------------------------------------------------
            case "FunctionDeclaration": # Function Call, step 2: function tag, pop parameters
                #print (f"({node.type}) Node:\n {node}")
                function_exit_tag=new_label("fex_")
                function_raw_name = getattr(getattr(node, "id", None), "name", None)
                if not function_raw_name:
                    report_error(f"{node.type}: unnamed function declarations are not supported.")
                    return
                function_name = add_underscore_to_var(function_raw_name)

                if function_name not in function_declarations:
                    function_declarations.append(function_name)
                                
                # 1) 'id' section
                nodes_code.append(f"; ({node.type}) Function: {function_name}")
                nodes_code.append(f"{function_name}                        ; ({node.type}) *** {function_name} ***")

                # 2) return address
                nodes_code.append(f"                                ; save return address")
                nodes_code.append(f"        ld hl, sta_ck2          ; needed in recursion cases")
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
                nodes_code.append(f"        inc (hl)                ; end of return address preps\n")
              
                # 3.2) collect arguments   
                nodes_code.append(f"                                ; ({node.type}) collect arguments")
                #for param in reversed(node.params): # Handle parameters (if any) for the function
                for param in (node.params):
                    parameter_raw_name = getattr(param, "name", None)
                    if not parameter_raw_name:
                        report_error(f"{node.type}: only named parameters are supported.")
                        continue
                    parameter_name = add_underscore_to_var(parameter_raw_name)
                    if parameter_name not in variable_type_list:
                        variable_type_list[parameter_name] = "int" # Pending: wrong assumption. all parameters are marked as integer
                        # variable declaration
                        variable_declarations.append(f'{parameter_name}   defw 0                ; ({node.type}) literal int/bool')
                        # assembly code: load variable with values in stack in reverse order
                        nodes_code.append(f"        ld hl, {parameter_name}            ; argument *** {parameter_name} ***")
                        nodes_code.append(f"        pop de                  ; <<< pop address")
                        nodes_code.append(f"        pop bc                  ; <<< pop value")
                        # stack frame! when using the argument reversed copy
                        nodes_code.append(f"        ld (hl), e              ; store it in memory")
                        nodes_code.append(f"        inc hl                  ;")
                        nodes_code.append(f"        ld (hl), d              ;\n")

                    else:
                        report_error(f"{node.type}: duplicated {parameter_name}")
                                    
                # 4) 'body' section (actually, body.body)
                nodes_code.append(f"                                ; ({node.type}) function body")
                process_node(node.body)

                # 5) return address
                function_stack_tag=new_label("fst_")
                nodes_code.append(f"{function_stack_tag}                         ; ({node.type}) recover return address (general)")
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
                nodes_code.append(f"        dec (hl)                ; end of return address restore")
                
                # 6) exit
                nodes_code.append(f"{function_exit_tag} ret                     ; ({node.type}) end of...\n")
                nodes_code.append(f"{function_end_tag}")
             
            #------------------------------------------------------------------             
                
            case "ReturnStatement": # Function Call, step 3: return values
                #print (f"({node.type}) Node:\n {node}")
                nodes_code.append(f"                                ; ({node.type}) return expression")
                if node.argument:
                    # Process the arguments of the return statement (expression to be returned)
                    process_node(node.argument)  # Evaluate the expression
                nodes_code.append("")
                
                # assembly code
                # pending: we could just jump to "recover return address (general)"
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
                else_label = new_label("els_")
                end_label = new_label("ski_")
                #print (f"({node.type}) Exit: {end_label}")
                #print (f"({node.type}) Node:\n {node}\n")
                expression= (getattr(getattr(node.test, "left", None), "raw", None) or "expression") + (getattr(node.test, "operator", None) or "") + (getattr(getattr(node.test, "right", None), "raw", None) or "expression")

                # assembly code
                nodes_code.append(f"                                ; ({node.type}) ***{expression}*** test")
                process_node(node.test)
                nodes_code.append(f"        pop de                  ; ({node.type}) <<< pop condition value")
                nodes_code.append(f"        pop hl                  ; <<< pop address, unused")                        
                nodes_code.append(f"        xor a                   ; A=0")
                nodes_code.append(f"        cp e                    ; if E=0, condition not fulfiled")
                nodes_code.append(f"        jp z, {else_label}           ;")
                                                    
                # if
                process_node(node.consequent)
                nodes_code.append(f"        jp {end_label}              ; ({node.type}) ***{expression}*** skips else")
                nodes_code.append(f"{else_label}                         ; else\n")
                # else
                if node.alternate:
                    process_node(node.alternate)
                nodes_code.append(f"{end_label}                         ; ({node.type}) ***{expression}*** end of...")
                nodes_code.append("")
            
            #------------------------------------------------------------------
            case "Literal":
                #print (f"({node.type}) Node:\n {node}")
                literal_value = node.value
                # integer literal
                # special boolean cases
                if literal_value == True: literal_value = 1
                if literal_value == False: literal_value = 0
                        
                if isinstance(literal_value, int): # this works for both integer and boolean
                    # assembly code
                    nodes_code.append(f"        ld de, {literal_value}                ; ({node.type}) literal int: * {literal_value} *")
                    nodes_code.append(f"        push de                 ; >>> push bogus address, unused")
                    nodes_code.append(f"        push de                 ; >>> push value")     
                                                    
                # string literals
                if isinstance(node.value, str):
                    literal_value= basic_ascii(literal_value) # remove exotic characters
                    literal_length = len(literal_value)
                    literal_name = new_label("stn_")  # Generate a unique label
                    
                    # one-char literal becomes an integer...
                    if literal_length == 1:
                        ascii_value = ord(literal_value)  # Convert character to ASCII
                        nodes_code.append(f'        ld de, "{literal_value}"              ; ({node.type}) literal char: * "{literal_value}" * (ascii: {ascii_value}d)')
                        nodes_code.append(f"        push de                 ; >>> push bogus address, unused")
                        nodes_code.append(f"        push de                 ; >>> push value")  
                    
                    # regular strings
                    else:
                        # literal declaration
                        variable_declarations.append(f'{literal_name} defb {literal_length}, 0, "{literal_value}"        ; ({node.type}) string')
                        # assembly code
                        nodes_code.append(f"                                ; ({node.type}) * '{literal_value}' *")
                        nodes_code.append(f"        ld hl, {literal_name}          ; literal string address")
                        nodes_code.append(f"        ld de, {len(literal_value)}                ; string length")
                        nodes_code.append(f"        push de                 ; >>> push dummy content")  
                        nodes_code.append(f"        push hl                 ; >>> push literal address")
                        
                nodes_code.append("")

            #------------------------------------------------------------------ 
            case "LogicalExpression":
                #print (f"({node.type}) Node:\n {node}")
                lex_exit_label = new_label("lex_")
                operator_name = node.operator
                                
                # process sides
                process_node(node.right)
                process_node(node.left)
                
                nodes_code.append(f"                                ; ({node.type}) logical * {operator_name} *\n")

                match operator_name:
                    case "&&":
                        nodes_code.append(f"        pop hl                  ; <<< pop left evaluation")
                        nodes_code.append(f"        pop de                  ; <<< pop left address, unused")
                        nodes_code.append(f"        pop bc                  ; <<< pop right evaluation")
                        nodes_code.append(f"        pop de                  ; <<< pop right address, unused")
                        
                        nodes_code.append(f"        ld de, 0                ; ({node.type}) assume condition is false")
                        nodes_code.append(f"        ld a, h                 ; test 16-bit register = 0")
                        nodes_code.append(f"        or l                    ;")
                        nodes_code.append(f"        jr z, {lex_exit_label}           ; MSB not fulfiling")
                        nodes_code.append(f"        ld a, b                 ; test 16-bit register = 0")
                        nodes_code.append(f"        or c                    ;")
                        nodes_code.append(f"        jr z, {lex_exit_label}           ; LSB not fulfiling")
                        
                        nodes_code.append(f"        inc de                  ; condition is true")
                        nodes_code.append(f"{lex_exit_label} push de                 ; >>> push result")
                        nodes_code.append(f"        push de                 ; >>> push result\n")
                        nodes_code.append("")

                    case "||":
                        nodes_code.append(f"        pop hl                  ; <<< pop left value")
                        nodes_code.append(f"        pop de                  ; <<< pop left address, unused")
                        nodes_code.append(f"        pop bc                  ; <<< pop right value")
                        nodes_code.append(f"        pop de                  ; <<< pop right address, unused")
                        
                        nodes_code.append(f"        ld de, 0                ; ({node.type}) assume condition is false")
                        nodes_code.append(f"        ld a, h                 ; test both 16-bit registers are 0")
                        nodes_code.append(f"        or l                    ;")
                        nodes_code.append(f"        or b                    ;")
                        nodes_code.append(f"        or c                    ;")
                        nodes_code.append(f"        jr z, {lex_exit_label}           ; assume condition is false")
                        
                        nodes_code.append(f"        inc de                  ; condition is true")
                        nodes_code.append(f"{lex_exit_label} push de                 ; >>> push result")
                        nodes_code.append(f"        push de                 ; >>> push result\n")
                        nodes_code.append("")
                    
                    case "!":
                        nodes_code.append(f"        pop hl                  ; <<< pop left value")
                        nodes_code.append(f"        pop de                  ; <<< pop left address, unused")

                        nodes_code.append(f"        ld de, 1                ; ({node.type}) assume condition is false")
                        nodes_code.append(f"        ld a, h                 ; test 16-bit register is 0")
                        nodes_code.append(f"        or l                    ;")
                        nodes_code.append(f"        jr z, {lex_exit_label}           ; fulfiling")
                        
                        nodes_code.append(f"        inc de                  ; condition is true")
                        nodes_code.append(f"{lex_exit_label} push de                 ; >>> push result\n")
                        nodes_code.append(f"        push de                 ; >>> push result\n")
                        nodes_code.append("")

                    case _:
                        report_error(f"{node.type}: Unsupported logical operator: {operator_name}")
                        return

            #------------------------------------------------------------------ 
            case "Identifier":
                #print (f"({node.type}) Node:\n {node}")
                identifier_name = getattr(node, "name", None)
                if not identifier_name:
                    report_error(f"{node.type}: identifier without a name is not supported.")
                    return
                variable_name= add_underscore_to_var(identifier_name)
                
                # constant handling
                if variable_name in constant_type_list:
                    nodes_code.append(f"                                ; ({node.type}) constant * {variable_name} *")
                    nodes_code.append(f"        ld hl, {variable_name}            ; variable content")
                    nodes_code.append(f"        push hl                 ; >>> push variable address (bogus)")
                    nodes_code.append(f"        push hl                 ; >>> push variable content")
                else: # other, not constants
                    nodes_code.append(f"                                ; ({node.type}) variable * {variable_name} *")
                    nodes_code.append(f"        ld hl, {variable_name}            ; variable address")
                    nodes_code.append(f"        push hl                 ; >>> push variable address")
                    nodes_code.append(f"        ld hl, ({variable_name})          ; variable content")
                    nodes_code.append(f"        push hl                 ; >>> push variable content")
                
                nodes_code.append("")
                
            #------------------------------------------------------------------ 
            case "MemberExpression":
                #print (f"({node.type}) Node:\n {node}")
                #print (f" Member expression:"); print (f" variable list: {variable_type_list}"); print (f" string list: {string_type_list}")
                #print (f" array list: {array_type_list}"); print (f" object list: {object_type_list}"); print (f" matrix list: {matrix_type_list}")
                #print (f" constant list: {constant_type_list}")

                member_object = getattr(node, "object", None)
                member_property = getattr(node, "property", None)
                nested_object = getattr(member_object, "object", None)
                member_object_name = getattr(member_object, "name", None)
                member_property_name = getattr(member_property, "name", None)
                member_property_type = getattr(member_property, "type", None)
                
                # 2D matrices (notation: matrix1 [x][y])
                if (nested_object and getattr(nested_object, "name", None)): 
                    matrix_name=add_underscore_to_var(nested_object.name)
                    if matrix_type_list.get(matrix_name) or array_type_list.get(matrix_name) :  
                        nodes_code.append(f"                                ; ({node.type}) matrix ***{matrix_name}*** ")
                        nodes_code.append(f"        ld hl, {matrix_name}            ; variable address")
                        nodes_code.append(f"        push hl                 ; >>>")
                        nodes_code.append(f"        ld hl, ({matrix_name})          ; variable content")
                        nodes_code.append(f"        push hl                 ; >>>\n")
                        
                        nodes_code.append(f"                                ; ({node.type}) matrix column")
                        process_node(member_object.property)
                        nodes_code.append(f"                                ; ({node.type}) matrix row")
                        process_node(member_property)
                        
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
                elif member_object_name:
                    object_name=add_underscore_to_var(member_object_name)
                    if object_type_list.get(object_name):
                        process_node(member_object)
                        process_node(member_property)
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
                        if array_type_list[object_name]=="int":
                            array_name=object_name
                            process_node(member_object)
                            process_node(member_property)
                            
                            nodes_code.append(f"                                ; ({node.type}) integer array access")                 
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
                            
                        if array_type_list[object_name]=="str":
                            string_array_label= new_label("sar_")
                            array_name=object_name
                            process_node(member_object)
                            process_node(member_property)        
                            
                            nodes_code.append(f"                                ; ({node.type}) string array access")
                            nodes_code.append(f"        pop hl                  ; <<< pop record index")
                            nodes_code.append(f"        pop de                  ; <<< pop record index address, unused")
                            nodes_code.append(f"        pop de                  ; <<< pop array content, unused")
                            nodes_code.append(f"        pop de                  ; <<< pop array address")
                            
                            nodes_code.append(f"                                ; find record address")
                            nodes_code.append(f"        add hl, hl              ; position within array variable")
                            nodes_code.append(f"        add hl, de              ; add array initial address")
                            nodes_code.append(f"        ld de, 2                ; skip array sizes")
                            nodes_code.append(f"        add hl, de              ; ")
                            nodes_code.append(f"        ld e, (hl)              ; position content!")
                            nodes_code.append(f"        inc hl                  ;")
                            nodes_code.append(f"        ld d, (hl)              ;")
                            nodes_code.append(f"        push de                 ; >>> push array address")
                            nodes_code.append(f"        push de                 ; >>> push array address\n")
                                               
                
                if member_object_name:
                    variable_name= add_underscore_to_var(member_object_name)
                    property_name= member_property_name
                    property_type= member_property_type
                    object_name=member_object_name
                    
                    # string methods
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
                            report_error(f"{node.type}: character in string not supported.")
                            # process children
                            #process_node(node.object)
                            #process_node(node.property)
                            
            #------------------------------------------------------------------ 
            case "ObjectExpression":
                report_error(f"({node.type}) Node:\n {node} not supported.")
                pass                
                       
            #------------------------------------------------------------------ 
            case "SwitchStatement":
                #print (f"({node.type}) Node:\n {node}")
                break_label_stack.append(new_label("swx_"))
                discriminant_raw_name = getattr(node.discriminant, "name", None)
                if not discriminant_raw_name:
                    report_error(f"{node.type}: only variable switch discriminants are supported.")
                    break_label_stack.pop()
                    return
                discriminant_name=add_underscore_to_var(discriminant_raw_name)
                
                if discriminant_name in variable_type_list:
                    nodes_code.append(f"                                ; ({node.type})")
                    
                    process_node(node.discriminant)
                    
                    # cases
                    for switchcase in node.cases:
                        process_node(switchcase)
                    
                    nodes_code.append(f"{break_label_stack.pop()}                         ; ({node.type})\n") 
                    nodes_code.append(f"        pop hl                  ; <<< clean stack")
                    nodes_code.append(f"        pop hl                  ; <<< clean stack")   
                    nodes_code.append("")
                
                else:
                    report_error(f"{node.type}: {discriminant_name} not in variable list.")
                    
            case "SwitchCase":
                #print (f"({node.type}) Node:\n {node}")

                switch_label = new_label("swi_")
                nodes_code.append(f"                                ; ({node.type})")
                if node.test is None:
                    for conseq in node.consequent:
                        process_node(conseq)
                    nodes_code.append(f"{switch_label}                         ; ({node.type}) default")
                    nodes_code.append("")
                    return
                # test, contains the value to be tested
                process_node(node.test)
                
                # assembly code
                nodes_code.append(f"                                ; ({node.type})")
                nodes_code.append(f"        pop bc                  ; <<< pop case value")
                nodes_code.append(f"        pop af                  ; <<< pop case address, unused")
                nodes_code.append(f"        pop hl                  ; <<< pop discriminant value")
                nodes_code.append(f"        pop de                  ; <<< pop discriminant address")
                nodes_code.append(f"        push de                 ; >>> push discriminant address")
                nodes_code.append(f"        push hl                 ; >>> push discriminant value")
                nodes_code.append(f"        xor a                   ;")
                nodes_code.append(f"        sbc hl, bc              ;")
                nodes_code.append(f"        jp nz, {switch_label}          ; if =, skip")
                
                # consequent
                for conseq in node.consequent:
                        process_node(conseq)
                
                nodes_code.append(f"{switch_label}                         ; ({node.type})")
                nodes_code.append("")
                
            case "BreakStatement":
                #print (f"({node.type}) Exit Label: {break_label_stack[-1]}\n")
                #print (f"({node.type}) Node:\n {node}\n")
                
                if not break_label_stack:
                    report_error(f"{node.type}: break used outside a loop or switch.")
                    return
                nodes_code.append(f"        jp {break_label_stack[-1]}              ; ({node.type})")
                nodes_code.append("")
            
            #-------------------------------------------------------------------
            case "UnaryExpression":
                #print (f"({node.type}) Node:\n {node}")
                nodes_code.append(f"                                ; ({node.type}) * {node.operator} *")
                unary_argument = getattr(node, "argument", None)
                match node.operator:
                    case "~":
                        # evaluate expression
                        process_node(unary_argument)
                        # apply not
                        nodes_code.append(f"        pop de                  ; pop value")
                        nodes_code.append(f"        pop hl                  ; pop address, unused")
                        nodes_code.append(f"        ld a, e                 ;")
                        nodes_code.append(f"        cpl                     ; negate LSB")
                        nodes_code.append(f"        ld e, a                 ;")
                        nodes_code.append(f"        ld a, d                 ;")
                        nodes_code.append(f"        cpl                     ; negate MSB")
                        nodes_code.append(f"        ld d, a                 ;")
                        nodes_code.append(f"                                ;")
                                              
                    case "-":
                        if getattr(unary_argument, "type", None)=="Literal": # short way for literals
                            literal_value = getattr(unary_argument, "value", 0)
                            nodes_code.append(f"        ld de, {-literal_value}               ; ({node.type}) literal unary: * {-literal_value} *")
                        else: # standard for non-literals
                            # evaluate expression
                            process_node(unary_argument)
                            # apply -
                            nodes_code.append(f"        pop de                  ; pop value")
                            nodes_code.append(f"        pop hl                  ; pop address, unused")
                            nodes_code.append(f"        xor a                    ;")
                            nodes_code.append(f"        ld hl, 0                ;")
                            nodes_code.append(f"        sbc hl, de              ; HL = -BC")
                            nodes_code.append(f"        ex de, hl               ; DE = HL")
                    case _:
                        report_error(f"{node.type}: Unsupported unary operator: {node.operator}")
                        return
                        
                
                nodes_code.append(f"        push de                 ; >>> push value, unused")
                nodes_code.append(f"        push de                 ; >>> push record value")
                nodes_code.append("")
                                                
            #-------------------------------------------------------------------
            case "UpdateExpression":
                #print (f"({node.type}) Node:\n {node}")
                update_argument = getattr(node, "argument", None)
                if update_argument is None:
                    report_error(f"{node.type}: update expression without an argument is not supported.")
                    return
                process_node(update_argument)
                nodes_code.append(f"                                ; ({node.type}) *** {node.operator} ***")
                nodes_code.append(f"        pop hl                  ; <<< pop left side value, not used")
                nodes_code.append(f"        pop hl                  ; <<< pop left side address")
    
                # pending: likely incomplete. only applied to the low 8 bits
                match node.operator:
                    case "++":  # Handle increment (++) operator
                        nodes_code.append(f"        inc (hl)                ; ({node.type}) increment")
                        
                    case "--":  # Handle decrement (--) operator
                        nodes_code.append(f"        dec (hl)                ; ({node.type}) decrement")
                        
                    case _:
                        report_error(f"{node.type}: Unsupported operator: {node.operator}")
                        return
                
                nodes_code.append("")
            #------------------------------------------------------------------ 
            case "VariableDeclaration": # contains one or more variable declarations
                #print (f"({node.type}) Node:\n {node}")
                for declaration in node.declarations:
                    variable_kind=node.kind
                    process_node(declaration)
                    
            case "VariableDeclarator": # deals with all variable and constant declarations
                #print (f"({node.type}) Node:\n {node}")
                variable_name= add_underscore_to_var(node.id.name)
                init_node = node.init
                init_type = getattr(init_node, "type", None)
                init_elements = getattr(init_node, "elements", [])
                init_arguments = getattr(init_node, "arguments", [])
                init_callee = getattr(init_node, "callee", None)
                
                variable_value = resolve_static_value(init_node)
                if variable_value is None and init_type not in ("ArrayExpression", "CallExpression", "ObjectExpression"):
                    report_error(f"{node.type}: non-literal declarations not supported.")
                                
                # constants
                if variable_kind== "const":
                    if init_type == "ArrayExpression":
                        report_error(f"{node.type}: constant arrays are not supported. Declare arrays with var/let.")
                        return
                  
                    if isinstance(variable_value, int): # constant integer
                        constant_type_list[variable_name]= "int" # not a variable, but for this type it works
                        constant_value_list[variable_name]= variable_value
                        variable_declarations.append(f"{variable_name}   equ {variable_value}                   ; ({node.type}) constant integer")
                        
                    if isinstance(variable_value, str): # constant string
                        variable_length=len(variable_value)
                        constant_type_list[variable_name]= "int" # not a variable, but for this type it works
                        constant_value_list[variable_name]= variable_value
                        variable_declarations.append(f'{variable_name}   defb {variable_length}, 0, "{variable_value}"       ; ({node.type}) constant string')
                        variable_declarations.append(f'        defs {32-2-len(variable_value)}                 ;') # -2 due to length indicator

                # variables
                else:
                # integers --------------------------------------------------------
                    if isinstance(variable_value, int):
                        # variable creation
                        if variable_name not in variable_type_list:
                            variable_type_list[variable_name]= "int"
                            variable_declarations.append(f'{variable_name}   defw {int(variable_value)}                  ; ({node.type}) variable int/bool')
                        else:
                            report_warning(f"{node.type}: {variable_name} already declared.")

                        # JavaScript var redeclarations still execute their
                        # initializer even though no new storage is created.
                        nodes_code.append(f"                                ; ({node.type}) * {variable_name} *")
                        process_node(node.id)
                        process_node(init_node)

                        nodes_code.append(f"                                ; ({node.type}) * = * (int)")
                        nodes_code.append(f"        pop de                  ; <<< pop right side value")
                        nodes_code.append(f"        pop hl                  ; <<< pop right side address, unused")
                        nodes_code.append(f"        pop hl                  ; <<< pop left side value, unused")
                        nodes_code.append(f"        pop hl                  ; <<< pop left side address")
                        nodes_code.append(f"        ld (hl), e              ; write value in destination address")
                        nodes_code.append(f"        inc hl                  ;")
                        nodes_code.append(f"        ld (hl), d              ;")
                        nodes_code.append(f"                                ; ({node.type}) end of...\n")
                    
                # strings ---------------------------------------------------------                        
                    elif isinstance(variable_value, str):
                        if variable_name not in variable_type_list:
                            string_type_list[variable_name]= "str"
                            immutable_name="im_" + variable_name
                            # replace exotic characters    
                            variable_value= basic_ascii(variable_value)
                            variable_length=len(variable_value)
                            
                            # declaration
                            
                            # empty string
                            if variable_length == 0: # if declared empty, give it a proper size
                                    variable_declarations.append(f'{immutable_name}   defb 0, 0            ; ({node.type}) empty string')
                                    variable_declarations.append(f'        defs {string_max_length}, 0xFF           ;')
                            
                            # one-char string becomes an integer
                            elif variable_length == 1:
                                variable_declarations.append(f'{immutable_name}   defb 1, 0, "{variable_value}"          ; ({node.type}) variable string, length=1')
                            
                            # regular strings
                            elif variable_length > 1:
                                    variable_declarations.append(f'{immutable_name}   defb {variable_length}, 0, "{variable_value}"       ; ({node.type}) variable string, other length')

                            # create the variable as a pointer
                            variable_declarations.append(f"{variable_name}   defw 0                  ; ({node.type}) {variable_name} is a pointer")
                            
                            # immutable strings assignment
                            nodes_code.append(f"                                ; ({node.type}) * = * string array")
                            nodes_code.append(f"        ld de, {immutable_name}         ; * {variable_name} *")
                            nodes_code.append(f"        ld hl, {variable_name}            ;")
                            nodes_code.append(f"        ld (hl), e              ; immutable address to pointer variable")
                            nodes_code.append(f"        inc hl                  ;")
                            nodes_code.append(f"        ld (hl), d              ;")
                            nodes_code.append("")
                        
                        else:
                            report_warning(f"{node.type}: {variable_name} already declared.")
                    
                # structures with integers    
                    else:
                        if init_type:            
                # arrays/matrices -------------------------------------------------
                            if init_type == "ArrayExpression":
                                matrix_name = add_underscore_to_var(node.id.name)  # Extract variable name
                                matrix_rows = len(init_elements)  # Number of rows
                                if not init_elements:
                                    report_error(f"{node.type}: empty array declarations are not supported.")
                                    return
                                
                                # pending: check matrix duplicity                        
                            
                                # Check if all elements are ArrayExpression (to confirm it's a 2D matrix)
                                if all(e.type == "ArrayExpression" for e in init_elements):
                                    # in not a constant, add it to variable list
                                    matrix_type_list[variable_name]= "int" # pending: all matrices and arrays are treated as integers.
                                        
                                    # Get the max column count across all rows
                                    matrix_cols = max(len(e.elements) for e in init_elements) if matrix_rows > 0 else 0
                                    
                                else: # arrays
                                    # in not a constant, add it to variable list
                                    array_type_list[variable_name]= "int" # pending: all matrices and arrays are treated as integers.
                                    # It's a 1D array
                                    matrix_cols = matrix_rows
                                    matrix_rows = 1
                                    
                                content_sample = first_array_static_value(init_elements)
                                
                                # integers
                                if isinstance(content_sample, int):

                                    # array/matrix declaration
                                    variable_declarations.append(f"{matrix_name}   defb {matrix_cols}, {matrix_rows}               ; ({node.type}) integer matrix (cols, rows)")
        
                                    # array/matrix assignment
                                    array_name=node.id.name
                                    nodes_code.append(f"        ld hl, {matrix_name}          ; ({node.type}) array/matrix assignment")
                                    nodes_code.append(f"        inc hl                  ; skip dimensions")
                                    nodes_code.append(f"        inc hl                  ;\n")
                                    
                                    # create array/matrix elements
                                    process_node(init_node) # creates the matrix elements
                                    nodes_code.append(f"                                ; ({node.type}) {matrix_name}, end of...\n")
                                
                                # strings
                                if isinstance(content_sample, str):
                                    array_type_list[variable_name]= "str"
                                    immutable_name="im_" + matrix_name
                                    
                                    # array/matrix declaration
                                    variable_declarations.append(f'{immutable_name}   defb {matrix_cols}, {matrix_rows}            ; ({node.type}) string matrix (cols, rows)')

                                    # create array/matrix elements
                                    process_node(init_node) # creates the matrix elements
                                    
                                    # array/matrix declaration
                                    variable_declarations.append(f'{matrix_name}   defb {matrix_cols}, {matrix_rows}               ; ({node.type}) string matrix (cols, rows)')

                                    # pointers to immutable strings, initial assignment
                                    array_element_index=0
                                    for element in init_elements:
                                        variable_declarations.append(f"        defw {immutable_name}+{2 + array_element_index*string_max_length}        ; element {array_element_index}")
                                        array_element_index+=1

                                    # immutable strings assignment
                                    nodes_code.append(f"                                ; ({node.type}) * = * string ")
                                    nodes_code.append(f"        ld hl, {matrix_name}+2          ; * {variable_name} * strings array")

                                    # pointers to immutable strings, code assignment
                                    array_element_index=0
                                    for element in init_elements:
                                        nodes_code.append(f"        ld de, {immutable_name}+{2 + array_element_index*string_max_length}      ; element {array_element_index}")
                                        nodes_code.append(f"        ld (hl), e              ;")
                                        nodes_code.append(f"        inc hl                  ;")
                                        nodes_code.append(f"        ld (hl), d              ;")
                                        nodes_code.append(f"        inc hl                  ;")

                                        array_element_index+=1
                                
                                    nodes_code.append(f"                                ; ({node.type}) {matrix_name}, end of...")
                                    nodes_code.append("")


                            # object calls
                            if init_type == "CallExpression":
                                if getattr(init_callee, "name", None):
                                    callee_type_name=init_callee.name
                                    
                # non-standard: empty string (str=String(5))----------
                                    if callee_type_name == "String":  
                                        if len(init_arguments) < 1 or getattr(init_arguments[0], "value", None) is None:
                                            report_error(f"{node.type}: String() requires a literal size.")
                                            return
                                        string_name= add_underscore_to_var(node.id.name)
                                        string_chars= init_arguments[0].value
                                        # save string in strings list
                                        string_type_list[string_name]= "str"
                                        variable_declarations.append(f"{string_name}   defb {string_chars}, 0                    ; ({node.type}) empty string")
                                        variable_declarations.append(f"        defs {string_chars}, 0x88                    ; ({node.type})")

                                    
                # non-standard: empty array and matrices (mat=Array(3,3))----------
                                    if callee_type_name == "Array":  
                                        matrix_name= add_underscore_to_var(node.id.name)
                                        #print (f"Matrix dimensions: {len(node.init.arguments)}")
                                        # pending: check matrix duplicity
                                        match len(init_arguments):
                                            case 1: # 1 dimension array
                                                if getattr(init_arguments[0], "value", None) is None:
                                                    report_error(f"{node.type}: Array() dimensions must be literal values.")
                                                    return
                                                matrix_rows = 1
                                                matrix_cols = init_arguments[0].value
                                                array_type_list[matrix_name]= "int" # pending: all matrices and arrays are treated as integers.
                                            case 2: # 2D matrix
                                                if getattr(init_arguments[0], "value", None) is None or getattr(init_arguments[1], "value", None) is None:
                                                    report_error(f"{node.type}: Array() dimensions must be literal values.")
                                                    return
                                                matrix_rows= init_arguments[0].value
                                                matrix_cols = init_arguments[1].value
                                                matrix_type_list[matrix_name]= "int" # pending: all matrices and arrays are treated as integers.
                                            case _: # higher dimensions
                                                report_error(f"{node.type}: {matrix_name}, number of dimensions not supported.")
                                        
                                        variable_declarations.append(f"{matrix_name}   defb {matrix_cols}, {matrix_rows}              ; ({node.type}) empty matrix (cols, rows)")
                                        variable_declarations.append(f"        defs {matrix_cols * matrix_rows * 2}                 ; space reserved for the array/matrix")
                                    
                # non-standard: empty dictionaries creation (dict=Map(5,2))--------      
                                    if callee_type_name == "Map": 
                                        if len(init_arguments) < 2 or getattr(init_arguments[0], "value", None) is None or getattr(init_arguments[1], "value", None) is None:
                                            report_error(f"{node.type}: Map() requires literal row and column sizes.")
                                            return
                                        map_name= add_underscore_to_var(node.id.name)
                                        map_rows= init_arguments[0].value
                                        map_cols= init_arguments[1].value
                                        
                                        variable_type_list[map_name]= "int" # pending: all matrices and arrays are treated as integers.
                                        
                                        variable_declarations.append(f"{map_name}   defb {map_cols}, {map_rows}              ; ({node.type}) map (key+values, rows)")
                                        variable_declarations.append(f"        defs {map_cols * map_rows * 2}                 ; space reserved for the array/matrix")
    
                # general object methods ------------------------------------------
                                elif getattr(getattr(init_callee, "object", None), "name", None):
                # non-standard: used for canvas creation --------------------------                             
                                        two_d_property=init_arguments[0].value
                                        if two_d_property == "2d": 
                                            #variable_name=add_underscore_to_var(node.id.name) # pending: make sure "ctx" is "ctx_"
                                            variable_name=node.id.name
                                            object_type_list[variable_name]="canvas"
                                            #variable declaration
                                            variable_declarations.append(f"{variable_name}           defw 0         ; ({node.type}) canvas")
                                            variable_declarations.append(f"{variable_name}_x         defw 128       ;")
                                            variable_declarations.append(f"{variable_name}_y         defw 96        ;")
                                            
                # dictionaries ----------------------------------------------------
                            if init_type == "ObjectExpression": # so far, only used for dictionaries
                                dictionary_name=add_underscore_to_var(node.id.name)
                                dictionary_properties = getattr(init_node, "properties", [])
                                dictionary_items=len(dictionary_properties)
                                object_type_list[dictionary_name]= "int"
                                
                                variable_declarations.append(f"{dictionary_name}   defw {dictionary_items}                  ; ({node.type}) dictionary")
                                # declare dictionary elements
                                for propert in dictionary_properties:
                                    dictionary_key=getattr(propert.key, "value", None)
                                    dictionary_value=getattr(propert.value, "value", None)
                                    if dictionary_key is None or dictionary_value is None:
                                        report_error(f"{node.type}: only literal dictionary keys and values are supported.")
                                        continue
                                    value_content_type= type(dictionary_value).__name__
                                    match value_content_type:
                                        case "int":
                                            variable_declarations.append(f"        defw {dictionary_key}, {dictionary_value}              ; ({node.type}) dictionary, integers")  
                                        case "str":
                                            if len(dictionary_value) ==1: # it's a char
                                                variable_declarations.append(f'        defw {dictionary_key}, "{dictionary_value}"              ; ({node.type}) dictionary, strings')  
                                            else: # pending: string value
                                                report_warning(f"{node.type}: dictionary string values longer than one character are ignored.")
    
            # matrix declaration ----------------------------------------------
            case "ArrayExpression":
                #print (f"({node.type}) Node:\n {node}")
                elements = getattr(node, "elements", [])
                if not elements:
                    report_error(f"{node.type}: empty arrays are not supported here.")
                    return

                first_element = elements[0]
                first_value = resolve_static_value(first_element)
                element_content_type= type(first_value).__name__ # element content type
                if element_content_type == "NoneType" and getattr(first_element, "type", None) == "ArrayExpression":
                    nested_elements = getattr(first_element, "elements", [])
                    if nested_elements:
                        element_content_type = type(first_array_static_value(nested_elements)).__name__

                # array: integer elements
                if element_content_type == "int":
                    declarations_line=("        defw ")
              
                    element_node_type = ""
                    for element in elements:
                        element_node_type=getattr(element, "type", "") # element type
                        
                        match element_node_type:
                            # leaf cases
                            case "Literal": # if it's a literal we declare it
                                node_value=element.value
                                # declaration
                                declarations_line+=(f"{node_value}, ") # add one record to the declaration line
                                
                                # assignment
                                process_node(element)
                                nodes_code.append(f"                                ; ({node.type}) literal assignment")
                                nodes_code.append(f"        pop de                  ; <<< pop value")
                                nodes_code.append(f"        pop bc                  ; <<< pop address, unused")
                                nodes_code.append(f"        ld (hl), e              ; write LSB")
                                nodes_code.append(f"        inc hl                  ;")
                                nodes_code.append(f"        ld (hl), d              ; write MSB")
                                nodes_code.append(f"        inc hl                  ;\n")
                            
                            case "UnaryExpression": # unaries come with negative numbers, "-" sign separated
                                # declaration
                                unary_element_argument = getattr(element, "argument", None)
                                unary_element_value = getattr(unary_element_argument, "value", None)
                                if element.operator == "-" and unary_element_value is not None:
                                    node_value=-unary_element_value
                                    declarations_line+=(f"{node_value}, ") # add one record to the declaration line
                                else:
                                    report_error(f"{node.type}: only literal negative values are supported in array declarations.")
                                    continue
                            
                                # assignment
                                process_node(element)
                                nodes_code.append(f"                                ; ({node.type}) unary assignment")
                                nodes_code.append(f"        pop de                  ; <<< pop value")
                                nodes_code.append(f"        pop bc                  ; <<< pop address, unused")
                                nodes_code.append(f"        ld (hl), e              ; write LSB")
                                nodes_code.append(f"        inc hl                  ;")
                                nodes_code.append(f"        ld (hl), d              ; write MSB")
                                nodes_code.append(f"        inc hl                  ;\n")                         
                                
                            case "Identifier":
                                node_value = resolve_static_value(element)
                                if isinstance(node_value, int):
                                    declarations_line+=(f"{node_value}, ")

                                    process_node(element)
                                    nodes_code.append(f"                                ; ({node.type}) constant assignment")
                                    nodes_code.append(f"        pop de                  ; <<< pop value")
                                    nodes_code.append(f"        pop bc                  ; <<< pop address, unused")
                                    nodes_code.append(f"        ld (hl), e              ; write LSB")
                                    nodes_code.append(f"        inc hl                  ;")
                                    nodes_code.append(f"        ld (hl), d              ; write MSB")
                                    nodes_code.append(f"        inc hl                  ;\n")
                                else:
                                    report_error(f"{node.type}: {element.name}, variables not allowed during declaration.")
                            
                            # branch cases    
                            case "ArrayExpression": # this is another dimension in the matrix, so recursion is needed
                                process_node(element)
                    
                    # this section adds the compiled line for integers (only!) to the declarations.            
                    if element_node_type in ("Literal", "Identifier", "UnaryExpression"): # looking at the last element to identify node type
                        declarations_line=declarations_line[:-2]+ "    ; matrix declaration" # full line, last comma removed
                        variable_declarations.append(declarations_line)
                
                # array: string elements
                if element_content_type == "str":
                    element_count=0
                    for element in elements:
                        node_value=getattr(element, "value", "")
                        
                        string_matrix_element_label = new_label("stm_")
                        
                        # declarations
                        # arrays are built on fixed record size, to simplify access to elements
                        variable_declarations.append(f'{string_matrix_element_label} defb {len(node_value)}, 0, "{node_value}"        ;')
                        variable_declarations.append(f'        defs {string_max_length-2-len(node_value)}                 ;') # -2 due to length indicator
                        
                        # assignment
                        #nodes_code.append(f"        ld hl, {string_matrix_element_label}              ; element {element_count}")
                        #nodes_code.append(f"        ld {string_matrix_element_pointer_label}, (hl)            ;")
                        
                        element_count+=1
                        
            #------------------------------------------------------------------    
            case "WhileStatement": # contains one or more variable declaration
                while_label = new_label("whi_")
                #exit_label= new_label("whx_")
                break_label_stack.append(new_label("whx_"))
                update_label_stack.append(new_label("wup_"))
                
                #print (f"({node.type}) Stack content: {break_label_stack}")
                #print (f"({node.type}) Node: {node}\n")
                
                # condition test
                if node.test:
                    nodes_code.append(f"{while_label}                         ; ({node.type}) 1. test")
                    process_node(node.test)
                    nodes_code.append(f"        pop de                  ; ({node.type}) <<< pop condition value")
                    nodes_code.append(f"        pop hl                  ; <<< pop address, unused")
                    nodes_code.append(f"        xor a                   ; A=0")
                    nodes_code.append(f"        cp e                    ; if E=0, condition not true")
                    nodes_code.append(f"        jp z, {break_label_stack[-1]}           ; exit while\n")

                # loop body
                if node.body:
                    nodes_code.append(f"                                ; ({node.type}) 2. body")
                    process_node(node.body)
                
                # node exit
                nodes_code.append(f"{update_label_stack.pop()} jp {while_label}              ; ({node.type})")                
                nodes_code.append(f"{break_label_stack.pop()}                         ; while end")
                nodes_code.append("")
            
            #------------------------------------------------------------------
            case _: # other node types
                report_error(f"({node.type}) Undefined node:\n {node}")

    nodes_code.append(function_end_tag) # added to the top of the code, in case no function is used
    nodes_code.append("")
    
    # process each top-level statement in the AST
    for statement in ast.body:
        process_node(statement)
    
    return (nodes_code, variable_declarations, include_filenames_list)


