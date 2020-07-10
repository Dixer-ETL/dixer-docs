# FTP operations

Dixer provides a way to do FTP operations like download or upload a file, etc...

To do this, set the job with type `ftpoperation`.

This job type has a key to define the file operation. The key is `operation` and accepts this values:

- `uploadfile`: Upload a file.
- `downloadfile`: Download a file.
- `renamefile`: Rename a remote file.
- `deletefile`: Delete a remote file.
- `deletedir`: Delete a remote directory.
- `createdir`: Create a remote directory.

For some operations, keys are differents.

## `uploadfile` operation keys

- `local_filepath`: mandatory. The local file path to upload. String.
- `local_filepath_var`: optional. Variable with the local file path. String.
- `remote_filepath`: mandatory. The remote file path. String.
- `remote_filepath_var`: optional. Variable with the remote file path. String.

Example:

```toml
[[jobs]]
id = 'file_uploading'
name = 'FTP Upload'
type = 'ftpoperation'
operation = 'uploadfile'
ignore_error = false
disable = false
connection_id = 'ftp-connection'
local_filepath = 'test/file.xlsx'
remote_filepath = 'data/fileuploaded.xlsx'
local_filepath_var = ''
remote_filepath_var = ''
```

## `downloadfile` operation keys

- `local_filepath`: mandatory. The local file path to save the file downloaded. String.
- `local_filepath_var`: optional. Variable with the local file path. String.
- `remote_filepath`: mandatory. The remote file path. String.
- `remote_filepath_var`: optional. Variable with the remote file path. String.
- `chunk_size_kb`: optional. The chunk size of the download buffer. Int. Default 4 kilobytes.
- `chunk_size_kb_var`: optional. Variable with the chunk_size_kb. String.

Example:

```toml
[[jobs]]
id = 'file_downloading'
name = 'FTP Download'
type = 'ftpoperation'
operation = 'downloadfile'
ignore_error = false
disable = false
connection_id = 'ftp-connection'
local_filepath = 'test/filedownloaded.xlsx'
remote_filepath = 'data/file.xlsx'
local_filepath_var = ''
remote_filepath_var = ''
chunk_size_kb = 1000
chunk_size_kb_var = ''
```

## `renamefile` operation keys

- `new_name`: mandatory. The new name of remote file. String.
- `new_name_var`: optional. Variable with the new name. String.
- `remote_filepath`: mandatory. The remote file path. String.
- `remote_filepath_var`: optional. Variable with the remote file path. String.

Example:

```toml
[[jobs]]
id = 'file_rename'
name = 'FTP Rename file'
type = 'ftpoperation'
operation = 'renamefile'
ignore_error = false
disable = false
connection_id = 'ftp-conn'
remote_filepath = 'data/file.xlsx'
new_name = 'data/filerenamed.xlsx'
remote_filepath_var = ''
new_name_var = ''
```

## `deletefile` operation keys

- `remote_filepath`: mandatory. The remote file path. String.
- `remote_filepath_var`: optional. Variable with the remote file path. String.

Example:

```toml
[[jobs]]
id = 'file_delete'
name = 'FTP Delete file'
type = 'ftpoperation'
operation = 'deletefile'
ignore_error = false
disable = false
connection_id = 'ftp-connection'
remote_filepath = 'data/file.xlsx'
remote_filepath_var = ''
```

## `deletedir` and `createdir` operation keys

- `remote_directory`: mandatory. The remote directory. String.
- `remote_directory_var`: optional. Variable with the remote directory. String.

Example (apply for `deletedir` and `createdir`)

```toml
[[jobs]]
id = 'dir_delete'
name = 'FTP Delete directory'
type = 'ftpoperation'
operation = 'deletedir'
ignore_error = false
disable = false
connection_id = 'ftp-connection'
remote_directory = 'data'
remote_directory_var = ''
```