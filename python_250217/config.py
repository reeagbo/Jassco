# config.py (Shared Module)

# Shared Variables
nodes_code = []  # Stores assembly code lines
label_count = 0  # Used for generating unique labels
include_filenames_list = []  # Names of include files
function_declarations = []  # To avoid function duplication
variable_declarations = []  # Variable declarations
variable_type_list = {}  # Stores variable names and their types
object_type_list = {}
array_type_list = {}
matrix_type_list = {}
string_type_list = {}


function_end_tag = "# EOF TAG"  # Marks end of functions
function_exit_tag = ""
assembly_lib_path = "./"  # assembly libraries path

# ZX-Spectrum specific configuration
string_max_length = 32  # Maximum string length
garbage_address_start = 24000  # Starting address for garbage operations
garbage_address_end = 24200  # Starting address for garbage operations
garbage_address_current = 0
initial_address = 25000  # Starting address for variables
