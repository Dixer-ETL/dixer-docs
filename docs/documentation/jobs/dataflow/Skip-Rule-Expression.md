# Skip Rule Expression

Dixer provides a way to skip columns in the dataflow that matches with a expression. This need to return a bool.

For this, add in the job with type `dataflow` the objects key `skip`.

Keys:

- `rule`: mandatory if enabled. Specified the rule returning a bool with expression mapping. String.
- `rule_var`: optional. Specified var containing a rule. String.
- `disable`: optional. Disable the Skip Rule Expression for the job. Bool. Default `false`
- `disable_var`: optional. Specified var containing a bool to disable the Skip Rule Expression. String.

Example:

```toml
[jobs.skip]
rule = "mapping.string.0.Value == 'perla' || mapping.string.3.Value in ['peña','smith']"
rule_var = ""
disable = true
disable_var = ''
```

All rows matched with the expression will be omitted.