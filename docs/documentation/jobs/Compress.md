# Compress

Dixer provides a way to compress files and directories to a zip file.

Keys

- `files`: Optional. The list of files and directories in array to compress. Array String.
- `files_var`: Optional. Variable with the list of files and directories to compress separated by pipe (|). String.
- `destination_file`: Optional. The destination zip file path. String.
- `destination_file_var`: Optional. Variable with the destination zip file path value. String.

Example:

```toml
[[jobs]]
id = '197'
name = 'Compress 1'
type = 'compress'
ignore_error = false
disable = false
files = ["test/pcf","test/in/data.csv"]
files_var = ""
destination_file = 'test/out_files/compressed.zip'
destination_file_var = ''
```

Empty keys can be omitted.