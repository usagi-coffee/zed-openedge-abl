(comment) @comment
(line_comment) @comment
(block_comment) @comment
(preprocessor_directive) @preproc
(include) @constant
(constant) @constant
(argument_reference) @constant
(null_literal) @constant
(boolean_literal) @boolean
((identifier) @boolean (#match? @boolean "^(?i:true|false|yes|no)$"))
(number_literal) @number
(date_literal) @number
(string_literal) @string

[
  "AS"
  "ASCENDING"
  "ASSIGN"
  "AT"
  "AVAIL"
  "AVAILABLE"
  "BEFORE-TABLE"
  "BGCOLOR"
  "BINARY"
  "BREAK"
  "BUFFER"
  "BUFFER-COPY"
  "BUTTONS"
  "BY"
  "CACHE"
  "CASE"
  "CATCH"
  "CLASS"
  "CODEPAGE"
  "COLLATE"
  "COLOR"
  "COLUMN"
  "COLUMN-CODEPAGE"
  "COLUMN-LABEL"
  "CONTEXT-HELP-ID"
  "CONTROL"
  "CONVERT"
  "COPY-LOB"
  "CREATE"
  "CURRENT"
  "DCOLOR"
  "DECIMALS"
  "DEF"
  "DEFINE"
  "DELETE"
  "DELIMITER"
  "DESCENDING"
  "DISABLE"
  "DO"
  "DISPLAY"
  "DUMP"
  "EACH"
  "ELSE"
  "EMPTY"
  "END"
  "ENUM"
  "ERROR"
  "EXCEPT"
  "EXPORT"
  "EXTENT"
  "FGCOLOR"
  "FIELD"
  "FIELDS"
  "FILE"
  "FIND"
  "FIRST"
  "FOCUS"
  "FONT"
  "FOR"
  "FORMAT"
  "FRAME"
  "FROM"
  "FUNCTION"
  "GLOBAL"
  "HELP"
  "IF"
  "IMAGE"
  "IMAGE-SIZE"
  "IMAGE-SIZE-CHARS"
  "IMAGE-SIZE-PIXELS"
  "IMPORT"
  "IN"
  "INDEX"
  "INITIAL"
  "INPUT"
  "INPUT-OUTPUT"
  "IS"
  "KEEP-MESSAGES"
  "LABEL"
  "LANDSCAPE"
  "LAST"
  "LEAVE"
  "LIKE"
  "LIKE-SEQUENTIAL"
  "LOAD"
  "LOB-DIR"
  "MAP"
  "MESSAGE"
  "MESSAGES"
  "MOUSE-POINTER"
  "NAMESPACE-PREFIX"
  "NAMESPACE-URI"
  "NEXT"
  "NEW"
  "NON-SERIALIZABLE"
  "NORMAL"
  "NOT"
  "NUM-COPIES"
  "OBJECT"
  "OF"
  "ON"
  "OR"
  "OS-COMMAND"
  "OS-DELETE"
  "OTHERWISE"
  "OUTPUT"
  "PACKAGE-PRIVATE"
  "PACKAGE-PROTECTED"
  "PAGED"
  "PAGE-SIZE"
  "PAUSE"
  "PFCOLOR"
  "PORTRAIT"
  "PRESELECT"
  "PRIMARY"
  "PRINTER"
  "PRIVATE"
  "PROCEDURE"
  "PROTECTED"
  "PUBLIC"
  "PUT"
  "QUERY"
  "RELEASE"
  "RETURN"
  "RETURNS"
  "ROW"
  "RUN"
  "SEEK"
  "SERIALIZABLE"
  "SERIALIZE-NAME"
  "SET"
  "SHARED"
  "SILENT"
  "SIZE"
  "SIZE-CHARS"
  "SIZE-PIXELS"
  "SKIP"
  "SOCKET"
  "SOURCE"
  "STATIC"
  "STOP"
  "STREAM"
  "STREAM-HANDLE"
  "STRETCH-TO-FIT"
  "TARGET"
  "TEMP-TABLE"
  "THEN"
  "THROUGH"
  "THROW"
  "TITLE"
  "TO"
  "TOOLTIP"
  "TRIGGERS"
  "TTCODEPAGE"
  "UNBUFFERED"
  "UNDO"
  "UNFORMATTED"
  "UNIQUE"
  "UNTIL"
  "UPDATE"
  "USE-INDEX"
  "VAR"
  "VARIABLE"
  "VIEW-AS"
  "WAIT-FOR"
  "WHEN"
  "WHERE"
  "WHILE"
  "WIDTH"
  "WINDOW"
  "WITH"
  "WORD-INDEX"
  "WORK-TABLE"
  "X"
  "XML-DATA-TYPE"
  "XML-NODE-NAME"
  "XML-NODE-TYPE"
  "Y"
] @keyword

(function_definition name: (identifier) @function)
(function_forward_definition name: (identifier) @function)
(procedure_definition name: (identifier) @function)
(procedure_forward_definition name: (identifier) @function)
(function_call function: (identifier) @function)
(function_call function: (qualified_name) @function)
(function_call function: (object_access) @function)
(function_call function: (scoped_name) @function)
(run_statement procedure: (procedure_name) @function)
(run_statement procedure: (identifier) @function)
(run_statement procedure: (qualified_name) @function)
(function_parameter name: (identifier) @variable)
(parameter_definition name: (identifier) @variable)
(variable_definition name: (identifier) @variable)
(buffer_definition name: (identifier) @variable)
(stream_definition name: (identifier) @variable)
(query_definition name: (identifier) @variable)
(image_definition name: (identifier) @variable)
(temp_table_definition name: (identifier) @type)
(work_table_definition name: (identifier) @type)
(temp_table_field name: (identifier) @property)
(work_table_field name: (identifier) @property)
(temp_table_index name: (identifier) @property)
(work_table_index name: (identifier) @property)
(_ type: (_) @type)
(access_modifier) @keyword
(static_modifier) @keyword
(serialization_modifier) @keyword
(shared_variable_scope) @keyword
(no_undo) @keyword
(no_error) @keyword
(no_lock) @keyword
(exclusive_lock) @keyword
(assignment_operator) @operator

[
  "AND"
  "BEGINS"
  "EQ"
  "GE"
  "GT"
  "LE"
  "LT"
  "MATCHES"
  "MOD"
  "NE"
  "NOT"
  "OR"
] @operator

[
  "<"
  "<="
  "<>"
  "="
  ">"
  ">="
  "+"
  "-"
  "*"
  "/"
] @operator
