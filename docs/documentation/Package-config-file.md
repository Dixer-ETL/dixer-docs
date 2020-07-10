# Package Config File (PCF)

The package config file (PCF) is the file containing all your workflow.

This can be in 3 differents formats: TOML, YAML or JSON.

The default format for Dixer is TOML. If you want to use a different format then specify it in command line with `--format` or `-fmt` (`json`|`yaml`).

The file can have this keys configurations:

- `exec_workflow`: Optional. Key to configured your workflow with IDs of **Jobs**. See [The key `exec_workflow`](Key-exec-workflow.md). string.
- `num_cpu`: Optional. Sets the number of logical processors to use. Int. Default is the total of logical processors.
- `gc_percent`: Optional. Sets the garbage collection target percentage. Int. Default `100`.
- `variables`: Optional. Array of objects containing variables configurations.
- `log`: Optional. Key where value is a object with the logger configuration.
- `connections`: Optional. Array of objects containing connections configurations.
- `jobs`: Mandatory. Array of objects containing **Jobs** configurations.

!!! note
    When you are creating your PCF, there are keys for your worflow works, but you also can add customized keys to meet your needs, Dixer will ignored at execution.

    The PCF has keys with suffix `_var`, when there are set and contains a value (should be a variable) then this is used.

    The order of keys isn't important in PCF.

    `gc_percent` only is set when value is different to 0 and 100.

    `num_cpu` only is set when value is greater than 0 and is different that total logical processors.