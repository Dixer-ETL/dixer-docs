# Expressions

Expressions are used to change the value of a variable, to skip rows matched for avoid load in destination for `dataflow` and to use in your dataflow mapping like columns sources.

## Create a variable with expression value

To create a variable that is value is a expression, set the key `expression` to `true`.

Expressions returns the followed types:

- `string`
- `int`
- `float`
- `bool`

Example to create a variable that returns a expression concatenating three variables values:

=== "TOML"
    ```toml
    [[variables]]
    name = 'firstname'
    type = 'string'
    value = 'santiago'

    [[variables]]
    name = 'lastname'
    type = 'string'
    value = 'de la cruz'

    [[variables]]
    name = 'age'
    type = 'int'
    value = '28'

    [[variables]]
    name = 'concatenate'
    type = 'string'
    expression = true
    value = "firstname.Value + ' ' + lastname.Value  + ' ' + age.ToString().Value"
    ```

=== "YAML"
    ```yaml
    variables:
      - name: firstname
        type: string
        value: santiago
      - name: lastname
        type: string
        value: de la cruz
      - name: age
        type: int
        value: 28
      - name: concatenate
        type: 'string'
        expression: true
        value: firstname.Value + ' ' + lastname.Value  + ' ' + age.ToString().Value
    ```

=== "JSON"
    ```json
    "variables": [
        {
          "name": "firstname",
          "type": "string",
          "value": "santiago"
        },
        {
          "name": "lastname",
          "type": "string",
          "value": "de la cruz"
        },
        {
          "name": "age",
          "type": "int",
          "value": "28"
        },
        {
          "name": "concatenate",
          "type": "string",
          "expression": true,
          "value": "firstname.Value + ' ' + lastname.Value + ' ' + age.ToString().Value"
        }
      ]
    ```

To get the value of a variable in a expression use `Value`. For example, if you want to capitalize your `concatenate` variable you can create another variable with expression `concatenate.Capitalize().Value` or change the value of `concatenate` variable to `firstname.Capitalize().Value + ' ' + lastname.Capitalize().Value  + ' ' + age.ToString().Capitalize.Value`

!!! note
    `age` is a `int`, but `ToString()` method convert it to `string` and you can use string methods after this.

!!! tip
    You can omit `Value` if the expression is simply one variable without operators and conditions.

For example, these are equal and returns the same:

```json
{
    "name": "firstname",
    "type": "string",
    "expression": true,
    "value": "firstname.ToUpper()"
}
```

and 

```json
{
    "name": "firstname",
    "type": "string",
    "expression": true,
    "value": "firstname.ToUpper().Value"
}
```

## Call variable with expression in other expression with Render method

To call a variable that holds a expression in other variable that is a expression too, use the method `Render`, Example: `variable_name.Render`.

### Use case

Save a custom datetime format in a variable and call it in other expressions. Example:

```toml
[[variables]]
name = 'customnow'
type = 'string'
expression = true
value = "NOW.Format('20060102150405.000').ReplaceAll('.','').Value"

[[variables]]
name = 'logFileName'
expression = true
type = 'string'
value = "log' + '-' + customnow.Render + '.txt'"
```

## Methods

The methods are defined by type of variable, means, methods for int cannot be used for string, a least you convert the returned value, after this, you can use string methods.

For example, with above variables, you can't use for `concatenate` the expression `firstname.Value + ' ' + lastname.Value + ' ' + age.Value` because age is an `int`, you first need to convert to string with `ToString()` method.

### String methods

See [String methods](String-methods.md)

### Int methods

See [Int methods](Int-methods.md)

### Float methods

See [Float methods](Float-methods.md)

### Bool methods

See [Bool methods](Bool-methods.md)

### Datetime methods

See [Datetime methods](Datetime-methods.md)

## Language definition

Dixer v1.x.x uses [Expr](https://github.com/expr-lang/expr/tree/v1.8.6) package for expressions support.

You can see the [Language Definition](https://github.com/expr-lang/expr/blob/v1.8.6/docs/Language-Definition.md) of this version to understand how works. Follow this guide adapted to cases tested in Dixer.

### Supported Literals

* **strings** - single and double quotes (e.g. `"hello"`, `'hello'`)
* **numbers** - e.g. `103`, `2.5`, `.5`
* **arrays** - e.g. `[1, 2, 3]`
* **booleans** - `true` and `false`

## Supported Operators

Expr comes with a lot of operators:

### Arithmetic Operators

* `+` (addition)
* `-` (subtraction)
* `*` (multiplication)
* `/` (division)
* `%` (modulus)
* `**` (pow)

Example:

```javascript
firstname.Value + lastname.Value
``` 

### Digit separators

Integer literals may contain digit separators to allow digit grouping into more legible forms.

Example:

```
10_000_000_000
```

### Comparison Operators

* `==` (equal)
* `!=` (not equal)
* `<` (less than)
* `>` (greater than)
* `<=` (less than or equal to)
* `>=` (greater than or equal to)

### Logical Operators

* `not` or `!`
* `and` or `&&`
* `or` or `||`

Example:

```
age.Value < 25 || age.Value > somevar.Value
```

### String Operators

* `+` (concatenation)
* `matches` (regex match)
* `contains` (string contains)
* `startsWith` (has prefix)
* `endsWith` (has suffix)

To test if a string does *not* match a regex, use the logical `not` operator in combination with the `matches` operator:

```javascript
not ("foo" matches "^b.+")
```

You must use parenthesis because the unary operator `not` has precedence over the binary operator `matches`.

Example:

```javascript
'Arthur' + ' ' + 'Dent'
```

Result will be set to `Arthur Dent`.

### Membership Operators

* `in` (contain)
* `not in` (does not contain)

Example:

```javascript
firstname.Value in ["santiago", "perla"]
```

### Numeric Operators

* `..` (range)

Example:

```javascript
age.Value in 18..45
```

The range is inclusive:

```javascript
1..3 == [1, 2, 3]
```

### Ternary Operators

* `foo ? 'yes' : 'no'`

Example:

```javascript
age.Value > 30 ? "mature" : "immature"
```
