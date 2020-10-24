# Make a SOAP request

Dixer provides a way to make a SOAP request. To use it, create a job with type `soaprequest`.

Keys:

- `connection_id`: mandatory. Connection ID. String.
- `method`: mandatory. Specify SOAP method. String.
- `method_var`: optional. Variable for SOAP method. String.
- `params`: optional. Specify parameters names if necessary. Array String.
- `params_var`: optional. Variable for parameters names if necessary. Array String.
- `params_value`: optional. Specify parameters values if necessary. Array String.
- `params_value_var`: optional. Variable for parameters values if necessary. Array String.
- `save_output`: optional. Specify if result returned need to be saved. Bool. Default `false`
- `save_output_var`: optional. Variable save_output. String.
- `output_path`: optional. Specify output path of request result content. String.
- `output_path_var`: optional. Variable output path. String.

If there are `params` then should have `params_value` specified.

Examples:

```toml
[[jobs]]
id = 'soap_job'
name = 'Request SOAP'
type = 'soaprequest'
ignore_error = false
disable = false
connection_id = 'http-connection'
method = 'GetIpLocation'
output_path = 'requestsoap.txt'
params = [
    'sIp',
]
params_value = [
    '8.8.8.8',
]
save_output = true
method_var = 'soapmethod'
output_path_var = ''
params_var = [
    'soapparam',
]
params_value_var = [
    'soapparamvalue',
]
save_output_var = ''
```

!!! tip
    You can save the output in a variable setting the `output_path` to `variable::var_name`