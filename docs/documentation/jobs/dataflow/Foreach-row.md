# Foreach Row

Dixer provides a way to exec a workflow for each row transferred to destination.

To add this functionality, add to the job type `dataflow` the object key `foreach_row`.

Keys:

- `exec_workflow`: The workflow to execute. String.
- `disable`: Disable the foreach row. Bool

Example:

```toml
[jobs.foreach_row]
exec_workflow = 'csv_to_xlsx,mysql_to_hanadb:delay_5seconds:job_delete_files'
disable = false
```

!!! warning
    When destination is a database, this feature will be executed for every column processed instead transferred if use batch insert, fast load or bulk copy. 
    
    Example:

    If batch insert is true to 25 rows per batch, the foreach row will be executed 25 times before insert the 25 rows in database because this feature works for rows processed instead work transferred in this case and other mentioned above.