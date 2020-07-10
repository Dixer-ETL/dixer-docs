# Exec a query

Dixer provides a way to execute a query in a database. To do this create a job with type `query`.

Keys:

- `connection_id`: mandatory. The connection id. String.
- `query`: mandatory. The query to execute. String.

Example:

```toml
[[jobs]]
id = 'my_awesome_job_id'
name = 'Query MSSQL'
type = 'query'
disable = false
ignore_error = false
connection_id = 'mssql-connection'
query = "update testtbl set date_column = getdate()"
```

You can execute a query in all supported databases for Dixer.