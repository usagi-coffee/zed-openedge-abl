; Comments
(comment) @comment

; Core statements / directives
[
  (add_table_statement)
  (add_field_statement)
  (add_index_statement)
  (table_tuning)
  (field_tuning)
  (index_tuning)
  (footer)
] @keyword

; Named entities
(add_table_statement
  table: (double_quoted_string) @type)

(add_field_statement
  field: (double_quoted_string) @property
  table: (double_quoted_string) @type
  type: (primitive_type) @type)

(add_index_statement
  index: (double_quoted_string) @label
  table: (double_quoted_string) @type)

; Types and special values
(primitive_type) @type
(null_expression) @constant
(sort_order) @keyword

; Literals
(double_quoted_string) @string
(number_literal) @number
