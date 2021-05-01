# FTP operations

Dixer provides a way to do FTP operations like download or upload a file, etc...

To do this, set the job with type `ftpoperation`.

This job type has a key to define the file operation. The key is `operation` and accepts this values:

- `uploadfile`: Upload a file.
- `uploaddir`: Upload a directory.
- `downloadfile`: Download a file.
- `renamefile`: Rename a remote file.
- `deletefile`: Delete a remote file.
- `deletedir`: Delete a remote directory.
- `createdir`: Create a remote directory.
- `downloaddir`: Download a remote directory to local directory.

For some operations, keys are differents.

!!! warning
    In Dixer v1.4.0 and below, `local_file_path` is `local_filepath` and `remote_file_path` is `remote_filepath`.

## `uploadfile` operation keys

- `local_file_path`: mandatory. The local file path to upload. String.
- `local_file_path_var`: optional. Variable with the local file path. String.
- `remote_file_path`: mandatory. The remote file path. String.
- `remote_file_path_var`: optional. Variable with the remote file path. String.

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
local_file_path = 'test/file.xlsx'
remote_file_path = 'data/fileuploaded.xlsx'
local_file_path_var = ''
remote_file_path_var = ''
```

## `uploaddir` operation keys

- `local_directory`: mandatory. The local directory. String.
- `local_directory_var`: optional. Variable with the local directory. String.

Example:

```toml
[[jobs]]
id = 'dir_upload'
name = 'FTP Upload Directory'
type = 'ftpoperation'
operation = 'uploaddir'
ignore_error = false
disable = false
connection_id = 'ftp-connection'
local_directory = 'data/'
local_directory_var = ''
```

## `downloadfile` operation keys

- `local_file_path`: mandatory. The local file path to save the file downloaded. String.
- `local_file_path_var`: optional. Variable with the local file path. String.
- `remote_file_path`: mandatory. The remote file path. String.
- `remote_file_path_var`: optional. Variable with the remote file path. String.
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
local_file_path = 'test/filedownloaded.xlsx'
remote_file_path = 'data/file.xlsx'
local_file_path_var = ''
remote_file_path_var = ''
chunk_size_kb = 1000
chunk_size_kb_var = ''
```

## `renamefile` operation keys

- `new_name`: mandatory. The new name of remote file. String.
- `new_name_var`: optional. Variable with the new name. String.
- `remote_file_path`: mandatory. The remote file path. String.
- `remote_file_path_var`: optional. Variable with the remote file path. String.

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
remote_file_path = 'data/file.xlsx'
new_name = 'data/filerenamed.xlsx'
remote_file_path_var = ''
new_name_var = ''
```

## `deletefile` operation keys

- `remote_file_path`: mandatory. The remote file path. String.
- `remote_file_path_var`: optional. Variable with the remote file path. String.

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
remote_file_path = 'data/file.xlsx'
remote_file_path_var = ''
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

## `downloaddir` operation keys

- `remote_directory`: mandatory. The remote directory. String.
- `remote_directory_var`: optional. Variable with the remote directory. String.
- `local_directory`: mandatory. The local directory. String.
- `local_directory_var`: optional. Variable with the local directory. String.
- `chunk_size_kb`: optional. The chunk size of the download buffer. Int. Default 4 kilobytes.
- `chunk_size_kb_var`: optional. Variable with the chunk_size_kb. String.

```toml
[[jobs]]
id = 'download_dir'
name = 'FTP Download directory'
type = 'ftpoperation'
operation = 'downloaddir'
connection_id = 'ftp-connection'
remote_directory = 'f1'
local_directory = 'test/out/test17'
chunk_size_kb = 500
```