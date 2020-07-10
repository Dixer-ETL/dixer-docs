# Exec a process

Dixer provides a way to execute a process. This will be a program, a batch, or cli command.

To do this create a job with type `process`.

Keys:

- `process_path`: optional. The path of the process or process itself. String.
- `process_path_var`: optional. Variable with process to execute. String.
- `arguments`: optional. list of arguments and options. Array string.
- `save_output`: optional. Specified if the output will be saved. Bool.
- `save_output_var`: optional. Variable with save output value bool. String.
- `output_path`: optional. The path of the output of process executed. String.
- `output_path_var`: optional. Variable with output path. String.
- `timeout`: optional. A timeout in seconds for stop the execution when is reached. Int.
- `timeout_var`: optional. Variable with timeout in seconds. String.
- `expected_code`: optional. A expected_code to make this job succedd. Int. Default `0`.
- `expected_code_var`: optional. Variable with expected_code integer. String.


If `save_output` is `true` then a output path need to be specified.

Example:

```toml
[[jobs]]
id = 'process_job'
name = 'Ping google 3 times'
type = 'process'
ignore_error = true
disable = false
process_path = 'ping'
arguments = [
    'google.com',
	'-n',
    '3',
]
output_path = 'PATH_TO_SAVE_OUTPUT'
timeout = 0
expected_code = 0
save_output = true
```

!!! warning
    On Windows, if process path and at least one argument contains spaces the job will create a temporal .bat file in same directory that Dixer binary. This is a work around of this [bug](https://github.com/golang/go/issues/17149). This work around can be fail for complex command.