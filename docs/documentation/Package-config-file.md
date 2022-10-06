# Package Config File (PCF)

The package config file (PCF) is the file containing all your workflow.

This can be in 3 differents formats: TOML, YAML or JSON.

The default format for Dixer is TOML. If you want to use a different format then specify it in command line with `--format` or `-fmt` (`json`|`yaml`).

!!! note
    From v2.2.0 the type now is read from file extension without need to specify PCFformat with `-fmt, --format`. Supported `json, toml, tml, yaml, yml`.

The file can have this keys configurations:

- `exec_workflow`: Optional. Key to configure your workflow with IDs of **Jobs**. See [The key `exec_workflow`](Key-exec-workflow.md). string.
- `env_file_path`: Optional. Key with file path of environment variables files of PCF. See [Environment variables file](Env-file.md). string.
- `variables`: Optional. Array of objects containing variables configurations. See [Create a variable](Create-a-variable.md).
- `variables_file_path`: Optional. File path containing the variables to avoid putting in the main PCF file.
- `log`: Optional. Key where value is a object with the logger configuration. See [Log](Log.md).
- `connections`: Optional. Array of objects containing connections configurations. See [Create a connection](Create-a-connection.md).
- `connections_file_path`: Optional. File path containing the connections to avoid putting in the main PCF file.
- `connections_file_path_var`: Optional. Variable defined with the file path of connections file.
- `jobs`: Mandatory. Array of objects containing **Jobs** configurations. See [Jobs types](Jobs-types.md).
- `num_cpu`: Optional. Sets the number of logical processors to use. Int. Default is the total of logical processors.
- `gc_percent`: Optional. Sets the garbage collection target percentage. Int. Default `100`.

!!! note
    When you are creating your PCF, there are keys for your worflow works, but you also can add customized keys to meet your needs, Dixer will ignored at execution.

    The PCF has keys with suffix `_var`, when there are set and contains a value (should be a variable) then this is used.

    The order of keys isn't important in PCF.

    `gc_percent` only is set when value is different to 0 and 100.

    `num_cpu` only is set when value is greater than 0 and is different that total logical processors.