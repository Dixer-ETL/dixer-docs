# File exists

Dixer provides a way to know if a file exists with `fileexists` job type.

Keys

- `file`: Optional. File path to check if exists. String.
- `file_var`: Optional. Variable with the file path to check if exists value. String.

If file not exists, an error is returned.

Example:

```toml
[[jobs]]
id = 'file_exists'
name = 'Check if file exists'
type = 'fileexists'
file = "test/out/file.txt"
```