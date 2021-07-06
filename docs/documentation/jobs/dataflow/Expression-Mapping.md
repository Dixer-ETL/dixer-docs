# Expression Mapping

This feature allows to add a derivated column or modify the current column value in your mapping that evaluates a expression or get the value of a variable for a new mapping column.

It's possible to evaluate the value of a mapping and create a derivated column with expression with the key `source_is_expression` in `true` and format the expression in this form in the column source:

```javascript
mapping.string.0.Value + ' ' + mapping.string.1.Value
```

This means that the column is a expression where mapping index 0 will be concatenated with mapping index 1. Example mapping:

```toml
[[jobs.mapping]]
column_source = 'firstname'
column_destination = 'firstname'

[[jobs.mapping]]
column_source = 'lastname'
column_destination = 'lastname'

[[jobs.mapping]]
column_source = 'mapping.string.0.Value + ' ' + mapping.string.1.Value'
source_is_expression = true
column_destination = 'concatenated_name'
```

The expression mapping can be a normal expression without a mapping index column, but in v1.7.0 and below, the expression mapping should have always a mapping column index. If there isn't a  mapping index it will through an error.

The `string` in the expression mapping it's the expected type of value. If value is a integer for example, it will be converted, but if you specified `int` and the value returned in the mapping is a string and cannot be converted to int, then an error is triggered.

If you change the order, the index also changes. This example add `concatenated_name` to beginning:

```toml
[[jobs.mapping]]
column_source = 'mapping.string.1.Value + ' ' + mapping.string.2.Value'
source_is_expression = true
column_destination = 'concatenated_name'

[[jobs.mapping]]
column_source = 'firstname'
column_destination = 'firstname'

[[jobs.mapping]]
column_source = 'lastname'
column_destination = 'lastname'
```

Also you can omit the columns for only get the derivated column:

```toml
[[jobs.mapping]]
column_source = 'mapping.string.1.Value + " " + mapping.string.2.Value'
source_is_expression = true
column_destination = 'concatenated_name'

[[jobs.mapping]]
column_source = 'firstname'
column_destination = 'firstname'
omit = true

[[jobs.mapping]]
column_source = 'lastname'
column_destination = 'lastname'
omit = true
```

## Apply expression to same column

You can modify the same column using `this` instead index and the key `apply_expression` with the expression instead `source_is_expression`:

```toml
[[jobs.mapping]]
column_source = 'firstname'
column_destination = 'firstname'
omit = true

[[jobs.mapping]]
column_source = 'lastname'
apply_expression = 'mapping.string.0.Value + " " + mapping.string.this.Value'
column_destination = 'fullname'
```

## With variables

Also is possible to add a variable value, simply add a mapping where column source key `source_is_variable` is `true` and `column_source` is the name of a variable. Example:

```toml
[[jobs.mapping]]
column_source = 'my_variable'
source_is_variable = true
column_destination = 'lastname'
```

The variable can be any type, it will converted. Also the variable can have a expression.