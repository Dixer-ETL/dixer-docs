# Log

The Dixer workflow process is printed in the terminal, but you can also save the same input in a file with the `log` object key.

Keys:

- `file_path`: the path of log file. String.
- `file_path_var`: key to set the variable with file path. String.
- `enable`: enable or disable the log. Bool.
- `enable_var`: key to set the variable with boolean value to enable or disable the log. String.
- `truncate_file`: if true, the log file is truncated before execution. Bool.
- `truncate_file_var`: key to set the variable with boolean value to truncate or not the log file. String.
- `hide_cli_output`: if true, the log will be hidden in terminal. Bool.
- `hide_cli_output_var`: key to set the variable with boolean value for hide_cli_output. String.