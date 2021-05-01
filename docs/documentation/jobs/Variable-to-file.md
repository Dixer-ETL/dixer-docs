# Variable to file

Dixer provides a way to save the variable value to a file with `vartofile` job type.

If file exists, the result is appended in the file.

Keys

- `variable`: Optional. Cariable to update. String.
- `file`: Optional. File to save the value. String.
- `file_var`: Optional. Variable with the file to save the value. String.

Example:

```toml
[[jobs]]
id = 'save_datetime'
name = 'Datetime variable to file'
type = 'vartofile'
variable = "variable_with_datetime"
file = "test/out/datetime.txt"
```