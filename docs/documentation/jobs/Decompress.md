# Decompress

Dixer provides a way to decompress files and directories from a zip file.

Keys

- `source_file`: Optional. The source zip file. String.
- `source_file_var`: Optional. Variable with the source zip file. String.
- `destination_path`: Optional. The destination folder (is created if not exists). String.
- `destination_path_var`: Optional. Variable with the destination folder value. String.

Example:

```toml
id = '199'
name = 'Decompress 1'
type = 'decompress'
ignore_error = false
disable = false
source_file = "test/out_files/compressed.zip"
source_file_var = ""
destination_path = "test/out_files/decompressed"
destination_path_var = ''
```

Empty keys can be omitted.