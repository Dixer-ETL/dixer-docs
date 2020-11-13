# Job types

The **Jobs** are the tasks that Dixer executes.

The supported are:

- [`dataflow`](jobs/dataflow/Migrate-from-source-to-destination.md): used for data migration.
- [`query`](jobs/Exec-a-query.md): to execute a query in a database.
- [`process`](jobs/Exec-a-process.md): to execute a process, script or program.
- [`delay`](jobs/Exec-a-delay.md): to wait a duration specified.
- [`httprequest`](jobs/Make-a-HTTP-request.md): to make a HTTP request.
- [`soaprequest`](jobs/Make-a-SOAP-request.md): to make a HTTP request to a SOAP webservice.
- [`fileoperation`](jobs/File-operations.md): to execute a file system task (copy, move, rename, etc...).
- [`ftpoperation`](jobs/FTP-operations.md): to execute a FTP operation (upload, download, etc...).
- [`mail`](jobs/Send-a-mail.md): to send a email.
- [`bucle`](jobs/Bucle.md): to execute a workflow in bucle.
- [`jobsgroup`](jobs/Jobs-group.md): to execute a workflow like a unique job.
- [`compress`](jobs/Compress.md): to compress files and directories in a zip file.
- [`decompress`](jobs/Decompress.md): to decompress a zip file in a given path.

!!! note "Important note"
        All job types have these keys:

        - `id`: mandatory ID of the job with need to match `[a-zA-Z0-9_]+`. String.
        - `name`: optional name of the job. String.
        - `type`: mandatory type of the job. String.
        - `disable`: optional to enable or disable the job. Bool. Default `false`.
        - `ignore_error`: optional key to exit or not when an error happens. Bool. Default `false`.
        - `os`: optional key to defined a [comma separated list of operative system](OS-list.md) that job can run. If empty, no OS restriction. String.
