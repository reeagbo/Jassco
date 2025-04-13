import sys
from config import (
    nodes_code, label_count,
    include_filenames_list, function_declarations, variable_declarations, function_end_tag,
    string_max_length, initial_address, stack2_address,
    assembly_lib_path
)
from utils import process_non_js, find_missing_routines
from translator import translate_to_assembly

def main(input_file, output_file):
    global initial_address
    global string_max_length
    global functions_present
    
    # variables----------------------------------------------------------------
    full_code = []
    nodes_code = []    
    function_declarations = [] # store all functions created to avoid duplication
    function_end_tag = "# EOF TAG" # used to find the end of functions definition
    include_filenames_list = [] # names of include files
    variable_declarations = []  # string literals for the declarations section
    
    # Read JavaScript code
    with open(input_file, "r", encoding="utf-8") as file:
        input_code = file.read()

    # process non-JS code
    processed_code = process_non_js(input_code)

    # Translate JavaScript to assembly
    nodes_code, variable_declarations, include_filenames_list = translate_to_assembly (processed_code)
    
    # assembly code build -------------------------------------------------------
    # compiler info
    full_code.append(f"; Generated with JAvaScript to ASSembly COmpiler, JASSCO v0. Boria Labs 2025.")
    
    # directives ------------------------------------------------------------------------------
    full_code.append("; Directives -------------------------------------------------")
    full_code.append(f"        org {initial_address}               ; initial code address\n")
    full_code.append(f"        jp mai_cod              ; jumps to main code")
    
    # variable declarations -------------------------------------------------------------------
    full_code.append("\n; Variable declarations --------------------------------------")
    # auxiliary stack
    full_code.append(f"        sta_ck2 defw {stack2_address}      ; auxiliary stack address") 

    if variable_declarations:
        full_code.append("\n".join(variable_declarations)) 
    
    # Include files ---------------------------------------------------------------------------
    full_code.append(f"\n; Include files ----------------------------------------------")
    for filename in include_filenames_list:
        try:
            with open(filename, 'r') as file:
                content = file.read() 
                full_code.append(content)
        except FileNotFoundError:
            print(f"\n; Error: Could not find include file: {filename}")
        
    # program code ----------------------------------------------------------------------------
    full_code.append("\n; Program code -----------------------------------------------")
    
    # find end of last function in nodes_code
    count=0
    last_function_line = -1
    for i, line in enumerate(nodes_code):
        if function_end_tag in line:
            nodes_code[last_function_line] = ""
            count += 1
            last_function_line = i  # Update to the index of the last occurrence
    
    # Replace the last occurrence with the replace_string (if any was found)
    if last_function_line != -1:
        nodes_code[last_function_line] = "mai_cod                         ; main code\n"

    for line in nodes_code:
        full_code.append(line)
        
    # end section -----------------------------------------------------------------------------
    full_code.append ("        ret                     ; end of code")
    
    # -----------------------------------------------------------------------------------------
    # check all calls in assembly and spot missing libraries
    find_missing_routines(full_code)

    # print full code in console
    print("\n".join(full_code))
    
    # write the assembly code to output file
    with open(output_file, "w", encoding="utf-8") as file:
        file.write("\n".join(full_code))

# ---------------------------------------------------------------------------------------------
if __name__ == "__main__":
    # Set default input and output file names
    input_file = "input.js"
    output_file = "output.asm"

    # Check if positional arguments are provided
    if len(sys.argv) > 1:
        input_file = sys.argv[1]  # First argument is input file
    if len(sys.argv) > 2:
        output_file = sys.argv[2]  # Second argument is output file

    # Call main function with the determined files
    main(input_file, output_file)
