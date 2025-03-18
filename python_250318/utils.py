import re
import os
import unicodedata

from config import (
    label_count, 
    variable_type_list, array_type_list, matrix_type_list, object_type_list, string_type_list,
    garbage_address_start, garbage_address_end, garbage_address_current, 
    string_max_length, assembly_lib_path
    )

def find_missing_routines(full_code):
    global assembly_lib_path
    
    # Step 1: Extract all CALL instructions and get the routine names following them
    call_pattern = re.compile(r'\bcall\s+([a-zA-Z_][a-zA-Z0-9_]*)\b', re.IGNORECASE)
    call_routines = call_pattern.findall("\n".join(full_code))
    
    # Step 2: Collect missing routines in a list
    missing_routines = []
    for routine in call_routines:
        # Search for the routine at the beginning of any line
        label_pattern = re.compile(rf'^\s*{re.escape(routine)}\b', re.MULTILINE)
        
        if not re.search(label_pattern, "\n".join(full_code)):
            missing_routines.append(routine)

def get_garbage_address(space_needed): # provide address in the garbage zone
    global garbage_address_start
    global garbage_address_end
    global garbage_address_current
    global string_max_length
    
    garbage_address_return=0
    
    # first run
    if garbage_address_current == 0:
        garbage_address_current=garbage_address_start
        garbage_address_return=garbage_address_current
    # regular run
    if garbage_address_current != 0: 
        if garbage_address_return + space_needed >= garbage_address_end-1: # if not enough space
            garbage_address_current=garbage_address_start
            garbage_address_return=garbage_address_current
        else: # if enough space
            garbage_address_return=garbage_address_current
            garbage_address_current+=space_needed   

    return garbage_address_return
    
def new_label(node_type):
    global label_count
    prefix = node_type[:4].lower()  # Use the first three letters of the node type
    label = f"{prefix}{label_count:03d}"  # Format label with 4 digits
    label_count += 1
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
        
        case "Identifier": # infer type from variable list
            node_name=add_underscore_to_var(node.name)
            if node_name in variable_type_list:    
                content_type= variable_type_list[node_name]
            if node_name in string_type_list:    
                content_type= string_type_list[node_name]

        case "MemberExpression": # infer type from variable list
            if node.object.object: # matrices
                node_name=add_underscore_to_var(node.object.object.name)
                if node_name in variable_type_list:
                    content_type= matrix_type_list[node_name]
            elif node.object: # arrays
                node_name=add_underscore_to_var(node.object.name)
                if node_name in variable_type_list:
                    content_type= array_type_list[node_name]
                    

            
    #print (f"Type is {variable_type}")
    return content_type

def add_underscore_to_var(var_name):
    return var_name + "_"

def process_non_js(js_code):

    js_code_lines = js_code.splitlines()
    processed_lines = []

    # marks lines in assembly blocks as eval(), so that esprima will not complain
    inside_block = False  # Flag for detecting assembly block
    
    for line in js_code_lines:  
        current_line = line.strip()
        
        # if regular lines
        if not inside_block:
            # find assembly header
            if re.search(r"assembly.*\{", current_line):
                inside_block = True
                #processed_lines.append("            ; raw assembly block")
                current_line = re.sub(r"(assembly|\{)", "", current_line).strip() # remove "assembly" and "{" 
                if current_line:  
                    processed_lines.append(current_line)
            else: # non assembly lines
                if current_line:  
                    processed_lines.append(current_line)
        # if assembly lines       
        if inside_block:
            # exit condition: if "}" is found
            if not re.search(r"\}", current_line): 
                if current_line:
                    processed_lines.append(f'eval("{current_line}")') # add "eval ()" to avoid esprima to fail
            else:
                inside_block = False
                current_line = re.sub(r"\}", "", current_line).strip()
                if current_line:
                    processed_lines.append(f'eval("{current_line}")') # add "eval ()" to avoid esprima to fail
  
    processed_code = "\n".join(processed_lines)
    return processed_code

def basic_ascii (input_str):
    # Normalize the string to NFKD form, splitting characters from their accents
    normalized_str = unicodedata.normalize('NFKD', input_str)
    # Filter out combining characters (e.g., accents) and encode as ASCII
    ascii_str = normalized_str.encode('ascii', 'ignore').decode('utf-8')
    return ascii_str

