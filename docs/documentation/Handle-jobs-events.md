# Handle Jobs events

Dixer provides a way to execute a complete workflow depending the event returned of a job.

The 3 events supported are:

- success: when a job complete succesfully.
- error: when a job return an error.
- completion: when a job complete with success or error.

If `ignore_error` key is `false` in the job then events are triggered before Dixer exit with error.

To add this functionality in the job, use the object keys `event_success`, `event_error` or `event_completion`. Are optional.

You can use all events in a job, or some of them.

Keys:

- `exec_workflow`: The workflow to execute when the event is triggered. String.
- `disable`: Disable the event. Bool. Default `false`

Example with only success:

```toml
[jobs.event_success]
exec_workflow = 'send_mail_job'
disable = false
```

Example with success and error:

```toml
[jobs.event_success]
exec_workflow = 'send_mail_success'
disable = false

[jobs.event_error]
exec_workflow = 'send_mail_error'
disable = false
```

!!! info
    It's possible to create a bucle, for example, a job can call other job when error or another event, and the job called can call the origin job when success or another event.