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
  table: (string_literal) @type)

(add_field_statement
  field: (string_literal) @property
  table: (string_literal) @type
  type: (type) @type)

(add_index_statement
  index: (string_literal) @label
  table: (string_literal) @type)

; Types and special values
(type) @type
(sort_order) @keyword

; Literals
(string_literal) @string
(number_literal) @number
(null_literal) @constant
(date_literal) @constant
