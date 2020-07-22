# For loop

Dixer provides a way to do a bucle like a for with `for` job type.

This job type execute a workflow with configured init and iteracions values.

Keys

- `init`: Optional. The init value of for. Int. Default `0`.
- `init_var`: Optional. Variable with the init value. String.
- `iterations`: Optional. The en value from init value of for. Int. Default `0`.
- `iterations_var`: Optional. Variable with the iterations value. String.
- `infinite`: Optional. Define if loop is infinite. Bool. Default `false`.
- `infinite_var`: Optional. Variable with the infinite value. String.
- `exec_workflow`: Mandatory: The workflow to execute.

Example:

With infinite
```toml
[[jobs]]
id = '185'
name = 'Infinite FOR'
type = 'for'
ignore_error = false
disable = false
infinite = true
infinite_var = ''
exec_workflow = '41:192'
```

Without infinite
```toml
[[jobs]]
id = '47'
name = 'FOR'
type = 'for'
ignore_error = false
disable = false
init = 1
iterations = 5
init_var = ''
iterations_var = ''
exec_workflow = '1:2'
```