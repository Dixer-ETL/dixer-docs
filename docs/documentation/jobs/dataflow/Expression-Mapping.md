# Expression Mapping

This feature allows to add a derivated column in your mapping with evaluates a expression or get the value of a variable for a new mapping column.

It's possible to evaluate the value of a mapping and create a derivated column with expression with preffix `expr::` and format the expression in this form in the column source:

```javascript
expr::mapping.string.0.Value + ' ' + mapping.string.1.Value
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
column_source = 'expr::mapping.string.0.Value + ' ' + mapping.string.1.Value'
column_destination = 'concatenated_name'
```

The expression mapping should have always a mapping column index. If there isn't a  mapping index it will through an error.

The `string` in the expression mapping it's the expected type of value. If value is a integer for example, it will be converted, but if you specified `int` and the value returned in the mapping is a string and cannot be converted to int, then an error is triggered.

If you change the order, the index also changes. This example add `concatenated_name` to beginning:

```toml
[[jobs.mapping]]
column_source = 'expr::mapping.string.1.Value + ' ' + mapping.string.2.Value'
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
column_source = 'expr::mapping.string.1.Value + ' ' + mapping.string.2.Value'
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
# With variables

Also is possible to add a variable value, simply add a mapping where column source is preffixed with `variable::` and later the name of a variable. Example:

```toml
[[jobs.mapping]]
column_source = 'variable::my_variable'
column_destination = 'lastname'
```

The variable can be any type, it will converted. Also the variable can have a expression.