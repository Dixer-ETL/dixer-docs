# Make a HTTP request

Dixer provides a way to make a HTTP request with this request types: `POST`, `GET`, `DELETE`, `PUT`, `HEAD`, `OPTIONS`, `PATCH`, `CONNECT`, and `TRACE`.

To use it, create a job with type `httprequest`.

Keys:

- `connection_id`: mandatory. Connection ID. String.
- `request_type`: mandatory. Specify request type type. String.
- `request_type_var`: optional. Variable for request type. String.
- `request_body`: optional. Specify body if necessary. String.
- `request_body_var`: optional. Variable for body if necessary. String.
- `save_output`: optional. Specify if result returned need to be saved. Bool. Default `false`
- `save_output_var`: optional. Variable save_output. String.
- `output_path`: optional. Specify output path of request result content. String.
- `output_path_var`: optional. Variable output path. String.
- `expected_status_code`: optional. Specify the expected http status code. Trigger error `8135` when not expected is returned. Int.
- `expected_status_code_var`: optional. Variable `expected_status_code`. String.

If `save_output` is `true` then a output path need to be specified.

Examples:

```toml
[[jobs]]
id = 'get_request_job'
name = 'Request GET'
type = 'httprequest'
request_type = 'get'
ignore_error = false
disable = false
connection_id = 'http-connection'
request_body = 'hola'
output_path = 'requestget.txt'
save_output = true
expected_status_code = 200
```

```toml
[[jobs]]
id = 'post_request_job'
name = 'Request POST'
type = 'httprequest'
request_type = 'post'
ignore_error = false
disable = false
connection_id = 'http-connection'
request_body = """
{\r
    \"name\": \"morpheus\",\r
    \"job\": \"leader\"\r
}"""
output_path = 'requestpost.txt'
save_output = true
```

!!! tip
    You can save the output in a variable setting the `output_path` to `variable::var_name`

!!! tip
    You can use this job type to download a file. To do this set to 0 the `timeout` key in your HTTP connection and set `url` with the link of file. Later, in your job, set `save_output` to true and `output_path` with the path of downloaded file.