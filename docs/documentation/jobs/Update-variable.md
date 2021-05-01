# Update a variable

Dixer provides a way to update a variable value with `updatevar` job type.

Keys

- `variable`: Optional. Cariable to update. String.
- `value`: Optional. New value for variable. String.

Example:

```toml
[[jobs]]
id = 'update_a'
name = 'Update a Variable'
type = 'updatevar'
variable = 'a'
value = 'new value'
```