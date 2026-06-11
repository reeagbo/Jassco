import re
import unicodedata

import config

compiler_errors = []
compiler_warnings = []

def report_error(message):
    compiler_errors.append(message)
    print(message)

def report_warning(message):
    compiler_warnings.append(message)
    print(f"Warning: {message}")

def clear_errors():
    compiler_errors.clear()
    compiler_warnings.clear()

def find_missing_routines(full_code):
    code_lines = "\n".join(full_code).splitlines()
    code_without_comments = "\n".join(line.split(";", 1)[0] for line in code_lines)
    
    # Step 1: Extract all CALL instructions and get the routine names following them
    call_pattern = re.compile(r'\bcall\s+([a-zA-Z_][a-zA-Z0-9_]*)\b', re.IGNORECASE)
    call_routines = call_pattern.findall(code_without_comments)
    
    # Step 2: Collect missing routines in a list
    missing_routines = []
    for routine in call_routines:
        # Search for the routine at the beginning of any line
        label_pattern = re.compile(rf'^\s*{re.escape(routine)}\b', re.MULTILINE)
        
        if not re.search(label_pattern, code_without_comments):
            missing_routines.append(routine)

    return sorted(set(missing_routines))

def get_garbage_address(space_needed): # provide address in the garbage zone
    garbage_address_return=0
    
    # first run
    if config.garbage_address_current == 0:
        config.garbage_address_current=config.garbage_address_start
        garbage_address_return=config.garbage_address_current
    # regular run
    if config.garbage_address_current != 0: 
        if config.garbage_address_current + space_needed >= config.garbage_address_end-1: # if not enough space
            config.garbage_address_current=config.garbage_address_start
            garbage_address_return=config.garbage_address_current
        else: # if enough space
            garbage_address_return=config.garbage_address_current
            config.garbage_address_current+=space_needed   

    return garbage_address_return
    
def new_label(node_type):
    prefix = node_type[:4].lower()  # Use the first three letters of the node type
    label = f"{prefix}{config.label_count:03d}"  # Format label with 4 digits
    config.label_count += 1
    return label

def get_content_type(node):
    #print (node)
    #print (f" variable list: {variable_type_list}")
    #print (f" string list: {string_type_list}")
    #print (f" array list: {array_type_list}")
    #print (f" object list: {object_type_list}")
    #print (f" matrix list: {matrix_type_list}")
    
    content_type="int"
    node_type=node.type
    match node_type:
        case "Literal": # infer type from the value
            content_type= type(node.value).__name__
            if content_type == "bool":
                content_type = "int"
        
        case "Identifier": # infer type from variable list
            node_name=add_underscore_to_var(node.name)
            if node_name in config.variable_type_list:    
                content_type= config.variable_type_list[node_name]
            if node_name in config.string_type_list:    
                content_type= config.string_type_list[node_name]

        case "MemberExpression": # infer type from variable list
            node_object = getattr(node, "object", None)
            nested_object = getattr(node_object, "object", None)
            if nested_object and getattr(nested_object, "name", None): # matrices
                node_name=add_underscore_to_var(nested_object.name)
                if node_name in config.matrix_type_list:
                    content_type= config.matrix_type_list[node_name]
            elif node_object and getattr(node_object, "name", None): # arrays
                node_name=add_underscore_to_var(node_object.name)
                if node_name in config.array_type_list:
                    content_type= config.array_type_list[node_name]
                          
    #print (f"Type is {content_type}")
    return content_type

def add_underscore_to_var(var_name):
    return var_name + "_"

def process_non_js(js_code):

    js_code_lines = js_code.splitlines()
    processed_lines = []

    def as_eval_line(assembly_line):
        escaped = assembly_line.replace("\\", "\\\\").replace('"', '\\"')
        return f'eval("{escaped}")'

    # Marks lines in assembly blocks as eval(), so that esprima will not complain.
    inside_block = False
    
    for line in js_code_lines:  
        current_line = line.strip()

        if not current_line:
            continue

        if inside_block:
            if "}" in current_line:
                before_close, _, after_close = current_line.partition("}")
                if before_close.strip():
                    processed_lines.append(as_eval_line(before_close.strip()))
                inside_block = False
                if after_close.strip():
                    processed_lines.append(after_close.strip())
            else:
                if current_line:
                    processed_lines.append(as_eval_line(current_line)) # add "eval ()" to avoid esprima to fail
            continue

        if re.search(r"assembly.*\{", current_line):
            before_open, _, assembly_tail = current_line.partition("{")
            prefix = before_open.replace("assembly", "", 1).strip()
            if prefix:
                processed_lines.append(prefix)

            if "}" in assembly_tail:
                assembly_line, _, suffix = assembly_tail.partition("}")
                if assembly_line.strip():
                    processed_lines.append(as_eval_line(assembly_line.strip()))
                if suffix.strip():
                    processed_lines.append(suffix.strip())
            else:
                inside_block = True
                if assembly_tail.strip():
                    processed_lines.append(as_eval_line(assembly_tail.strip()))
            continue

        processed_lines.append(current_line)
  
    processed_code = "\n".join(processed_lines)
    return processed_code

def basic_ascii (input_str):
    # Normalize the string to NFKD form, splitting characters from their accents
    normalized_str = unicodedata.normalize('NFKD', input_str)
    # Filter out combining characters (e.g., accents) and encode as ASCII
    ascii_str = normalized_str.encode('ascii', 'ignore').decode('utf-8')
    return ascii_str

