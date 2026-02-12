;; Keywords - Control flow
["if" "else" "while" "for" "break" "continue" "return" "switch" "case" "default"] @keyword

;; Keywords - Declarations
["fn" "var" "let" "def" "alias" "struct" "union" "enum" "type"] @keyword

;; Keywords - Modifiers
["pub" "inline" "noreturn" "extern" "export" "asm" "import" "from"] @keyword

;; Keywords - Operators
["and" "or" "not"] @keyword

;; Keywords - Type operations
["cast" "intcast" "floatcast" "ptrcast" "bitcast" "typeof" "sizeof" "alignof" "offsetof"] @keyword

;; Primitive types
["void" "bool" "int8" "int16" "int32" "int64" "uint8" "uint16" "uint32" "uint64" "isize" "usize" "float32" "float64"] @type.builtin

;; Boolean and nil literals
["true" "false" "nil"] @constant.builtin

;; Comments
(comment) @comment

;; String and character literals
(string) @string
(character) @character

;; Numbers
(number) @number
(float) @number

;; Enums
(enum_declaration name: (identifier) @type)
(enum_declaration base_type: (_) @type)
(enum_variant name: (identifier) @constant)

;; Switch
(switch_statement
  "switch" @keyword
  condition: (_)
  (case_arm
    "case" @keyword
    value: (_)))

(default_arm
  "default" @keyword)

;; Ensure blocks inside switch arms are highlighted
(case_arm (short_block (block) @none))
(default_arm (short_block (block) @none))

;; Packed modifier on structs
(struct_declaration "packed" @keyword)

;; Function declarations
(fn_declaration (identifier) @function)

;; Variable declarations
(var_declaration
  name: (identifier) @variable)
(var_declaration ":" @punctuation.delimiter)
(var_declaration init_type: (_) @type)

;; Let declarations
(let_declaration
  name: (identifier) @variable)
(let_declaration ":" @punctuation.delimiter)
(let_declaration init_type: (_) @type)

;; Const definitions
(def_declaration
  name: (identifier) @constant)
(def_declaration ":" @punctuation.delimiter)
(def_declaration init_type: (_) @type)

;; Type declarations (structs, unions, enums, aliases)
(struct_declaration
  name: (identifier) @type)

(union_declaration
  name: (identifier) @type)

(enum_declaration
  name: (identifier) @type)

(alias_declaration
  name: (identifier) @type)

;; Function parameters
(parameter
  name: (identifier) @variable.parameter)

;; Complex types
(function_type) @type
(pointer_type) @type

;; Array type syntax
(array_type (base_type) @type)
(array_type "[" @punctuation.bracket "]" @punctuation.bracket)

;; Struct initialization and field access
(struct_initializer) @constructor
(struct_element) @property

;; Const modifier and user-defined types
(user_type "const" @keyword)
(user_type (identifier) @type)

;; Function calls - distinguishes from regular identifiers
(postfix_expr
  (primary_expr (identifier) @function.call)
  (arguments))

;; Assignment operators
["=" "+=" "-=" "*=" "/=" "%=" "&=" "|=" "^=" "<<=" ">>="] @operator

;; Arithmetic operators
["+" "-" "*" "/" "%"] @operator

;; Bitwise operators
["&" "|" "^" "~" "<<" ">>"] @operator

;; Comparison operators
["==" "!=" "<" ">" "<=" ">="] @operator

;; Unary operators
["!" "++" "--"] @operator

;; Member access and optional chaining
["." "?"] @operator

;; Brackets and braces
["(" ")" "[" "]" "{" "}"] @punctuation.bracket

;; Delimiters
[";" "," ":"] @punctuation.delimiter