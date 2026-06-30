import argparse
from pathlib import Path
import re
import config
import translator as translator_module
import utils as utils_module
from utils import process_non_js, find_missing_routines
from translator import translate_to_assembly

LABEL_COLUMN = 0
OPCODE_COLUMN = 14
OPERAND_COLUMN = 22
COMMENT_COLUMN = 44

ASM_OPCODES = {
    "adc", "add", "and", "bit", "call", "ccf", "cp", "cpd", "cpdr", "cpi", "cpir",
    "cpl", "daa", "dec", "di", "djnz", "ei", "ex", "exx", "halt", "im", "in",
    "inc", "ind", "indr", "ini", "inir", "jp", "jr", "ld", "ldd", "lddr", "ldi",
    "ldir", "neg", "nop", "or", "otdr", "otir", "out", "outd", "outi", "pop",
    "push", "res", "ret", "reti", "retn", "rl", "rla", "rlc", "rlca", "rld", "rr",
    "rra", "rrc", "rrca", "rrd", "rst", "sbc", "scf", "set", "sla", "sll", "sli",
    "sra", "srl", "sub", "xor",
}

ASM_DIRECTIVES = {
    "org", "end", "defb", "defm", "defs", "defw", "equ", "include",
}

ASM_KEYWORDS = ASM_OPCODES | ASM_DIRECTIVES

LABEL_PATTERN = re.compile(r"^[A-Za-z_.$][A-Za-z0-9_.$]*:?$")


def append_column(parts, text, column):
    if not text:
        return
    current_length = sum(len(part) for part in parts)
    spacing = max(1, column - current_length)
    parts.append(" " * spacing)
    parts.append(text)


def split_asm_comment(line):
    in_string = False
    quote_char = ""

    for index, char in enumerate(line):
        if char in ("'", '"'):
            if not in_string:
                in_string = True
                quote_char = char
            elif quote_char == char:
                in_string = False
            continue

        if char == ";" and not in_string:
            code = line[:index].rstrip()
            comment = line[index + 1 :].strip()
            return code, comment

    return line.rstrip(), None


def parse_asm_code(code):
    stripped = code.strip()
    if not stripped:
        return "", "", ""

    parts = stripped.split(None, 2)
    first = parts[0]
    first_without_colon = first[:-1] if first.endswith(":") else first
    first_lower = first_without_colon.lower()

    if first_lower in ASM_KEYWORDS:
        operand = stripped[len(first) :].strip()
        return "", first_without_colon, operand

    if len(parts) == 1 and LABEL_PATTERN.match(first):
        return first_without_colon, "", ""

    if len(parts) >= 2 and LABEL_PATTERN.match(first):
        second = parts[1]
        second_lower = second.lower()
        if second_lower in ASM_KEYWORDS:
            operand = parts[2].strip() if len(parts) > 2 else ""
            return first_without_colon, second, operand

    return "", "", stripped


def format_asm_line(line):
    if not line.strip():
        return ""

    code, comment = split_asm_comment(line)

    if not code.strip():
        return (" " * OPCODE_COLUMN) + f"; {comment}" if comment else ""

    label, opcode, operand = parse_asm_code(code)
    if not label and not opcode and operand == code.strip():
        suffix = f" ; {comment}" if comment else ""
        return code.rstrip() + suffix

    parts = []
    if label:
        parts.append(label)
    if opcode:
        append_column(parts, opcode, OPCODE_COLUMN)
    if operand:
        append_column(parts, operand, OPERAND_COLUMN)
    if comment is not None:
        append_column(parts, f"; {comment}" if comment else ";", COMMENT_COLUMN)

    return "".join(parts).rstrip()


def format_assembly_lines(chunks):
    formatted_lines = []
    for chunk in chunks:
        formatted_lines.extend(format_asm_line(line) for line in str(chunk).splitlines())
    return formatted_lines

def parse_address(value):
    try:
        address = int(value, 0)
    except ValueError as exc:
        raise argparse.ArgumentTypeError("address must be a decimal or hexadecimal integer") from exc

    if address < 0 or address > 0xFFFF:
        raise argparse.ArgumentTypeError("address must be between 0 and 65535")
    return address

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

def read_compiler_file(filename):
    path = Path(__file__).resolve().parent / filename
    with open(path, "r", encoding="utf-8") as file:
        return file.read()

def main(input_file, output_file, tapbas=False, quiet=False, org=None):
    reset_compiler_state()
    initial_address = config.initial_address if org is None else org
    
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
    full_code.append(f"        org {initial_address}               ; initial code address")
    if tapbas:
        full_code.append("start:")
    full_code.append("; File: startup.asc. Default ZX Spectrum startup code")
    full_code.append(read_compiler_file("startup.asc"))
    
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

    full_code = format_assembly_lines(full_code)
    
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
    parser.add_argument(
        "--org",
        type=parse_address,
        help="initial Z80 code address, decimal or hexadecimal (default: 25000)",
    )
    args = parser.parse_args()
    main(args.input_file, args.output_file, tapbas=args.tapbas, quiet=args.quiet, org=args.org)
