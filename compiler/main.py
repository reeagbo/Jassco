import argparse
from pathlib import Path
import config
import translator as translator_module
import utils as utils_module
from utils import process_non_js, find_missing_routines
from translator import translate_to_assembly

def reset_compiler_state():
    config.nodes_code.clear()
    config.include_filenames_list.clear()
    config.function_declarations.clear()
    config.variable_declarations.clear()
    config.variable_type_list.clear()
    config.constant_type_list.clear()
    config.constant_value_list.clear()
    config.object_type_list.clear()
    config.array_type_list.clear()
    config.matrix_type_list.clear()
    config.string_type_list.clear()
    config.break_label_stack.clear()
    config.update_label_stack.clear()
    config.label_count = 0
    config.update_label = ""
    config.function_end_tag = "# EOF TAG"
    config.function_exit_tag = ""
    config.garbage_address_current = 0

    translator_module.function_end_tag = config.function_end_tag
    translator_module.function_exit_tag = config.function_exit_tag
    translator_module.update_label = config.update_label

    utils_module.clear_errors()

def resolve_include(filename, input_file):
    candidates = [
        Path(filename),
        Path(input_file).resolve().parent / filename,
        Path(__file__).resolve().parent / filename,
    ]

    for candidate in candidates:
        if candidate.exists():
            return candidate

    raise FileNotFoundError(filename)

def main(input_file, output_file, tapbas=False, quiet=False):
    reset_compiler_state()
    
    # variables----------------------------------------------------------------
    full_code = []
    
    # Read JavaScript code
    with open(input_file, "r", encoding="utf-8") as file:
        input_code = file.read()

    # process non-JS code
    processed_code = process_non_js(input_code)

    # Translate JavaScript to assembly
    nodes_code, variable_declarations, include_filenames_list = translate_to_assembly(processed_code)
    
    # assembly code build -------------------------------------------------------
    # compiler info
    full_code.append(f"; Generated with JAvaScript to ASSembly COmpiler, JASSCO v0. Boria Labs 2025.")
    
    # directives ------------------------------------------------------------------------------
    full_code.append("; Directives -------------------------------------------------")
    full_code.append(f"        org {config.initial_address}               ; initial code address")
    entry_label = "start: " if tapbas else ""
    full_code.append(f"{entry_label}        jp mai_cod              ; jumps to main code")
    
    # variable declarations -------------------------------------------------------------------
    full_code.append("\n; Variable declarations --------------------------------------")
    # auxiliary stack
    full_code.append(f"        sta_ck2 defw {config.stack2_address}      ; auxiliary stack address") 

    if variable_declarations:
        full_code.append("\n".join(variable_declarations)) 
    
    # Include files ---------------------------------------------------------------------------
    full_code.append(f"\n; Include files ----------------------------------------------")
    for filename in include_filenames_list:
        include_path = resolve_include(filename, input_file)
        with open(include_path, 'r') as file:
            content = file.read()
            full_code.append(content)
        
    # program code ----------------------------------------------------------------------------
    full_code.append("\n; Program code -----------------------------------------------")
    
    # Function declarations can appear anywhere in JavaScript. Keep their
    # generated blocks outside the executable flow and preserve the original
    # order of every other top-level statement under mai_cod.
    function_blocks = []
    main_code = []
    current_function = None
    function_start = "; (FunctionDeclaration) Function:"

    for line in nodes_code:
        if line.startswith(function_start):
            current_function = [line]
            continue

        if current_function is not None:
            if config.function_end_tag in line:
                function_blocks.extend(current_function)
                current_function = None
            else:
                current_function.append(line)
            continue

        if config.function_end_tag not in line:
            main_code.append(line)

    if current_function is not None:
        raise RuntimeError("Unterminated generated function block.")

    full_code.extend(function_blocks)
    full_code.append("mai_cod                         ; main code")
    full_code.extend(main_code)
        
    # end section -----------------------------------------------------------------------------
    full_code.append ("        ret                     ; end of code")
    if tapbas:
        full_code.append("\n        end start")
    
    # -----------------------------------------------------------------------------------------
    # check all calls in assembly and spot missing libraries
    missing_routines = find_missing_routines(full_code)
    if missing_routines:
        raise RuntimeError(f"Missing assembly routines: {', '.join(missing_routines)}")

    if utils_module.compiler_errors:
        raise RuntimeError(
            "Compilation failed with errors:\n" + "\n".join(utils_module.compiler_errors)
        )

    # print full code in console
    if not quiet:
        print("\n".join(full_code))
    
    # write the assembly code to output file
    with open(output_file, "w", encoding="utf-8") as file:
        file.write("\n".join(full_code))

# ---------------------------------------------------------------------------------------------
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Compile JASSCO JavaScript to Z80 assembly.")
    parser.add_argument("input_file", nargs="?", default="input.js")
    parser.add_argument("output_file", nargs="?", default="output.asm")
    parser.add_argument(
        "--tapbas",
        action="store_true",
        help="add the start/end directives required by Pasmo --tapbas",
    )
    parser.add_argument(
        "--quiet",
        action="store_true",
        help="write the ASM file without printing the complete assembly to the console",
    )
    args = parser.parse_args()
    main(args.input_file, args.output_file, tapbas=args.tapbas, quiet=args.quiet)
