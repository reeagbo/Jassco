from config import (
    nodes_code,
    label_count,
    include_filenames_list,
    function_declarations, variable_declarations,
    function_end_tag, function_exit_tag,
    break_label_stack, update_label, update_label_stack,
    matrix_type_list, object_type_list, variable_type_list, array_type_list, string_type_list, constant_type_list,
    constant_value_list
)
from utils import *
import config
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

def count_named_calls(node, function_name):
    if node is None:
        return 0
    if isinstance(node, (list, tuple)):
        return sum(count_named_calls(item, function_name) for item in node)

    count = 0
    if getattr(node, "type", None) == "CallExpression":
        callee = getattr(node, "callee", None)
        if getattr(callee, "name", None) == function_name:
            count += 1

    for value in vars(node).values():
        if hasattr(value, "type") or isinstance(value, (list, tuple)):
            count += count_named_calls(value, function_name)
    return count

def infer_call_argument_type(node):
    node_type = getattr(node, "type", None)
    if node_type == "Literal":
        value = getattr(node, "value", None)
        if isinstance(value, bool):
            return "int"
        if isinstance(value, int):
            return "int"
        if isinstance(value, str) and len(value) > 1:
            return "str"
        if isinstance(value, str):
            return "int"

    if node_type == "CallExpression":
        callee = getattr(node, "callee", None)
        callee_object = getattr(callee, "object", None)
        callee_property = getattr(callee, "property", None)
        if (
            getattr(callee_object, "name", None) == "String"
            and getattr(callee_property, "name", None) in ("fromCharCode", "fromcharcode")
        ):
            return "str"

    return None

def collect_function_parameter_type_hints(ast):
    hints = {}

    def remember(function_name, argument_index, argument_type):
        if not function_name or argument_type is None:
            return
        function_hints = hints.setdefault(function_name, {})
        existing_type = function_hints.get(argument_index)
        if existing_type is None:
            function_hints[argument_index] = argument_type
        elif existing_type != argument_type:
            report_warning(
                f"CallExpression: conflicting argument types for {function_name}() "
                f"parameter {argument_index + 1}; keeping {existing_type}."
            )

    def walk(node):
        if node is None:
            return
        if isinstance(node, (list, tuple)):
            for item in node:
                walk(item)
            return

        if getattr(node, "type", None) == "CallExpression":
            callee = getattr(node, "callee", None)
            function_name = getattr(callee, "name", None)
            if function_name:
                for index, argument in enumerate(getattr(node, "arguments", [])):
                    remember(function_name, index, infer_call_argument_type(argument))

        if hasattr(node, "__dict__"):
            for value in vars(node).values():
                if hasattr(value, "type") or isinstance(value, (list, tuple)):
                    walk(value)

    walk(ast)
    return hints

def validate_array_dimension(node_type, dimension, max_dimension=255, structure_name="Array dimensions"):
    if not isinstance(dimension, int) or isinstance(dimension, bool) or dimension < 1 or dimension > max_dimension:
        report_error(f"{node_type}: {structure_name} must be between 1 and {max_dimension}.")
        return False
    return True

def array_header_declaration(name, length, node_type, content_type):
    return f"{name}   defw {length}               ; ({node_type}) {content_type} array (length)"

def translate_to_assembly(js_code):
    #--------------------------------------------------------------------------         
    # Parse JavaScript using esprima
    ast = esprima.parseScript(js_code)

    current_preserved_parameters = []
    current_function_parameter_symbols = {}
    function_parameter_type_hints = collect_function_parameter_type_hints(ast)
    declaration_kind_list = {}
    statement_expression = None

    def emit_asm(opcode="", operand="", comment=None, label=""):
        line = ""
        if label:
            line += f"{label}\t"
        else:
            line += "\t"
        if opcode:
            line += opcode
        if operand:
            line += f"\t{operand}"
        if comment is not None:
            line += "\t;"
            if comment:
                line += f" {comment}"
        nodes_code.append(line)

    def restore_preserved_parameters(parameter_names):
        for parameter_name in reversed(parameter_names):
            emit_asm("ld", "hl, sta_ck2", f"restore saved parameter {parameter_name}")
            emit_asm("ld", "e, (hl)", "pick auxiliary stack pointer")
            emit_asm("inc", "hl", "")
            emit_asm("ld", "d, (hl)", "")
            emit_asm("ex", "de, hl", "HL= auxiliary stack pointer")
            emit_asm("dec", "hl", "saved parameter high byte")
            emit_asm("ld", "d, (hl)", "")
            emit_asm("dec", "hl", "saved parameter low byte")
            emit_asm("ld", "e, (hl)", "")
            emit_asm("ld", "(sta_ck2), hl", "release saved parameter")
            emit_asm("ld", f"hl, {parameter_name}", "restore caller parameter")
            emit_asm("ld", "(hl), e", "")
            emit_asm("inc", "hl", "")
            emit_asm("ld", "(hl), d", "")

    def save_function_return_address(has_preserved_parameters):
        emit_asm("ld", "hl, sta_ck2", "needed in recursion cases")
        emit_asm("ld", "e, (hl)", "address pointed in DE")
        emit_asm("inc", "hl", "")
        emit_asm("ld", "d, (hl)", "")
        emit_asm("ex", "de, hl", "de= sta_ck2, hl= stack pointer")
        emit_asm("pop", "bc", "<<< pop return address")
        emit_asm("ld", "(hl), c", "")
        emit_asm("inc", "hl", "")
        emit_asm("ld", "(hl), b", "")
        if has_preserved_parameters:
            emit_asm("ld", "hl, (sta_ck2)", "reserve return address")
            emit_asm("inc", "hl", "")
            emit_asm("inc", "hl", "")
            emit_asm("ld", "(sta_ck2), hl", "end of return address preps")
        else:
            emit_asm("ld", "hl, sta_ck2", "")
            emit_asm("inc", "(hl)", "")
            emit_asm("inc", "(hl)", "end of return address preps")
        nodes_code.append("")

    def restore_function_return_address(has_preserved_parameters, end_comment):
        emit_asm("ld", "hl, sta_ck2", "update stack2 pointer")
        emit_asm("ld", "e, (hl)", "pick stack pointer")
        emit_asm("inc", "hl", "update pointer")
        emit_asm("ld", "d, (hl)", "pick stack pointer")
        emit_asm("ex", "de, hl", "de= sta_ck2, hl= stack pointer")
        emit_asm("dec", "hl", "")
        emit_asm("ld", "b, (hl)", "get return address from stack")
        emit_asm("dec", "hl", "")
        emit_asm("ld", "c, (hl)", "")
        emit_asm("push", "bc", ">>> push return address")
        if has_preserved_parameters:
            emit_asm("ld", "(sta_ck2), hl", end_comment)
        else:
            emit_asm("ld", "hl, sta_ck2", "")
            emit_asm("dec", "(hl)", "")
            emit_asm("dec", "(hl)", end_comment)

    def scoped_parameter_name(function_raw_name, parameter_raw_name):
        return add_underscore_to_var(f"fn_{function_raw_name}_{parameter_raw_name}")

    def string_record_size():
        return config.string_max_length + 2

    def validate_string_record(node_type, value):
        if len(value) > config.string_max_length:
            report_error(
                f"{node_type}: string table entry is {len(value)} characters; "
                f"maximum is string_max_length ({config.string_max_length})."
            )
            return False
        return True

    def resolve_identifier_name(identifier_name):
        return current_function_parameter_symbols.get(
            identifier_name,
            add_underscore_to_var(identifier_name),
        )

    def process_node(node):
        nonlocal current_preserved_parameters, current_function_parameter_symbols, statement_expression
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
                    variable_name= resolve_identifier_name(left_node.name)
                elif getattr(left_object, "name", None) != None: # arrays or dictionaries have the same structure
                    object_name= resolve_identifier_name(left_object.name)
                if left_nested_object and getattr(left_nested_object, "name", None) != None: # matrices
                    matrix_name= resolve_identifier_name(left_nested_object.name)
                
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
                    return
                if (
                    getattr(node.left, "type", None) == "MemberExpression"
                    and content_type == "int"
                    and get_content_type(node.right) == "str"
                ):
                    report_error(
                        f"{node.type}: string values cannot be assigned to numeric arrays. "
                        "Declare string arrays with a literal, for example [\"\", \"hello\"]."
                    )
                    return

                right_callee = getattr(node.right, "callee", None)
                right_callee_object = getattr(right_callee, "object", None)
                right_callee_property = getattr(right_callee, "property", None)
                if (
                    variable_name in variable_type_list
                    and getattr(right_callee_object, "name", None) == "document"
                    and getattr(right_callee_property, "name", None) == "createElement"
                ):
                    nodes_code.append(f"                                ; ({node.type}) document.createElement(), ignored DOM no-op")
                    return
                 
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
                        emit_asm("pop", "bc", "<<< pop right side value")
                        emit_asm("pop", "de", "<<< pop right side address")
                        emit_asm("pop", "hl", "<<< pop left side value")
                        nodes_code.append("")
    
                        # read left node and run operation
                        match operator_name:
                            case "=":
                                emit_asm("push", "bc", ">>> push right side value")
                                emit_asm("pop", "de", "<<< pop right side value")
                    
                            case "+=":
                                emit_asm("add", "hl, bc", "HL has the result")
                                emit_asm("ex", "de, hl", "DE has the result")
                                                                    
                            case "-=":
                                emit_asm("xor", "a", "clear carry before subtraction")
                                emit_asm("sbc", "hl, bc", "HL has the result")
                                emit_asm("ex", "de, hl", "DE has the result")
                                
                            case "*=":
                                emit_asm("push", "hl", "")
                                emit_asm("push", "bc", "")
                                emit_asm("call", "mul_16b", "")
                                emit_asm("pop", "de", "DE has the result")
                            
                            case "/=":
                                emit_asm("push", "hl", "")
                                emit_asm("push", "bc", "")
                                emit_asm("call", "div_16b", f" ({node.type})")
                                emit_asm("pop", "de", "DE has the result")
                                emit_asm("pop", "hl", "remainder, not used")
                                  
                            case "%=":
                                emit_asm("push", "hl", "")
                                emit_asm("push", "bc", "")
                                emit_asm("call", "div_16b", f" ({node.type})")
                                emit_asm("pop", "hl", "result, not used")
                                emit_asm("pop", "de", "remainder, DE has the result")
                            
                            case "&=":
                                emit_asm("ld", "a, h", "MSB")
                                emit_asm("and", "b", "")
                                emit_asm("ld", "d, a", "")
                                emit_asm("ld", "a, l", "LSB")
                                emit_asm("and", "c", "")
                                emit_asm("ld", "e, a", "DE has the result")
                                
                            case "|=":
                                emit_asm("ld", "a, h", "MSB")
                                emit_asm("or", "b", "")
                                emit_asm("ld", "d, a", "")
                                emit_asm("ld", "a, l", "LSB")
                                emit_asm("or", "c", "")
                                emit_asm("ld", "e, a", "DE has the result")
                            
                            case "^=":
                                emit_asm("ld", "a, h", "MSB")
                                emit_asm("xor", "b", "")
                                emit_asm("ld", "d, a", "")
                                emit_asm("ld", "a, l", "LSB")
                                emit_asm("xor", "c", "")
                                emit_asm("ld", "e, a", "DE has the result")
                                
                            case "<<=":
                                asg_label = new_label("asg_")
                                
                                emit_asm("ld", "b, c", "number of shifts")
                                emit_asm("add", "hl, hl", "shift left", label=asg_label)
                                emit_asm("djnz", asg_label, "")
    
                                emit_asm("push", "hl", "")
                                emit_asm("pop", "de", "DE has the result")
                                
                            case ">>=":
                                asg_label = new_label("asg_")
                                emit_asm("ld", "b, c", "number of shifts")
                                emit_asm("srl", "h", "shift right 1", label=asg_label)
                                emit_asm("rr", "l", "shift right 2")
                                emit_asm("djnz", asg_label, "")
                                emit_asm("push", "hl", "")
                                emit_asm("pop", "de", "DE has the result")
                                           
                            case _:
                                report_error(f"{node.type}: {operator_name} operation not supported for integers.")
                        
                        nodes_code.append("")
                        emit_asm("pop", "hl", "<<< pop left side address")
                        emit_asm("ld", "(hl), e", "write value in destination address")
                        emit_asm("inc", "hl", "")
                        emit_asm("ld", "(hl), d", "")
                        
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
                                emit_asm("pop", "de", "pop right string address")
                                emit_asm("pop", "hl", "pop right string value, unused")
                                emit_asm("pop", "hl", "pop left variable value, unused")
                                emit_asm("pop", "hl", "pop left variable address")
                                
                                # point left variable string at right immutable string                                
                                emit_asm("ld", "(hl), e", "copy immutable address string LSB")
                                emit_asm("inc", "hl", "")
                                emit_asm("ld", "(hl), d", "copy immutable address string MSB")
                                
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
                            emit_asm("ld", f"hl, {variable_name}", "destination address")
                            emit_asm("inc", "hl", "skip dimensions")
                            emit_asm("inc", "hl", "2 bytes")
                            nodes_code.append("")

                            for element in right_elements:
                                process_node(element)

                        if getattr(node.left, "type", None)=="MemberExpression": # array [x] = y assignment type
                            nodes_code.append(f"                                ; ({node.type}) * {operator_name} * value to array assignment")
                            # get value
                            process_node(node.right)
                            # calculate array position
                            process_node(node.left)
                            # assign value to position
                            emit_asm("pop", "bc", "<<< pop right array value, unused")
                            emit_asm("pop", "hl", "<<< pop right array address")
                            emit_asm("pop", "de", "<<< pop right array value")
                            emit_asm("pop", "bc", "<<< pop right array address, unused")
                            
                            emit_asm("ld", "(hl), e", "write LSB")
                            emit_asm("inc", "hl", "next")
                            emit_asm("ld", "(hl), d", "write MSB")
                            emit_asm("inc", "hl", "next")
                            nodes_code.append("")
                                                                                
                nodes_code.append ("")
                
                if content_type =="":
                    report_error(f"{node.type}: {variable_name} not declared as a variable.")
                                
            case "BlockStatement":
                for statement in node.body:
                    process_node(statement)

            case "ExpressionStatement":
                previous_statement_expression = statement_expression
                statement_expression = node.expression
                process_node(node.expression)
                statement_expression = previous_statement_expression
                
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
                value_type = None
                if operator_name == "+" and (
                    get_content_type(node.left) == "str" or get_content_type(node.right) == "str"
                ):
                    value_type = "str"
                # plain variables
                else:
                    left_name = getattr(node.left, "name", None)
                    right_name = getattr(node.right, "name", None)
                if value_type == "str":
                    pass
                elif left_name: 
                    parameter_left_name= resolve_identifier_name(left_name)
                    if parameter_left_name in variable_type_list:
                        value_type= variable_type_list[parameter_left_name]
                    elif parameter_left_name in string_type_list:
                        value_type= string_type_list[parameter_left_name]
                    elif parameter_left_name in constant_type_list:
                        value_type= constant_type_list[parameter_left_name]
                    else:
                        value_type= "int"
                elif right_name:
                    parameter_right_name= resolve_identifier_name(right_name)
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
                        node_object_name=resolve_identifier_name(left_object_name)
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
                        emit_asm("pop", "bc", "<<< pop right side value")
                        emit_asm("pop", "de", "<<< pop right side address, not used")
                        emit_asm("pop", "hl", "<<< pop left side value")
                        
                        match operator_name:
                            # comparison operations
                            case "==" | "!=" | "<" | ">" |"<=" | ">=":
                                emit_asm("pop", "de", "<<< pop left side address, not used")
                                nodes_code.append(f"                                ; ({node.type}) operation: {operator_name}")
                                match operator_name:
                                    case "==":
                                        equ_label = new_label("equ_")
                                        emit_asm("ld", "de, 1", "assume condition=true")
                                        emit_asm("xor", "a", "")
                                        emit_asm("sbc", "hl, bc", "")
                                        emit_asm("jp", f"z, {equ_label}", "if =, true -> skip change")
                                        emit_asm("dec", "e", "condition=false")
                                        emit_asm("push", "de", ">>> push condition boolean", label=equ_label)
                                        
                                    case "!=":
                                        equ_label = new_label("neq_")
                                        emit_asm("ld", "de, 1", "assume condition=true")
                                        emit_asm("xor", "a", "")
                                        emit_asm("sbc", "hl, bc", "")
                                        emit_asm("jp", f"nz, {equ_label}", "if !=, true -> skip change")
                                        emit_asm("dec", "e", "condition=false")
                                        emit_asm("push", "de", ">>> push condition boolean", label=equ_label)
                                        
                                    case "<":
                                        equ_label = new_label("les_")
                                        signed_same_label = new_label("lss_")
                                        emit_asm("ld", "de, 0", "assume condition=false")
                                        emit_asm("ld", "a, h", "left sign")
                                        emit_asm("xor", "b", "compare signs")
                                        emit_asm("jp", f"p, {signed_same_label}", "same sign")
                                        emit_asm("bit", "7, h", "left negative?")
                                        emit_asm("jp", f"z, {equ_label}", "positive < negative is false")
                                        emit_asm("inc", "e", "negative < positive is true")
                                        emit_asm("jp", equ_label, "")
                                        emit_asm("xor", "a", "", label=signed_same_label)
                                        emit_asm("sbc", "hl, bc", "")
                                        emit_asm("jp", f"nc, {equ_label}", "if >=, false -> skip change")
                                        emit_asm("inc", "e", "condition=true")
                                        emit_asm("push", "de", ">>> push condition boolean", label=equ_label)

                                    case ">":
                                        equ_label = new_label("mor_")
                                        signed_same_label = new_label("mss_")
                                        emit_asm("ld", "de, 0", "assume condition=false")
                                        emit_asm("ld", "a, h", "left sign")
                                        emit_asm("xor", "b", "compare signs")
                                        emit_asm("jp", f"p, {signed_same_label}", "same sign")
                                        emit_asm("bit", "7, h", "left negative?")
                                        emit_asm("jp", f"nz, {equ_label}", "negative > positive is false")
                                        emit_asm("inc", "e", "positive > negative is true")
                                        emit_asm("jp", equ_label, "")
                                        emit_asm("xor", "a", "", label=signed_same_label)
                                        emit_asm("sbc", "hl, bc", "")
                                        emit_asm("jp", f"c, {equ_label}", "if <, false -> skip change")
                                        emit_asm("jp", f"z, {equ_label}", "if =, false -> skip change")
                                        emit_asm("inc", "e", "condition=true")
                                        emit_asm("push", "de", ">>> push condition boolean", label=equ_label)

                                    case ">=":
                                        equ_label = new_label("meq_")
                                        signed_same_label = new_label("ges_")
                                        emit_asm("ld", "de, 1", "assume condition=true")
                                        emit_asm("ld", "a, h", "left sign")
                                        emit_asm("xor", "b", "compare signs")
                                        emit_asm("jp", f"p, {signed_same_label}", "same sign")
                                        emit_asm("bit", "7, h", "left negative?")
                                        emit_asm("jp", f"z, {equ_label}", "positive >= negative is true")
                                        emit_asm("dec", "e", "negative >= positive is false")
                                        emit_asm("jp", equ_label, "")
                                        emit_asm("xor", "a", "", label=signed_same_label)
                                        emit_asm("sbc", "hl, bc", "")
                                        emit_asm("jp", f"nc, {equ_label}", "if >=, true -> skip change")
                                        emit_asm("dec", "e", "condition=false")
                                        emit_asm("push", "de", ">>> push condition boolean", label=equ_label)

                                    case "<=":
                                        equ_label = new_label("leq_")
                                        signed_same_label = new_label("les_")
                                        emit_asm("ld", "de, 1", "assume condition=true")
                                        emit_asm("ld", "a, h", "left sign")
                                        emit_asm("xor", "b", "compare signs")
                                        emit_asm("jp", f"p, {signed_same_label}", "same sign")
                                        emit_asm("bit", "7, h", "left negative?")
                                        emit_asm("jp", f"nz, {equ_label}", "negative <= positive is true")
                                        emit_asm("dec", "e", "positive <= negative is false")
                                        emit_asm("jp", equ_label, "")
                                        emit_asm("xor", "a", "", label=signed_same_label)
                                        emit_asm("xor", "a", "")
                                        emit_asm("sbc", "hl, bc", "")
                                        emit_asm("jp", f"c, {equ_label}", "if <, true -> skip change")
                                        emit_asm("jp", f"z, {equ_label}", "if =, true -> skip change")
                                        emit_asm("dec", "e", "condition=false")
                                        emit_asm("push", "de", ">>> push condition boolean", label=equ_label)
                                
                                # align to 2 values pushed
                                emit_asm("push", "de", ">>> push bogus value, unused")
                                        
                            # arithmetical operations
                            case "+" | "-" | "*" | "/" | "%":
                                emit_asm("pop", "de", "<<< pop left side address, not used")
                                nodes_code.append("")
                                match operator_name:
                                    case "+":
                                        emit_asm("add", "hl, bc", f"({node.type}) 16-bit addition")
                                        
                                    case "-":
                                        emit_asm("xor", "a", "")
                                        emit_asm("sbc", "hl, bc", f"({node.type}) 16-bit subtraction")
                                        
                                    case "*":
                                        emit_asm("push", "hl", ">>> operand left")
                                        emit_asm("push", "bc", ">>> operand right")
                                        emit_asm("call", "mul_16b", f"({node.type}) 16-bit multiplication")
                                        emit_asm("pop", "hl", "<<< pop result")
                                        
                                    case "/":
                                        emit_asm("push", "hl", ">>> operand left")
                                        emit_asm("push", "bc", ">>> operand right")
                                        emit_asm("call", "div_16b", f"({node.type}) 16-bit division")
                                        emit_asm("pop", "hl", "<<< pop result")
                                        emit_asm("pop", "de", "<<< pop remainder, not used")
                                        
                                    case "%":
                                        emit_asm("push", "hl", ">>> operand left")
                                        emit_asm("push", "bc", ">>> operand right")
                                        emit_asm("call", "div_16b", f"({node.type}) 16-bit division")
                                        emit_asm("pop", "de", "<<< pop result, not used")
                                        emit_asm("pop", "hl", "<<< pop remainder")
                            
                                # common code                               
                                emit_asm("push", "hl", ">>> bogus record address, unused")
                                emit_asm("push", "hl", ">>> record value")
                                 
                            # logical operations
                            case "&" | "|" | "^":
                                emit_asm("pop", "de", "<<< pop left side address, not used")
                                nodes_code.append("")
                                match operator_name:
                                    case "&":
                                        emit_asm("ld", "a, h", "MSB")
                                        emit_asm("and", "b", "")
                                        emit_asm("ld", "d, a", "")
                                        emit_asm("ld", "a, l", "LSB")
                                        emit_asm("and", "c", "")
                                        emit_asm("ld", "e, a", "")
                                        
                                    case "|":
                                        emit_asm("ld", "a, h", "MSB")
                                        emit_asm("or", "b", "")
                                        emit_asm("ld", "d, a", "")
                                        emit_asm("ld", "a, l", "LSB")
                                        emit_asm("or", "c", "")
                                        emit_asm("ld", "e, a", "")
                                        
                                    case "^":
                                        emit_asm("ld", "a, h", "MSB")
                                        emit_asm("xor", "b", "")
                                        emit_asm("ld", "d, a", "")
                                        emit_asm("ld", "a, l", "LSB")
                                        emit_asm("xor", "c", "")
                                        emit_asm("ld", "e, a", "")
                                           
                                # common code                               
                                emit_asm("push", "de", ">>> bogus record address, unused")
                                emit_asm("push", "de", ">>> record value")
                            
                            # bitwise operations
                            case "<<" | ">>" | ">>>":
                                emit_asm("pop", "de", "<<< pop left side address, not used")
                                nodes_code.append("")
                                match operator_name:
                                    case "<<":
                                        bsh_label = new_label("bsh_")
                                    
                                        emit_asm("ld", "b, c", "number of shifts")
                                        emit_asm("add", "hl, hl", "shift left", label=bsh_label)
                                        emit_asm("djnz", bsh_label, "")
    
                                    case ">>": # pending: missing 
                                        bsh_label = new_label("bsh_")
                                        
                                        emit_asm("ld", "b, c", "number of shifts")
                                        emit_asm("sra", "h", "shift right 1", label=bsh_label)
                                        emit_asm("rr", "l", "shift right 2")
                                        emit_asm("djnz", bsh_label, "")

                                    case ">>>":
                                        bsh_label = new_label("bsh_")
                                        
                                        emit_asm("ld", "b, c", "number of shifts")
                                        emit_asm("srl", "h", "shift right 1", label=bsh_label)
                                        emit_asm("rr", "l", "shift right 2")
                                        emit_asm("djnz", bsh_label, "")
                                
                                # common code                               
                                emit_asm("push", "hl", ">>> bogus record address, unused")
                                emit_asm("push", "hl", ">>> record value")
                            
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
                                emit_asm("pop", "de", "pop right string length")
                                emit_asm("pop", "bc", "pop right string address")
                                emit_asm("pop", "hl", "pop left variable length, unused")
                                emit_asm("pop", "bc", "pop left variable address")
                                emit_asm("ld", "b, (hl)", "prepare countdown")
                                emit_asm("inc", "b", "include length in byte count")
                                emit_asm("inc", "b", "")
                                nodes_code.append("")

                                emit_asm("ld", "c, 0", "C=0, assume the strings are different")
                                emit_asm("ld", "a, (de)", f"({node.type}) {operator_name} string", label=compare_label)
                                emit_asm("sub", "(hl)", "")
                                emit_asm("jr", f"nz, {compare_exit_label}", "if one character is different, exit")
                                emit_asm("inc", "de", "next character")
                                emit_asm("inc", "hl", "next character")
                                emit_asm("djnz", compare_label, "countdown until B=0")
                                nodes_code.append("")
                                emit_asm("inc", "c", " ")
                                emit_asm("push", "bc", ">>> bogus record address, unused", label=compare_exit_label)
                                emit_asm("push", "bc", ">>> comparison result")
                                nodes_code.append("")
                            
                            case "+":
                                report_error(f"{node.type}: string concatenation with + is not supported. Print strings separately or use console.log() arguments.")
                                 
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
                     
                    # __jassco_include(): internal call generated from comment directives
                    case "__jassco_include":
                        if len(node.arguments) < 1:
                            report_error(f"{node.type}: JASSCO include directive requires a filename.")
                            return
                        filename = getattr(node.arguments[0], "value", None)
                        if filename is None:
                            report_error(f"{node.type}: JASSCO include directive requires a literal filename.")
                            return
                        include_filenames_list.append(filename)

                    # include(): old public tag intentionally removed
                    case "include":
                        report_error(
                            f'{node.type}: include() is not valid JavaScript. Use // jassco: include("file.asc").'
                        )
                        return
                         
                    # read(): read keyboard
                    case "read":
                        if node is not statement_expression:
                            report_error(f"{node.type}: read() is a statement and cannot be used as a value.")
                            return
                        if len(node.arguments) > 1:
                            report_error(f"{node.type}: read() accepts zero or one destination variable.")
                            return
                        if len(node.arguments) == 0:
                            emit_asm("call", "rea_pau", f"({node.type}) wait for a key")
                            return
                        # process argument
                        read_argument_name = getattr(node.arguments[0], "name", None)
                        if not read_argument_name:
                            report_error(f"{node.type}: read() destination must be a variable.")
                            return
                        variable_name = resolve_identifier_name(read_argument_name)
                        if variable_name in string_type_list:
                            variable_type = string_type_list[variable_name]
                        elif variable_name in variable_type_list:
                            variable_type = variable_type_list[variable_name]
                            
                            match variable_type:
                                case "int":
                                    # assembly code
                                    # Keep the existing integer-input path unchanged for compatibility.
                                    garbage_address=get_garbage_address(2)
                                    nodes_code.append(f"                                ; ({node.type}) read integer")
                                    emit_asm("ld", f"hl, {garbage_address}", "garbage zone")
                                    emit_asm("push", "hl", "push garbage zone address")
                                    emit_asm("call", "rea_kbd", "read integer")
                                    nodes_code.append("")
                                    emit_asm("call", "str2int", f"({node.type}) string to integer")
                                    nodes_code.append(f"                                ; save value to variable")                    
                                    emit_asm("pop", "hl", "pop decimal value")
                                    emit_asm("ld", f"({variable_name}), hl", " ")
                                    
                                case "str":
                                    # variable processing
                                    process_node(node.arguments[0]) # needed to create the variable
                                    # assembly code
                                    emit_asm("call", "rea_kbd", f"({node.type}) read string")
                                    nodes_code.append("")
                                    
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
                        emit_asm("call", "set_int", "calls the interruptions routine")
               
                    # clearInterval(): stop timer
                    case "clearinterval":
                        # configure 
                        #nodes_code.append(f"        di                      ; stops the interruptions routine")
                        emit_asm("ld", "hl, interrupt_activation", "interrupts state")
                        emit_asm("ld", "(hl), 0", "active now")
                    
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
                            emit_asm("call", function_name, f"({node.type}): call ***{function_name}***")
                                                    
                # Objects -----------------------------------------------------   

                object_name = getattr(callee_object, "name", None)
                property_name = getattr(callee_property, "name", None)
                        
                #print (f" variable list: {variable_type_list}")
                #print (f" array list: {array_type_list}")
                #print (f" object list: {object_type_list}")
                #print (f" matrix list: {matrix_type_list}")
                #print (f" string list: {string_type_list}")
                        
                if (
                    getattr(callee_object, "type", None) == "MemberExpression"
                    and getattr(getattr(callee_object, "object", None), "name", None) == "document"
                    and getattr(getattr(callee_object, "property", None), "name", None) == "body"
                    and property_name in ("appendChild", "appendchild")
                ):
                    nodes_code.append(f"                                ; ({node.type}) document.body.appendChild(), ignored DOM no-op")

                elif object_name:
                    if object_name == "document" and property_name in ("createElement", "createelement"):
                        nodes_code.append(f"                                ; ({node.type}) document.createElement(), ignored DOM no-op")

                    elif object_name == "document" and property_name in ("getElementById", "getelementbyid"):
                        nodes_code.append(f"                                ; ({node.type}) document.getElementById(), ignored DOM no-op")

                    # string objects methods ----------------------------------
                    elif add_underscore_to_var(object_name) in string_type_list:
                        # get string and index in the stack
                        process_node (callee_object)
                        process_node (node.arguments[0])
                                    
                        nodes_code.append(f"                                ; ({node.type}) String *** {property_name} ***")           
                                
                        string_name=add_underscore_to_var(callee_object.name)
                        match property_name:
                            case "charAt" | "charat":
                                char_address = get_garbage_address(3)
                                emit_asm("pop", "de", "<<< pop index value")
                                emit_asm("pop", "hl", "<<< pop index address, unused")
                                emit_asm("pop", "hl", "<<< pop string content pointer")
                                emit_asm("pop", "bc", "<<< pop string variable address, unused")
                                emit_asm("inc", "hl", "skip length")
                                emit_asm("inc", "hl", "")
                                emit_asm("add", "hl, de", "string character address")
                                emit_asm("ld", "a, (hl)", "character")
                                emit_asm("ld", f"hl, {char_address}", "one-character string buffer")
                                emit_asm("ld", "(hl), 1", "string length LSB")
                                emit_asm("inc", "hl", "")
                                emit_asm("ld", "(hl), 0", "string length MSB")
                                emit_asm("inc", "hl", "")
                                emit_asm("ld", "(hl), a", "string character")
                                emit_asm("ld", f"de, {char_address}", "string content pointer")
                                emit_asm("push", "de", ">>> bogus string variable address")
                                emit_asm("push", "de", ">>> string content pointer")

                            case "charCodeAt" | "charcodeat":
                                emit_asm("pop", "de", "<<< pop index value")
                                emit_asm("pop", "hl", "<<< pop index address, unused")
                                emit_asm("pop", "hl", "<<< pop string content pointer")
                                emit_asm("pop", "bc", "<<< pop string variable address, unused")
                                nodes_code.append("")
                                        
                                nodes_code.append(f"                                ; get char and put it garbage zone") 
                                emit_asm("inc", "hl", "skip length")
                                emit_asm("inc", "hl", "")
                                emit_asm("add", "hl, de", "string record")
                                emit_asm("ld", "d, 0", "get char")
                                emit_asm("ld", "e, (hl)", "get char")
                                
                                emit_asm("push", "de", ">>> bogus record address, unused")
                                emit_asm("push", "de", ">>> record value")
                    
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
                                emit_asm("pop", "hl", "<<< pop array content, unused")
                                emit_asm("pop", "hl", "<<< pop array address")
                                nodes_code.append("")
                                
                                emit_asm("ld", "b, (hl)", "prepare counter")
                                emit_asm("inc", "hl", "skip header")
                                emit_asm("inc", "hl", "skip header")
                                emit_asm("ld", f"(hl), {fill_value_lsb}", "fill value LSB", label=fill_loop_label)
                                emit_asm("inc", "hl", "next byte")
                                emit_asm("ld", f"(hl), {fill_value_msb}", "fill value MSB")
                                emit_asm("inc", "hl", "next element")
                                emit_asm("djnz", fill_loop_label, "loop ")
                                
                                   
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
                                                emit_asm("call", "prt_num", f"({node.type}) print literal number")
                                                nodes_code.append("")
                                            # string    
                                            case "str":
                                                argument_value = getattr(argument, "value", None)
                                                if argument_value and len(argument_value)==1:
                                                    emit_asm("call", "prt_chr", f"({node.type}) print literal char")
                                                    nodes_code.append("")
                                                else:
                                                    emit_asm("call", "prt_str", f"({node.type}) print literal string")
                                                    nodes_code.append("")
                                            case _:
                                                report_error(f"{node.type}: Console.log, content type not supported.")
                                    # add new line after all arguments
                                    emit_asm("ld", "a, 0x0d", f"({node.type}) <cr> after prints")
                                    emit_asm("rst", "16", "")
                                    nodes_code.append ("")                           
    
                            # print string
                            case "logstring":
                                if node.arguments:
                                    for argument in node.arguments: # for every parameter in the call
                                        process_node(argument)
                                        emit_asm("call", "prt_str", f"({node.type}) print string")
                                        nodes_code.append ("") 
     
                            # print numbers
                            case "lognumber":
                                if node.arguments:
                                    for argument in node.arguments: # for every parameter in the call
                                        process_node(argument)
                                        emit_asm("call", "prt_num", f"({node.type}) print number")
                                        nodes_code.append ("")   
                          
                            # print single chars   
                            case"logchar":
                                if node.arguments:
                                    for argument in node.arguments: # for every parameter in the call
                                        process_node(argument)
                                        emit_asm("call", "prt_chr", f"({node.type}) print char")
                                        nodes_code.append ("")   
                                                   
                            case "clear":
                                    emit_asm("call", "cls_rom", f"({node.type}) clear screen")
                            case _:
                                    report_error(f"{node.type}: {object_name}, {property_name} property not supported.")  
                                                                       
                    # special case: console.log() call to print text
                    elif object_name in ("Memory", "memory"):
                        memory_method = property_name.lower() if isinstance(property_name, str) else ""
                        match memory_method:
                            case "read":
                                if len(node.arguments) != 1:
                                    report_error(f"{node.type}: memory.read() requires exactly one address.")
                                    return
                                for argument in node.arguments:
                                    process_node(argument)
                                emit_asm("call", "mem_rea", f"({node.type}) print string")
                                nodes_code.append ("")

                            case "write":
                                if len(node.arguments) != 2:
                                    report_error(f"{node.type}: memory.write() requires exactly an address and a value.")
                                    return
                                for argument in node.arguments:
                                    process_node(argument)
                                emit_asm("call", "mem_wri", f"({node.type}) print string")
                                nodes_code.append ("")

                            case "copy" | "move":
                                if len(node.arguments) != 3:
                                    report_error(f"{node.type}: memory.{memory_method}() requires exactly source, target, and size.")
                                    return
                                for argument in node.arguments:
                                    process_node(argument)
                                emit_asm("call", "mem_cop", f"({node.type}) copy memory block")
                                nodes_code.append ("")

                            case _:
                                report_error(f"{node.type}: {object_name}.{property_name} method not supported.")
                     
                    elif object_name in ("Math", "math"):
                        match property_name:
                            case "random":
                                garbage_address=get_garbage_address(2)
                                emit_asm("call", "rnd_16b", f"({node.type}) get 16-bit random number")
                            case _:
                                report_error(f"{node.type}: {object_name}.{property_name} method not supported.")

                    elif object_name == "String":
                        match property_name:
                            case "fromCharCode" | "fromcharcode":
                                if len(node.arguments) != 1:
                                    report_error(f"{node.type}: String.fromCharCode() requires exactly one character code.")
                                    return
                                process_node(node.arguments[0])
                                process_node(callee)
                            case _:
                                report_error(f"{node.type}: String.{property_name} method not supported.")
                             
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
                            emit_asm("ld", f"hl, {keypressed_event_name}_activation", f"({node.type}) {event_name} activate feature")
                            emit_asm("ld", "(hl), 1", "A=0")
                            nodes_code.append(f"rea_key                         ; ({node.type}) read key from keyboard")
                            emit_asm("ld", "hl, 0x5C08", "LASTKEY system variable")
                            emit_asm("xor", "a", "A=0")
                            emit_asm("ld", "(hl), a", "reset LASTKEY")
                            emit_asm("add", "a, (hl)", "load latest value of LASTKEY.", label="key_loo")
                            emit_asm("jr", "z, key_loo", "loop until a key is pressed")
                            emit_asm("ld", "e, a", "")
                            emit_asm("ld", "d, 0", "")
                            emit_asm("push", "de", "push key address (dummy), unused")
                            emit_asm("push", "de", "push key value")
                            emit_asm("call", keypressed_function, "if key pressed")
                            emit_asm("ld", f"hl, {keypressed_event_name}_activation", "")
                            emit_asm("ld", "a, (hl)", "get LSB")
                            emit_asm("or", "a", "check activation bit")
                            emit_asm("jr", "nz, rea_key", "loop while eventListener is active")
                            emit_asm("ret", "", "")
                            nodes_code.append("")
    
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
                            emit_asm("ld", f"hl, {keypressed_event_name}_activation", f"({node.type}) {event_name} deactivate feature")
                            emit_asm("ld", "(hl), 0", "A=0")
                            nodes_code.append("")
                            nodes_code.append("")
                                
                        else:
                            report_error(f"{node.type}: {property_name}, {event_name} not supported.")
                                      
                    # special case: canvas methods
                    elif (object_name in object_type_list):
                        if (object_type_list[object_name]=="canvas"):
                            match property_name:
                                case "beginPath" | "beginpath" | "closePath" | "closepath" | "stroke":
                                    nodes_code.append(f"                                ; ({node.type}) {property_name}, ignored canvas no-op")

                                case "fill":
                                    report_error(f"{node.type}: canvas fill() is not supported.")

                                case "moveTo" | "moveto":
                                    if len(node.arguments) != 2:
                                        report_error(f"{node.type}: canvas moveTo() requires x and y arguments.")
                                        return
                                    for arg in node.arguments:
                                        process_node(arg)
                                                
                                    nodes_code.append(f"                                ; ({node.type}) {property_name}, move current point")
                                    emit_asm("pop", "bc", "get y-coord value")
                                    emit_asm("pop", "hl", "get y-coord address, unused")
                                    emit_asm("pop", "de", "get x-coord value")
                                    emit_asm("pop", "hl", "get x-coord address, unused")
                                    
                                    # save value in canvas
                                    emit_asm("ld", f"hl, {object_name}_x", "save values in canvas object")
                                    emit_asm("ld", "(hl), e", "")
                                    emit_asm("ld", f"hl, {object_name}_y", "")
                                    emit_asm("ld", "(hl), c", "")
                                     
                                case "lineTo" | "lineto":
                                    if len(node.arguments) != 2:
                                        report_error(f"{node.type}: canvas lineTo() requires x and y arguments.")
                                        return
                                    for arg in node.arguments:
                                        process_node(arg)
                                    nodes_code.append(f"                                ; ({node.type}) {property_name}, draw a line")
                                    
                                    # 2) origin is in the object, to be loaded in DE
                                    emit_asm("ld", f"hl, {object_name}_x", "")
                                    emit_asm("ld", "d, (hl)", "")
                                    emit_asm("ld", f"hl, {object_name}_y", "")
                                    emit_asm("ld", "e, (hl)", "")
                                    
                                    # 2) target is in the stack, to be loaded in HL
                                    emit_asm("pop", "bc", "get y-coord value")
                                    emit_asm("pop", "hl", "get y-coord address, unused")
                                    # save new origin y in canvas
                                    emit_asm("ld", f"hl, {object_name}_y", "save new y")
                                    emit_asm("ld", "(hl), c", "")
                                    emit_asm("ld", "a, c", "save target y-coord, later use")
    
                                    emit_asm("pop", "bc", "get x-coord value")
                                    emit_asm("pop", "hl", "get x-coord address, unused")
                                    # save new origin x in canvas
                                    emit_asm("ld", f"hl, {object_name}_x", "save new x")
                                    emit_asm("ld", "(hl), c", "")
                                    
                                    # prepare registers before call
                                    # from de = end1 (d = x-axis, e = y-axis)
                                    # to   hl = end2 (h = x-axis, l = y-axis)
                                    emit_asm("ld", "h, c", "HL has to contain target (x,y)")
                                    emit_asm("ld", "l, a", "")
                                    
                                    emit_asm("call", "dra_lin", f"({node.type}) call function {object_name}")
                    
                                case "clearScreen" | "clearscreen":
                                    emit_asm("call", "cle_scr", f"({node.type}) clear screen")

                                case "clearRect" | "clearrect":
                                    if len(node.arguments) != 4:
                                        report_error(f"{node.type}: canvas clearRect() requires x, y, width and height arguments.")
                                        return

                                    def process_clear_rect_arg(arg):
                                        arg_object = getattr(arg, "object", None)
                                        arg_property = getattr(arg, "property", None)
                                        arg_property_name = getattr(arg_property, "name", None)
                                        if (
                                            getattr(arg, "type", None) == "MemberExpression"
                                            and arg_property_name in ("width", "height")
                                        ):
                                            literal_value = 256 if arg_property_name == "width" else 192
                                            emit_asm("ld", f"de, {literal_value}", f"({arg.type}) canvas.{arg_property_name}")
                                            emit_asm("push", "de", ">>> push bogus address, unused")
                                            emit_asm("push", "de", ">>> push value")
                                            return
                                        process_node(arg)

                                    for arg in node.arguments:
                                        process_clear_rect_arg(arg)

                                    nodes_code.append(f"                                ; ({node.type}) {property_name}, clear rectangle")
                                    emit_asm("pop", "bc", "get height value")
                                    emit_asm("pop", "hl", "get height address, unused")
                                    emit_asm("ld", "a, c", "")
                                    emit_asm("ld", "(clr_h), a", "")
                                    emit_asm("pop", "bc", "get width value")
                                    emit_asm("pop", "hl", "get width address, unused")
                                    emit_asm("ld", "a, c", "")
                                    emit_asm("ld", "(clr_w), a", "")
                                    emit_asm("pop", "bc", "get y-coord value")
                                    emit_asm("pop", "hl", "get y-coord address, unused")
                                    emit_asm("ld", "a, c", "")
                                    emit_asm("ld", "(clr_y), a", "")
                                    emit_asm("pop", "bc", "get x-coord value")
                                    emit_asm("pop", "hl", "get x-coord address, unused")
                                    emit_asm("ld", "a, c", "")
                                    emit_asm("ld", "(clr_x), a", "")
                                    emit_asm("call", "cle_rec", f"({node.type}) call function {object_name}")

                                case _:
                                    report_error(f"{node.type}: canvas method {property_name}() is not supported.")
                    else:
                        report_error(f"{node.type}: '{object_name}' object not supported.")
                
                nodes_code.append ("")

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
                
                emit_asm("pop", "de", f"({node.type}) <<< pop condition value")
                emit_asm("pop", "hl", "<<< pop address, unused")
                emit_asm("xor", "a", "A=0")
                emit_asm("cp", "e", "if E=0, condition not fulfiled")
                emit_asm("jr", f"z, {conditional_alternate_label}", "")
                
                # depending on the result: if true -> consequent, if false -> alternate
                nodes_code.append(f"                                ; ({node.type}) 2. consequent")
                process_node(node.consequent)
                emit_asm("jr", conditional_exit_label, "")
                
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
                    emit_asm("pop", "de", f"({node.type}) <<< pop condition value")
                    emit_asm("pop", "hl", "<<< pop address, unused")
                    emit_asm("xor", "a", "A=0")
                    emit_asm("cp", "e", "if E=0, condition not fulfiled")
                    emit_asm("jp", f"z, {break_label_stack[-1]}", "")
                        
                emit_asm("jp", do_while_label, "")
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
                    emit_asm("pop", "de", f"({node.type}) <<< pop condition value")
                    emit_asm("pop", "hl", "<<< pop address, unused")
                    emit_asm("xor", "a", "A=0")
                    emit_asm("cp", "e", "if E=0, condition not fulfiled")
                    emit_asm("jp", f"z, {break_label_stack[-1]}", "")
                        
                    nodes_code.append("")
                if node.body:
                    nodes_code.append(f"                                ; ({node.type}) 3. body -------------")
                    process_node(node.body)
                        
                if node.update:
                    nodes_code.append(f"{update_label_stack.pop()}                         ; ({node.type}) 4. update ---------")
                    process_node(node.update)
            
                emit_asm("jp", for_label)
            
                # Safely pop the exit label and use it
                nodes_code.append(f"{break_label_stack.pop()}                         ; ({node.type}) end of...")
                nodes_code.append("")

            #------------------------------------------------------------------
            case "ContinueStatement":
                #print (f"({node.type}) Node:\n {node}")
                if not update_label_stack:
                    report_error(f"{node.type}: continue used outside a loop.")
                    return
                emit_asm("jp", update_label_stack[-1], f"({node.type})")
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
                previous_preserved_parameters = current_preserved_parameters
                previous_function_parameter_symbols = current_function_parameter_symbols
                current_function_parameter_symbols = {}
                seen_parameter_names = set()
                for param in node.params:
                    parameter_raw_name = getattr(param, "name", None)
                    if not parameter_raw_name:
                        continue
                    if parameter_raw_name in seen_parameter_names:
                        report_error(f"{node.type}: duplicated parameter {parameter_raw_name} in {function_name}.")
                        continue
                    seen_parameter_names.add(parameter_raw_name)
                    current_function_parameter_symbols[parameter_raw_name] = scoped_parameter_name(
                        function_raw_name,
                        parameter_raw_name,
                    )
                current_preserved_parameters = [
                    current_function_parameter_symbols[param.name]
                    for param in node.params
                    if getattr(param, "name", None) and param.name in current_function_parameter_symbols
                ]

                if function_name not in function_declarations:
                    function_declarations.append(function_name)
                                
                # 1) 'id' section
                nodes_code.append(f"; ({node.type}) Function: {function_name}")
                nodes_code.append(f"{function_name}                        ; ({node.type}) *** {function_name} ***")

                # 2) return address
                nodes_code.append(f"                                ; save return address")
                save_function_return_address(bool(current_preserved_parameters))
              
                # 3.2) collect arguments   
                nodes_code.append(f"                                ; ({node.type}) collect arguments")
                #for param in reversed(node.params): # Handle parameters (if any) for the function
                for parameter_index, param in enumerate(node.params):
                    parameter_raw_name = getattr(param, "name", None)
                    if not parameter_raw_name:
                        report_error(f"{node.type}: only named parameters are supported.")
                        continue
                    parameter_name = current_function_parameter_symbols.get(parameter_raw_name)
                    if not parameter_name:
                        continue
                    parameter_type = function_parameter_type_hints.get(function_raw_name, {}).get(parameter_index, "int")
                    if parameter_name not in variable_type_list and parameter_name not in string_type_list:
                        if parameter_type == "str":
                            string_type_list[parameter_name] = "str"
                            variable_declarations.append(f'{parameter_name}   defw 0                ; ({node.type}) string parameter pointer')
                        else:
                            variable_type_list[parameter_name] = "int"
                            variable_declarations.append(f'{parameter_name}   defw 0                ; ({node.type}) int/bool parameter')
                        if parameter_name in current_preserved_parameters:
                            emit_asm("ld", "hl, sta_ck2", f"save caller parameter {parameter_name}")
                            emit_asm("ld", "e, (hl)", "pick auxiliary stack pointer")
                            emit_asm("inc", "hl", "")
                            emit_asm("ld", "d, (hl)", "")
                            emit_asm("ex", "de, hl", "HL= auxiliary stack pointer")
                            emit_asm("ld", f"de, ({parameter_name})", "caller parameter value")
                            emit_asm("ld", "(hl), e", "")
                            emit_asm("inc", "hl", "")
                            emit_asm("ld", "(hl), d", "")
                            emit_asm("ld", "hl, (sta_ck2)", "reserve saved parameter")
                            emit_asm("inc", "hl", "")
                            emit_asm("inc", "hl", "")
                            emit_asm("ld", "(sta_ck2), hl", "")
                        # assembly code: load variable with values in stack in reverse order
                        emit_asm("ld", f"hl, {parameter_name}", f"argument *** {parameter_name} ***")
                        emit_asm("pop", "de", "<<< pop address")
                        emit_asm("pop", "bc", "<<< pop value")
                        # stack frame! when using the argument reversed copy
                        emit_asm("ld", "(hl), e", "store it in memory")
                        emit_asm("inc", "hl", "")
                        emit_asm("ld", "(hl), d", "")
                        nodes_code.append("")

                    else:
                        report_error(f"{node.type}: duplicated {parameter_name}")
                                    
                # 4) 'body' section (actually, body.body)
                nodes_code.append(f"                                ; ({node.type}) function body")
                process_node(node.body)

                # 5) return address
                function_stack_tag=new_label("fst_")
                nodes_code.append(f"{function_stack_tag}                         ; ({node.type}) recover return address (general)")
                restore_preserved_parameters(current_preserved_parameters)
                restore_function_return_address(
                    bool(current_preserved_parameters),
                    "end of return address restore",
                )
                
                # 6) exit
                nodes_code.append(f"{function_exit_tag} ret                     ; ({node.type}) end of...\n")
                nodes_code.append(f"{function_end_tag}")
                current_preserved_parameters = previous_preserved_parameters
                current_function_parameter_symbols = previous_function_parameter_symbols
             
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

                restore_preserved_parameters(current_preserved_parameters)
                restore_function_return_address(
                    bool(current_preserved_parameters),
                    "release return address" if current_preserved_parameters else "",
                )
                emit_asm("ret", "", "return from function")
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
                emit_asm("pop", "de", f"({node.type}) <<< pop condition value")
                emit_asm("pop", "hl", "<<< pop address, unused")
                emit_asm("xor", "a", "A=0")
                emit_asm("cp", "e", "if E=0, condition not fulfiled")
                emit_asm("jp", f"z, {else_label}", "")
                                                    
                # if
                process_node(node.consequent)
                emit_asm("jp", end_label, f"({node.type}) ***{expression}*** skips else")
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
                    emit_asm("ld", f"de, {literal_value}", f"({node.type}) literal int: * {literal_value} *")
                    emit_asm("push", "de", ">>> push bogus address, unused")
                    emit_asm("push", "de", ">>> push value")
                                                    
                # string literals
                if isinstance(node.value, str):
                    literal_value= basic_ascii(literal_value) # remove exotic characters
                    literal_length = len(literal_value)
                    literal_name = new_label("stn_")  # Generate a unique label
                    
                    # one-char literal becomes an integer...
                    if literal_length == 1:
                        ascii_value = ord(literal_value)  # Convert character to ASCII
                        emit_asm("ld", f'de, "{literal_value}"', f'({node.type}) literal char: * "{literal_value}" * (ascii: {ascii_value}d)')
                        emit_asm("push", "de", ">>> push bogus address, unused")
                        emit_asm("push", "de", ">>> push value")
                    
                    # regular strings
                    else:
                        # literal declaration
                        variable_declarations.append(f'{literal_name} defb {literal_length}, 0, "{literal_value}"        ; ({node.type}) string')
                        # assembly code
                        nodes_code.append(f"                                ; ({node.type}) * '{literal_value}' *")
                        emit_asm("ld", f"hl, {literal_name}", "literal string address")
                        emit_asm("ld", f"de, {len(literal_value)}", "string length")
                        emit_asm("push", "de", ">>> push dummy content")
                        emit_asm("push", "hl", ">>> push literal address")
                        
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
                        emit_asm("pop", "hl", "<<< pop left evaluation")
                        emit_asm("pop", "de", "<<< pop left address, unused")
                        emit_asm("pop", "bc", "<<< pop right evaluation")
                        emit_asm("pop", "de", "<<< pop right address, unused")
                        
                        emit_asm("ld", "de, 0", f"({node.type}) assume condition is false")
                        emit_asm("ld", "a, h", "test 16-bit register = 0")
                        emit_asm("or", "l", "")
                        emit_asm("jr", f"z, {lex_exit_label}", "MSB not fulfiling")
                        emit_asm("ld", "a, b", "test 16-bit register = 0")
                        emit_asm("or", "c", "")
                        emit_asm("jr", f"z, {lex_exit_label}", "LSB not fulfiling")
                        
                        emit_asm("inc", "de", "condition is true")
                        emit_asm("push", "de", ">>> push result", label=lex_exit_label)
                        emit_asm("push", "de", ">>> push result")
                        nodes_code.append("")
                        nodes_code.append("")

                    case "||":
                        emit_asm("pop", "hl", "<<< pop left value")
                        emit_asm("pop", "de", "<<< pop left address, unused")
                        emit_asm("pop", "bc", "<<< pop right value")
                        emit_asm("pop", "de", "<<< pop right address, unused")
                        
                        emit_asm("ld", "de, 0", f"({node.type}) assume condition is false")
                        emit_asm("ld", "a, h", "test both 16-bit registers are 0")
                        emit_asm("or", "l", "")
                        emit_asm("or", "b", "")
                        emit_asm("or", "c", "")
                        emit_asm("jr", f"z, {lex_exit_label}", "assume condition is false")
                        
                        emit_asm("inc", "de", "condition is true")
                        emit_asm("push", "de", ">>> push result", label=lex_exit_label)
                        emit_asm("push", "de", ">>> push result")
                        nodes_code.append("")
                        nodes_code.append("")
                    
                    case "!":
                        emit_asm("pop", "hl", "<<< pop left value")
                        emit_asm("pop", "de", "<<< pop left address, unused")

                        emit_asm("ld", "de, 1", f"({node.type}) assume condition is false")
                        emit_asm("ld", "a, h", "test 16-bit register is 0")
                        emit_asm("or", "l", "")
                        emit_asm("jr", f"z, {lex_exit_label}", "fulfiling")
                        
                        emit_asm("inc", "de", "condition is true")
                        emit_asm("push", "de", ">>> push result", label=lex_exit_label)
                        emit_asm("push", "de", ">>> push result")
                        nodes_code.append("")
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
                variable_name= resolve_identifier_name(identifier_name)
                
                # constant handling
                if variable_name in constant_type_list:
                    nodes_code.append(f"                                ; ({node.type}) constant * {variable_name} *")
                    emit_asm("ld", f"hl, {variable_name}", "variable content")
                    emit_asm("push", "hl", ">>> push variable address (bogus)")
                    emit_asm("push", "hl", ">>> push variable content")
                else: # other, not constants
                    nodes_code.append(f"                                ; ({node.type}) variable * {variable_name} *")
                    emit_asm("ld", f"hl, {variable_name}", "variable address")
                    emit_asm("push", "hl", ">>> push variable address")
                    emit_asm("ld", f"hl, ({variable_name})", "variable content")
                    emit_asm("push", "hl", ">>> push variable content")
                
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
                    matrix_name=resolve_identifier_name(nested_object.name)
                    if matrix_type_list.get(matrix_name) or array_type_list.get(matrix_name) :  
                        nodes_code.append(f"                                ; ({node.type}) matrix ***{matrix_name}*** ")
                        emit_asm("ld", f"hl, {matrix_name}", "variable address")
                        emit_asm("push", "hl", ">>>")
                        emit_asm("ld", f"hl, ({matrix_name})", "variable content")
                        emit_asm("push", "hl", ">>>")
                        nodes_code.append("")
                        
                        nodes_code.append(f"                                ; ({node.type}) matrix column")
                        process_node(member_object.property)
                        nodes_code.append(f"                                ; ({node.type}) matrix row")
                        process_node(member_property)
                        
                        nodes_code.append(f"                                ; ({node.type}) matrix access")                 
                        emit_asm("pop", "ix", "<<< pop column content")
                        emit_asm("pop", "de", "<<< pop column address, unused")
                        emit_asm("pop", "de", "<<< pop row content")
                        emit_asm("pop", "bc", "<<< pop row address, unused")
                        emit_asm("pop", "bc", "<<< pop matrix size (cols, rows)")
                        # record address: matrix@ + 2 * ((row# * row_size) + column#) + 2 <- matrix header
                        emit_asm("ld", "b, 0", "leave rows only")
                        emit_asm("push", "ix", ">>> push row size")
                        emit_asm("push", "bc", ">>> push row size")
                        emit_asm("push", "de", ">>> push row number")
                        emit_asm("call", "mul_16b", "")
                        emit_asm("pop", "hl", "<<< pop row index")
                        emit_asm("pop", "de", "<<< pop column content")
                        emit_asm("add", "hl, de", "record position")
                        emit_asm("add", "hl, hl", "record position")
                        emit_asm("ld", "de, 2", "header size")
                        emit_asm("add", "hl, de", "record position + header")
                        emit_asm("pop", "de", "<<< pop matrix address")
                        emit_asm("add", "hl, de", "exact position!")
                        
                        emit_asm("push", "hl", ">>> push address")
                        emit_asm("ld", "e, (hl)", "position content!")
                        emit_asm("inc", "hl", "")
                        emit_asm("ld", "d, (hl)", "")
                        emit_asm("push", "de", ">>> push value")
                        nodes_code.append("")
                
                # object, dictionary        
                elif member_object_name:
                    object_name=resolve_identifier_name(member_object_name)
                    if object_type_list.get(object_name):
                        process_node(member_object)
                        process_node(member_property)
                        dict_label= new_label("dic_")
                        dict_found_label= new_label("dfo_")
                        dict_exit_label= new_label("dex_")
                        
                        #assembly 
                        nodes_code.append(f"                                ; ({node.type}) dictionary access")                 
                        emit_asm("pop", "hl", "<<< pop value to search")
                        emit_asm("pop", "de", "<<< pop value address, unused")
                        emit_asm("pop", "de", "<<< pop dictionary size")
                        emit_asm("ld", "b, e", "count through the dictionary, DE is free")
                        emit_asm("pop", "ix", "<<< pop dictionary address")
                        nodes_code.append("")
                        
                        # loop through the dictionary
                        emit_asm("inc", "ix", "skip size", label=dict_label)
                        emit_asm("inc", "ix", "")
                        emit_asm("ld", "e, (ix+0)", "read key, byte 1, from dictionary")
                        emit_asm("ld", "d, (ix+1)", "read key, byte 2")
                        emit_asm("inc", "ix", "skip key, byte 2")
                        emit_asm("inc", "ix", "skip value")
                        emit_asm("xor", "a", "")
                        emit_asm("push", "hl", ">>> value to search")
                        emit_asm("sbc", "hl, de", "compare search value with key")
                        emit_asm("pop", "hl", "<<< pop value to search")
                        emit_asm("jr", f"z, {dict_found_label}", "")
                        emit_asm("djnz", dict_label, "")
                        nodes_code.append("")
                        
                        emit_asm("ld", "de, 0", "if not found, value= 0")
                        emit_asm("ld", "bc, 0", "if not found, address= 0")
                        emit_asm("push", "bc", ">>> push value address")
                        emit_asm("push", "de", ">>> push value")
                        emit_asm("jr", dict_exit_label, "skip match")
                        nodes_code.append("")
                        
                        # return result, if any
                        emit_asm("ld", "e, (ix+0)", "read value, byte 1, from dictionary", label=dict_found_label)
                        emit_asm("ld", "d, (ix+1)", "read value, byte 2")
                        emit_asm("push", "ix", ">>> push value address")
                        emit_asm("push", "de", ">>> push value ")

                        nodes_code.append(f"{dict_exit_label}                         ; ({node.type}) exit dictionary access\n")
                        
                    if array_type_list.get(object_name):
                        if array_type_list[object_name]=="int":
                            array_name=object_name
                            process_node(member_object)
                            process_node(member_property)
                            
                            nodes_code.append(f"                                ; ({node.type}) integer array access")                 
                            emit_asm("pop", "hl", "<<< pop record index")
                            emit_asm("pop", "de", "<<< pop record index address, unused")
                            emit_asm("pop", "de", "<<< pop array content, unused")
                            emit_asm("pop", "de", "<<< pop array address")
    
                            # record address: array@ + 2 * (record# + 1)
                            emit_asm("inc", "hl", "")
                            emit_asm("add", "hl, hl", "record position")
                            emit_asm("add", "hl, de", "array address + record position")
                            
                            emit_asm("push", "hl", ">>> push address")
                            emit_asm("ld", "e, (hl)", "position content!")
                            emit_asm("inc", "hl", "")
                            emit_asm("ld", "d, (hl)", "")
                            emit_asm("push", "de", ">>> push content")
                            nodes_code.append("")
                            
                        if array_type_list[object_name]=="str":
                            string_array_label= new_label("sar_")
                            array_name=object_name
                            process_node(member_object)
                            process_node(member_property)        
                            
                            nodes_code.append(f"                                ; ({node.type}) string array access")
                            emit_asm("pop", "hl", "<<< pop record index")
                            emit_asm("pop", "de", "<<< pop record index address, unused")
                            emit_asm("pop", "de", "<<< pop array content, unused")
                            emit_asm("pop", "de", "<<< pop array address")
                            
                            nodes_code.append(f"                                ; find record address")
                            emit_asm("add", "hl, hl", "position within array variable")
                            emit_asm("add", "hl, de", "add array initial address")
                            emit_asm("ld", "de, 2", "skip array sizes")
                            emit_asm("add", "hl, de", " ")
                            emit_asm("ld", "e, (hl)", "position content!")
                            emit_asm("inc", "hl", "")
                            emit_asm("ld", "d, (hl)", "")
                            emit_asm("push", "de", ">>> push array address")
                            emit_asm("push", "de", ">>> push array address")
                            nodes_code.append("")
                                               
                
                if member_object_name:
                    variable_name= resolve_identifier_name(member_object_name)
                    property_name= member_property_name
                    property_type= member_property_type
                    object_name=member_object_name
                    
                    # string methods
                    if variable_name == "String_": # generic String methods
                        if property_name == "fromCharCode":
                            # pending: only one character supported
                            garbage_address=get_garbage_address(4)
                            nodes_code.append(f"                                ; ({node.type}) Ascii to Char")
                            emit_asm("pop", "de", "<<< pop char value")
                            emit_asm("pop", "bc", "<<< pop char address")
                            emit_asm("ld", f"hl, {garbage_address}", "save value in garbage zone")
                            emit_asm("ld", "(hl), 1", "string length")
                            emit_asm("inc", "hl", "")
                            emit_asm("ld", "(hl), 0", "string length")
                            emit_asm("ld", "bc, 1", "string length")
                            emit_asm("push", "bc", ">>> push dummy content")
                            emit_asm("inc", "hl", "")
                            emit_asm("ld", "(hl), e", "string value")
                            emit_asm("inc", "hl", "")
                            emit_asm("ld", "(hl), d", "")
                            nodes_code.append("")
                            emit_asm("ld", f"hl, {garbage_address}", "string address")
                            emit_asm("push", "hl", ">>> push string address")
                    
                    if variable_name in string_type_list:
                        # string length
                        # pending: i don´t like how it's done. no stack consumption
                        if property_name == "length":
                            nodes_code.append(f"                                ; ({node.type}) string length")
                            emit_asm("ld", f"hl, {variable_name}", "variable address")
                            emit_asm("push", "hl", ">>> push string address")
                            emit_asm("ld", "e, (hl)", "get length")
                            emit_asm("inc", "hl", "")
                            emit_asm("ld", "d, (hl)", "variable content")
                            emit_asm("push", "de", ">>> push length")
                            nodes_code.append("")
                    
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
                switch_exit_label = new_label("swx_")
                discriminant_raw_name = getattr(node.discriminant, "name", None)
                if not discriminant_raw_name:
                    report_error(f"{node.type}: only variable switch discriminants are supported.")
                    return
                discriminant_name=resolve_identifier_name(discriminant_raw_name)
                if discriminant_name not in variable_type_list:
                    report_error(f"{node.type}: {discriminant_name} not in variable list.")
                    return

                case_entries = []
                default_label = switch_exit_label
                for switchcase in node.cases:
                    case_label = new_label("swi_")
                    if switchcase.test is None:
                        default_label = case_label
                        case_entries.append((switchcase, case_label, None))
                        continue

                    case_value = resolve_static_value(switchcase.test)
                    if not isinstance(case_value, int) or isinstance(case_value, bool):
                        report_error(f"{switchcase.type}: case value must be a compile-time integer.")
                        return
                    case_entries.append((switchcase, case_label, case_value))

                nodes_code.append(f"                                ; ({node.type}) dispatch")
                process_node(node.discriminant)
                emit_asm("pop", "hl", "<<< discriminant value")
                emit_asm("pop", "de", "<<< discriminant address, unused")

                for _, case_label, case_value in case_entries:
                    if case_value is None:
                        continue
                    emit_asm("ld", f"bc, {case_value}", "case value")
                    emit_asm("xor", "a", "clear carry")
                    emit_asm("sbc", "hl, bc", "compare")
                    emit_asm("jp", f"z, {case_label}", "matching case")
                    emit_asm("add", "hl, bc", "restore discriminant")

                emit_asm("jp", default_label, "default or switch exit")
                nodes_code.append("")

                break_label_stack.append(switch_exit_label)
                for switchcase, case_label, _ in case_entries:
                    label_kind = "default" if switchcase.test is None else "case"
                    nodes_code.append(f"{case_label}                         ; ({switchcase.type}) {label_kind}")
                    for consequent in switchcase.consequent:
                        process_node(consequent)

                break_label_stack.pop()
                nodes_code.append(f"{switch_exit_label}                         ; ({node.type}) end")
                nodes_code.append("")
                    
            case "SwitchCase":
                report_error(f"{node.type}: switch cases must belong to a switch statement.")
                
            case "BreakStatement":
                #print (f"({node.type}) Exit Label: {break_label_stack[-1]}\n")
                #print (f"({node.type}) Node:\n {node}\n")
                
                if not break_label_stack:
                    report_error(f"{node.type}: break used outside a loop or switch.")
                    return
                emit_asm("jp", break_label_stack[-1], f"({node.type})")
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
                        emit_asm("pop", "de", "pop value")
                        emit_asm("pop", "hl", "pop address, unused")
                        emit_asm("ld", "a, e", "")
                        emit_asm("cpl", "", "negate LSB")
                        emit_asm("ld", "e, a", "")
                        emit_asm("ld", "a, d", "")
                        emit_asm("cpl", "", "negate MSB")
                        emit_asm("ld", "d, a", "")
                        nodes_code.append(f"                                ;")
                                              
                    case "-":
                        if getattr(unary_argument, "type", None)=="Literal": # short way for literals
                            literal_value = getattr(unary_argument, "value", 0)
                            emit_asm("ld", f"de, {-literal_value}", f"({node.type}) literal unary: * {-literal_value} *")
                        else: # standard for non-literals
                            # evaluate expression
                            process_node(unary_argument)
                            # apply -
                            emit_asm("pop", "de", "pop value")
                            emit_asm("pop", "hl", "pop address, unused")
                            emit_asm("xor", "a", "")
                            emit_asm("ld", "hl, 0", "")
                            emit_asm("sbc", "hl, de", "HL = -BC")
                            emit_asm("ex", "de, hl", "DE = HL")
                    case _:
                        report_error(f"{node.type}: Unsupported unary operator: {node.operator}")
                        return
                        
                
                emit_asm("push", "de", ">>> push value, unused")
                emit_asm("push", "de", ">>> push record value")
                nodes_code.append("")
                                                
            #-------------------------------------------------------------------
            case "UpdateExpression":
                #print (f"({node.type}) Node:\n {node}")
                update_argument = getattr(node, "argument", None)
                if update_argument is None:
                    report_error(f"{node.type}: update expression without an argument is not supported.")
                    return
                update_argument_name = getattr(update_argument, "name", None)
                if update_argument_name:
                    update_variable_name = resolve_identifier_name(update_argument_name)
                    if update_variable_name in constant_type_list:
                        report_error(f"{node.type}: constant {update_variable_name} cannot be altered.")
                        return
                process_node(update_argument)
                nodes_code.append(f"                                ; ({node.type}) *** {node.operator} ***")
                emit_asm("pop", "hl", "<<< pop left side value, not used")
                emit_asm("pop", "hl", "<<< pop left side address")
    
                # pending: likely incomplete. only applied to the low 8 bits
                match node.operator:
                    case "++":  # Handle increment (++) operator
                        emit_asm("inc", "(hl)", f"({node.type}) increment")
                        
                    case "--":  # Handle decrement (--) operator
                        emit_asm("dec", "(hl)", f"({node.type}) decrement")
                        
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
                existing_kind = declaration_kind_list.get(variable_name)

                if existing_kind is not None:
                    if variable_kind == "var" and existing_kind == "var":
                        report_warning(f"{node.type}: {variable_name} already declared with var.")
                    else:
                        report_error(
                            f"{node.type}: {variable_name} cannot be redeclared "
                            f"as {variable_kind}; it was already declared as {existing_kind}."
                        )
                        return
                else:
                    declaration_kind_list[variable_name] = variable_kind

                if init_node is None:
                    if variable_kind == "const":
                        report_error(f"{node.type}: const {variable_name} requires an initializer.")
                        return
                    init_node = esprima.parseScript("0").body[0].expression

                init_type = getattr(init_node, "type", None)
                init_elements = getattr(init_node, "elements", [])
                init_arguments = getattr(init_node, "arguments", [])
                init_callee = getattr(init_node, "callee", None)
                is_array_constructor = (
                    init_type == "CallExpression"
                    and getattr(init_callee, "name", None) == "Array"
                )
                is_string_constructor = (
                    init_type == "CallExpression"
                    and getattr(init_callee, "name", None) == "String"
                )

                if variable_kind == "const" and is_string_constructor:
                    report_error(f"{node.type}: const cannot use String(); use a literal const string or var String(size).")
                    return
                
                variable_value = resolve_static_value(init_node)
                if variable_value is None and init_type not in ("ArrayExpression", "CallExpression", "ObjectExpression"):
                    report_error(f"{node.type}: non-literal declarations not supported.")
                                
                # constants
                if variable_kind== "const" and init_type != "ArrayExpression" and not is_array_constructor:
                    if isinstance(variable_value, int): # constant integer
                        variable_value = int(variable_value)
                        constant_type_list[variable_name]= "int"
                        constant_value_list[variable_name]= variable_value
                        variable_declarations.append(f"{variable_name}   equ {variable_value}                   ; ({node.type}) constant integer")
                        
                    if isinstance(variable_value, str): # constant string
                        if not validate_string_record(node.type, variable_value):
                            return
                        variable_length=len(variable_value)
                        constant_type_list[variable_name]= "str"
                        constant_value_list[variable_name]= variable_value
                        variable_declarations.append(f'{variable_name}   defb {variable_length}, 0, "{variable_value}"       ; ({node.type}) constant string')
                        variable_declarations.append(f'        defs {config.string_max_length-len(variable_value)}                 ;')
                    if variable_value is None:
                        report_error(f"{node.type}: const initializer not supported.")
                        return

                # variables
                else:
                # integers --------------------------------------------------------
                    if isinstance(variable_value, int):
                        # variable creation
                        if variable_name not in variable_type_list:
                            variable_type_list[variable_name]= "int"
                            variable_declarations.append(f'{variable_name}   defw {int(variable_value)}                  ; ({node.type}) variable int/bool')

                        # JavaScript var redeclarations still execute their
                        # initializer even though no new storage is created.
                        nodes_code.append(f"                                ; ({node.type}) * {variable_name} *")
                        process_node(node.id)
                        process_node(init_node)

                        nodes_code.append(f"                                ; ({node.type}) * = * (int)")
                        emit_asm("pop", "de", "<<< pop right side value")
                        emit_asm("pop", "hl", "<<< pop right side address, unused")
                        emit_asm("pop", "hl", "<<< pop left side value, unused")
                        emit_asm("pop", "hl", "<<< pop left side address")
                        emit_asm("ld", "(hl), e", "write value in destination address")
                        emit_asm("inc", "hl", "")
                        emit_asm("ld", "(hl), d", "")
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
                                    variable_declarations.append(f'        defs {config.string_max_length}, 0xFF           ;')
                            
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
                            emit_asm("ld", f"de, {immutable_name}", f"* {variable_name} *")
                            emit_asm("ld", f"hl, {variable_name}", "")
                            emit_asm("ld", "(hl), e", "immutable address to pointer variable")
                            emit_asm("inc", "hl", "")
                            emit_asm("ld", "(hl), d", "")
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
                                is_matrix_literal = all(e.type == "ArrayExpression" for e in init_elements)
                                if is_matrix_literal:
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

                                if is_matrix_literal:
                                    if not validate_array_dimension(node.type, matrix_cols) or not validate_array_dimension(node.type, matrix_rows):
                                        return
                                elif not validate_array_dimension(node.type, matrix_cols, 32767, "Array length"):
                                    return
                                    
                                content_sample = first_array_static_value(init_elements)
                                
                                # integers
                                if isinstance(content_sample, int):
                                    if variable_kind == "const":
                                        constant_type_list[variable_name] = "int"

                                    # array/matrix declaration
                                    if is_matrix_literal:
                                        variable_declarations.append(f"{matrix_name}   defb {matrix_cols}, {matrix_rows}               ; ({node.type}) integer matrix (cols, rows)")
                                    else:
                                        variable_declarations.append(array_header_declaration(matrix_name, matrix_cols, node.type, "integer"))
        
                                    # array/matrix assignment
                                    array_name=node.id.name
                                    emit_asm("ld", f"hl, {matrix_name}", f"({node.type}) array/matrix assignment")
                                    emit_asm("inc", "hl", "skip dimensions")
                                    emit_asm("inc", "hl", "")
                                    nodes_code.append("")
                                    
                                    # create array/matrix elements
                                    process_node(init_node) # creates the matrix elements
                                    nodes_code.append(f"                                ; ({node.type}) {matrix_name}, end of...\n")
                                
                                # strings
                                if isinstance(content_sample, str):
                                    array_type_list[variable_name]= "str"
                                    if variable_kind == "const":
                                        constant_type_list[variable_name] = "str"
                                    immutable_name="im_" + matrix_name
                                    
                                    # array/matrix declaration
                                    if is_matrix_literal:
                                        variable_declarations.append(f'{immutable_name}   defb {matrix_cols}, {matrix_rows}            ; ({node.type}) string matrix (cols, rows)')
                                    else:
                                        variable_declarations.append(array_header_declaration(immutable_name, matrix_cols, node.type, "string"))

                                    # create array/matrix elements
                                    process_node(init_node) # creates the matrix elements
                                    
                                    # array/matrix declaration
                                    if is_matrix_literal:
                                        variable_declarations.append(f'{matrix_name}   defb {matrix_cols}, {matrix_rows}               ; ({node.type}) string matrix (cols, rows)')
                                    else:
                                        variable_declarations.append(array_header_declaration(matrix_name, matrix_cols, node.type, "string"))

                                    # pointers to immutable strings, initial assignment
                                    array_element_index=0
                                    for element in init_elements:
                                        variable_declarations.append(f"        defw {immutable_name}+{2 + array_element_index*string_record_size()}        ; element {array_element_index}")
                                        array_element_index+=1

                                    # immutable strings assignment
                                    nodes_code.append(f"                                ; ({node.type}) * = * string ")
                                    emit_asm("ld", f"hl, {matrix_name}+2", f"* {variable_name} * strings array")

                                    # pointers to immutable strings, code assignment
                                    array_element_index=0
                                    for element in init_elements:
                                        emit_asm("ld", f"de, {immutable_name}+{2 + array_element_index*string_record_size()}", f"element {array_element_index}")
                                        emit_asm("ld", "(hl), e", "")
                                        emit_asm("inc", "hl", "")
                                        emit_asm("ld", "(hl), d", "")
                                        emit_asm("inc", "hl", "")

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
                                        if len(init_arguments) != 1:
                                            report_error(f"{node.type}: String() currently supports one literal size.")
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
                                                if not validate_array_dimension(node.type, matrix_cols, 32767, "Array length"):
                                                    return
                                                array_type_list[matrix_name]= "int" # pending: all matrices and arrays are treated as integers.
                                                if variable_kind == "const":
                                                    constant_type_list[matrix_name] = "int"
                                            case 2: # 2D matrix
                                                if getattr(init_arguments[0], "value", None) is None or getattr(init_arguments[1], "value", None) is None:
                                                    report_error(f"{node.type}: Array() dimensions must be literal values.")
                                                    return
                                                matrix_rows= init_arguments[0].value
                                                matrix_cols = init_arguments[1].value
                                                if not validate_array_dimension(node.type, matrix_cols) or not validate_array_dimension(node.type, matrix_rows):
                                                    return
                                                matrix_type_list[matrix_name]= "int" # pending: all matrices and arrays are treated as integers.
                                                if variable_kind == "const":
                                                    constant_type_list[matrix_name] = "int"
                                            case _: # higher dimensions
                                                report_error(f"{node.type}: {matrix_name}, number of dimensions not supported.")
                                        
                                        if matrix_rows == 1:
                                            variable_declarations.append(array_header_declaration(matrix_name, matrix_cols, node.type, "empty"))
                                        else:
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
                                        init_object_name = getattr(getattr(init_callee, "object", None), "name", None)
                                        init_property_name = getattr(getattr(init_callee, "property", None), "name", None)
                # non-standard: used for canvas creation --------------------------                             
                                        if init_property_name == "getContext":
                                            if len(init_arguments) != 1 or getattr(init_arguments[0], "value", None) != "2d":
                                                report_error(f'{node.type}: canvas getContext() only supports literal "2d".')
                                                return
                                            #variable_name=add_underscore_to_var(node.id.name) # pending: make sure "ctx" is "ctx_"
                                            variable_name=node.id.name
                                            object_type_list[variable_name]="canvas"
                                            #variable declaration
                                            variable_declarations.append(f"{variable_name}           defw 0         ; ({node.type}) canvas context")
                                            variable_declarations.append(f"{variable_name}_x         defw 128       ;")
                                            variable_declarations.append(f"{variable_name}_y         defw 96        ;")
                # JavaScript browser compatibility placeholder --------------------
                                        elif init_object_name == "document" and init_property_name == "getElementById":
                                            variable_type_list[variable_name]= "int"
                                            variable_declarations.append(f"{variable_name}   defw 0                  ; ({node.type}) DOM element placeholder")
                                            
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
                                emit_asm("pop", "de", "<<< pop value")
                                emit_asm("pop", "bc", "<<< pop address, unused")
                                emit_asm("ld", "(hl), e", "write LSB")
                                emit_asm("inc", "hl", "")
                                emit_asm("ld", "(hl), d", "write MSB")
                                emit_asm("inc", "hl", "")
                                nodes_code.append("")
                            
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
                                emit_asm("pop", "de", "<<< pop value")
                                emit_asm("pop", "bc", "<<< pop address, unused")
                                emit_asm("ld", "(hl), e", "write LSB")
                                emit_asm("inc", "hl", "")
                                emit_asm("ld", "(hl), d", "write MSB")
                                emit_asm("inc", "hl", "")
                                nodes_code.append("")
                                
                            case "Identifier":
                                node_value = resolve_static_value(element)
                                if isinstance(node_value, int):
                                    declarations_line+=(f"{node_value}, ")

                                    process_node(element)
                                    nodes_code.append(f"                                ; ({node.type}) constant assignment")
                                    emit_asm("pop", "de", "<<< pop value")
                                    emit_asm("pop", "bc", "<<< pop address, unused")
                                    emit_asm("ld", "(hl), e", "write LSB")
                                    emit_asm("inc", "hl", "")
                                    emit_asm("ld", "(hl), d", "write MSB")
                                    emit_asm("inc", "hl", "")
                                    nodes_code.append("")
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
                        if not validate_string_record(node.type, node_value):
                            return
                        
                        string_matrix_element_label = new_label("stm_")
                        
                        # declarations
                        # arrays are built on fixed record size, to simplify access to elements
                        variable_declarations.append(f'{string_matrix_element_label} defb {len(node_value)}, 0, "{node_value}"        ;')
                        variable_declarations.append(f'        defs {config.string_max_length-len(node_value)}                 ;')
                        
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
                    emit_asm("pop", "de", f"({node.type}) <<< pop condition value")
                    emit_asm("pop", "hl", "<<< pop address, unused")
                    emit_asm("xor", "a", "A=0")
                    emit_asm("cp", "e", "if E=0, condition not true")
                    emit_asm("jp", f"z, {break_label_stack[-1]}", "exit while")
                    nodes_code.append("")

                # loop body
                if node.body:
                    nodes_code.append(f"                                ; ({node.type}) 2. body")
                    process_node(node.body)
                
                # node exit
                emit_asm("jp", while_label, f"({node.type})", label=update_label_stack.pop())
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


