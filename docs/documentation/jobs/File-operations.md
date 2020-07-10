# File operations

Dixer provides a way to do file operations like copy a file or directory, rename, move, etc...

To do this, set the job with type `fileoperation`.

This job type has a key to define the file operation. The key is `operation` and accepts this values:

- `copy`: Copy a file.
- `move`: Move a file or directory.
- `rename`: Rename a file or directory.
- `delete`: Delete a file.
- `deletedir`: Delete a directory.
- `createdir`: Create a directory.
- `copydir`: Copy a directory.

For some operations, keys are differents.

## `copy`, `move` and `rename` operations keys

- `source_file_path`: Optional. The source file path. String.
- `source_file_path_var`: Optional. Variable with the source file path. String.
- `destination_file_path`: Optional. The destination file path. String.
- `destination_file_path_var`: Optional. Variable with the destination file path. String.
- `overwrite_destination`: Optional. If exists in destination, will be overwritten if `true`. Bool. Default `false`.
- `overwrite_destination_var`: Optional. Variable with the overwrite_destination bool. String.

Example (apply for `copy`, `move` and `rename`):

```toml
[[jobs]]
id = 'copy_job'
name = 'File Copy'
type = 'fileoperation'
operation = 'copy'
ignore_error = false
disable = false
source_file_path = 'file_in.csv'
destination_file_path = 'file_out.csv'
overwrite_destination = true
source_file_path_var = ''
destination_file_path_var = ''
overwrite_destination_var = ''
```

## `delete` operation keys

- `file_path`: Optional. The file path. String.
- `file_path_var`: Optional. Variable with the file path. String.

Example:

```toml
[[jobs]]
id = 'delete_job'
name = 'File Delete'
type = 'fileoperation'
operation = 'delete'
ignore_error = false
disable = false
file_path = 'file_to_delete.csv'
file_path_var = ''
```

## `createdir` operation keys

- `folder_path`: Optional. The folder path. String.
- `folder_path_var`: Optional. Variable with the folder path. String.
- `permission`: Optional. The folder permission. Should be 3 octal digits. String. Default `755`.
- `permission_var`: Optional. Variable with the permission value. String.

```toml
[[jobs]]
id = 'createdir_job'
name = 'Create directory'
type = 'fileoperation'
operation = 'createdir'
ignore_error = false
disable = false
folder_path = 'test/folder_to_create'
folder_path_var = ''
permission = '777'
```

## `deletedir` operation keys

- `folder_path`: Optional. The folder path. String.
- `folder_path_var`: Optional. Variable with the folder path. String.

```toml
[[jobs]]
id = 'delete_job'
name = 'Delete directory'
type = 'fileoperation'
operation = 'deletedir'
ignore_error = false
disable = false
folder_path = 'test/folder_to_delete'
folder_path_var = ''
```

## `copydir` operation keys

- `source_folder_path`: Optional. The source folder path. String.
- `source_folder_path_var`: Optional. Variable with the source folder path. String.
- `destination_folder_path`: Optional. The destination folder path. String.
- `destination_folder_path_var`: Optional. Variable with the destination folder path. String.

!!! warning
    Existents files are replaced if folder exists.

Example:

```toml
[[jobs]]
id = 'copy_dir'
name = 'Folder Copy'
type = 'fileoperation'
operation = 'copydir'
ignore_error = false
disable = false
source_folder_path = 'test/folder_to_copy'
destination_folder_path = 'test/folder_copied'
source_folder_path_var = ''
destination_folder_path_var = ''
```