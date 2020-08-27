# Exec a delay

Dixer provides a job for wait a custom duration. The job type is `delay`.

Keys:

- `duration`: optional. The duration in seconds. Int.
- `duration_var`: optional. A variable with the duration value. String.
- `custom_duration`: optional. The custom duration. String.
- `custom_duration_var`: optional. A variable with the custom duration value. String.

Custom duration has priority over Duration.

## Custom duration values

The custom duration is a string defined with time parts:

- `ns`: nanosecond.
- `µs`: microsecond.
- `ms`: millisecond.
- `s`: second.
- `m`: minute.
- `h`: hour.
- `d`: day.
- `w`: week.

For example, for 90 seconds you can set:

```
90s
```

or

```
1m30s
```

You can use decimals for seconds and below. For example, for wait 1 second and 20 nanoseconds set:

```
1s20ns
```

or

```
1.00000002s
```

Example job:

```toml
[[jobs]]
id = 'delay_job'
name = 'Delay one second custom'
type = 'delay'
disable = false
ignore_error = false
custom_duration = '1s'
```

```toml
[[jobs]]
id = 'delay_job'
name = 'Delay one second normal'
type = 'delay'
disable = false
ignore_error = false
duration = 1
```