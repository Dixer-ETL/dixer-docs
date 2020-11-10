# S3 operations

Dixer provides a way to do Amazon S3 operations like download or upload a file, etc...

To do this, set the job with type `s3operation`.

The key `bucket` or `bucket_var` should be filled with the target bucket to do the task.

This job type has a key to define the file operation. The key is `operation` and accepts this values:

- `uploadfile`: Upload a file.
- `uploaddir`: Upload a directory.
- `downloadfile`: Download a file.
- `deletefile`: Delete a remote file.

For some operations, keys are differents.

## `uploadfile` and `downloadfile` operations

- `local_filepath`: mandatory. The local file path to upload/download. String.
- `local_filepath_var`: optional. Variable with the local file path. String.
- `remote_filepath`: mandatory. The remote file path. String.
- `remote_filepath_var`: optional. Variable with the remote file path. String.

Example:

```toml
[[jobs]]
id = 'file_uploading'
name = 'S3 Upload'
type = 's3operation'
operation = 'uploadfile'
ignore_error = false
disable = false
connection_id = 'aws-connection'
bucket = 'bucketid'
local_filepath = 'test/file.xlsx'
remote_filepath = 'data/fileuploaded.xlsx'
local_filepath_var = ''
remote_filepath_var = ''
```

Example to download:

```toml
[[jobs]]
id = 'file_downloading'
name = 'S3 Download'
type = 's3operation'
operation = 'downloadfile'
ignore_error = false
disable = false
connection_id = 'aws-connection'
bucket = 'bucketid'
local_filepath = 'test/filedownloaded.xlsx'
remote_filepath = 'data/file.xlsx'
local_filepath_var = ''
remote_filepath_var = ''
```

## `deletefile` operation

- `remote_filepath`: mandatory. The remote file path. String.
- `remote_filepath_var`: optional. Variable with the remote file path. String.

Example:

```toml
[[jobs]]
id = 'file_delete'
name = 'S3 Delete file'
type = 's3operation'
operation = 'deletefile'
ignore_error = false
disable = false
connection_id = 'aws-conn'
bucket = 'bucketid'
remote_filepath = 'data/file.xlsx'
remote_filepath_var = ''
```

!!! tip
    You can delete an empty directory with this operation adding backslash at the end of the directory.


## `uploaddir` operation

- `local_directory`: mandatory. The local directory. String.
- `local_directory_var`: optional. Variable with the local directory. String.

```toml
[[jobs]]
id = 'dir_upload'
name = 'S3 Upload directory'
type = 's3operation'
operation = 'uploaddir'
ignore_error = false
disable = false
connection_id = 'aws-connection'
local_directory = "Path of local directory"
```