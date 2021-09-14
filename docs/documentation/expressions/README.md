# Expressions

!!! info
    Note: for v1.x.x, go [here](v1/)

Expressions are used to change the value of a variable, to skip rows matched for avoid load in destination for `dataflow` and to use in your dataflow mapping like columns sources.

## Create a variable with expression value

To create a variable that is value is a expression, set the key `expression` to `true`.

Expressions returns the followed types:

- `string`
- `int`
- `float`
- `bool`
- `datetime`
- `map`

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
    value = "firstname + ' ' + lastname  + ' ' + toString(age)"
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
        value: firstname + ' ' + lastname  + ' ' + toString(age)
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
          "value": "firstname + ' ' + lastname + ' ' + toString(age)"
        }
      ]
    ```

!!! note
    `age` is a `int`, but `toString()` function convert it to `string`.


## Call variable with expression in other expression with Render method

To call a variable that holds a expression in other variable that is a expression too, use the method `Render`, Example: `variable_name.Render`.

### Use case

Save a custom datetime format in a variable and call it in other expressions. Example:

```toml
[[variables]]
name = 'customnow'
type = 'string'
expression = true
value = "replaceAll(NOW.Format('20060102150405.000'), '.', '')"

[[variables]]
name = 'logFileName'
expression = true
type = 'string'
value = "log' + '-' + customnow.Render + '.txt'"
```

## Builtin functions

See: [Builtin functions](Builtin-functions.md)

## Language definition

Dixer uses [Expr](https://github.com/antonmedv/expr/tree/v1.9.0) package for expressions support.

You can see the [Language Definition](https://github.com/antonmedv/expr/blob/v1.9.0/docs/Language-Definition.md) of this version to understand how works. Follow this guide adapted to cases tested in Dixer.

### Supported Literals

* **strings** - single and double quotes (e.g. `"hello"`, `'hello'`)
* **numbers** - e.g. `103`, `2.5`, `.5`
* **arrays** - e.g. `[1, 2, 3]`
* **booleans** - `true` and `false`
* **maps** - e.g. `{foo: "bar"}`
* **nil** - `nil`

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
firstname + lastname
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
age < 25 || age > somevar
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
firstname in ["santiago", "perla"]
```

```js
user.Group in ["human_resources", "marketing"]
```

```js
"foo" in {foo: 1, bar: 2}
```

### Numeric Operators

* `..` (range)

Example:

```javascript
age in 18..45
```

The range is inclusive:

```javascript
1..3 == [1, 2, 3]
```

### Ternary Operators

* `foo ? 'yes' : 'no'`

Example:

```javascript
age > 30 ? "mature" : "immature"
```

### Expr Builtin functions

* `len` (length of array, map or string)
* `all` (will return `true` if all element satisfies the predicate)
* `none` (will return `true` if all element does NOT satisfies the predicate)
* `any` (will return `true` if any element satisfies the predicate)
* `one` (will return `true` if exactly ONE element satisfies the predicate)
* `filter` (filter array by the predicate)
* `map` (map all items with the closure)
* `count` (returns number of elements what satisfies the predicate)

Examples:

Ensure all tweets are less than 280 chars.

```js
all(Tweets, {.Size < 280})
```

Ensure there is exactly one winner.

```js
one(Participants, {.Winner})
```

### Closures

* `{...}` (closure)

Closures allowed only with builtin functions. To access current item use `#` symbol.

```js
map(0..9, {# / 2})
```

If the item of array is struct, it's possible to access fields of struct with omitted `#` symbol (`#.Value` becomes `.Value`).

```js
filter(Tweets, {len(.Value) > 280})
```

### Slices (used when map has array)

* `array[:]` (slice)

Slices can work with arrays or strings.

Example:

Variable `array` is `[1,2,3,4,5]`.

```js
array[1:5] == [2,3,4] 
array[3:] == [4,5]
array[:4] == [1,2,3]
array[:] == array
```