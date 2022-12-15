# Bucle

Dixer provides a way to do a bucle like a for with `bucle` job type.

This job type execute a workflow with configured init and iteracions values.

Keys

- `counter_var`: Optional. A int variable to define the counter and is updated for each iteration with current `init` value.
- `init`: Optional. The init value of for. Int. Default `0`.
- `init_var`: Optional. Variable with the init value. String.
- `end`: Optional. The end value from init value of for. Int. Default `0`.
- `end_var`: Optional. Variable with the end value. String.
- `infinite`: Optional. Define if loop is infinite. Bool. Default `false`.
- `infinite_var`: Optional. Variable with the infinite value. String.
- `exec_workflow`: Mandatory: The workflow to execute.
- `break_condition`: Optional: To set expression to break the loop if condition is true. String

Example:

With infinite
```toml
[[jobs]]
id = '185'
name = 'Infinite BUCLE'
type = 'bucle'
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
name = 'BUCLE'
type = 'bucle'
ignore_error = false
disable = false
init = 1
end = 5
init_var = ''
end_var = ''
exec_workflow = '1:2'
```

Infinite with `break_condition`, this will break when variable `i` is > 10
```toml
[[jobs]]
id = '185'
name = 'Infinite BUCLE'
type = 'bucle'
infinite = true
exec_workflow = '41:192'
break_condition = 'i > 10'
```