# Create a variable

The variable types are:

- string
- int
- float
- bool
- datetime

To create a variable is used the array of objects `variables`. Example creating two variables:

=== "TOML"
    ``` toml
    [[variables]]
    name = 'firstname'
    type = 'string'
    value = 'santiago'

    [[variables]]
    name = 'age'
    type = 'int'
    value = '25'
    ```

=== "YAML"
    ``` yaml
    variables:
      - name: firstname
        type: string
        value: 'santiago'
      - name: age
        type: int
        value: '25'
    ```

=== "JSON"
    ``` json
      "variables": [
        {
          "name": "firstname",
          "type": "string",
          "value": "santiago"
        },
        {
          "name": "age",
          "type": "int",
          "value": "25"
        }
      ]
    ```

For a datetime variable, there are the additional key `datetime_format` to defined the format of the value:

```toml
[[variables]]
name = 'birthdate'
type = 'datetime'
value = "2020-01-01"
datetime_format = '2006-01-02'
```

The keys `name`, `type`, `value` and `datetime_format` are strings. The `value` key is optional for `string` variable type if this is empty.

It's possible to get value of an environment variable in the OS. Use the boolean key `env` and set to `true`. You can omit the `value` key.

To declare a variable that represents a expression in the value, use the boolean key `expressions` and set to `true`. Its values are evaluated with a expression, for example, concatenating these two variables the expression for type string will be:

`firstname.Value + ' ' + age.ToString().Value`

**For expressions see [Expressions](expressions/README.md).*

The variables can be set in:

- Package config with initial values.
- Executing a package with Dixer binary with option `--variable` or `-v`. Example: `-v firstname="Santiago De la Cruz" -v age=25`. *For more see [Command line](Command-line.md).*
- In job type `dataflow`: you can choose the source and destination will be Variables.
- In job type `dataflow`: use like derivated columns to create a column in the mapping.

**Variables that are expressions cannot be set because its values are calculated.*

!!! info
    It's possible to get value of variables in different type for `bool`, `string`, `int` and `float` types. Example: if a key is `int` like the `port` key creating a connection, and you want to use `port_var` and assign a variable, this variable can be one of mentioned variables, Dixer makes a implicit conversion.