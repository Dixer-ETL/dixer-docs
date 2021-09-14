# Builtin functions

Dixer provides builtin functions to make complex expressions designed to complete the task.

!!! info
    These are builtin functions of Dixer, also, Expr has some builtin functions you can use [here](README.md#expr-builtin-functions)

## `toString(in Any)`

`in` can be `string`, `int`, `float`, `bool`, `datetime`, `map`.

Convert a variable or value to `string` representation.

Returns `string`.

Example:

```go
toString(1) // returns "1"
```

## `toInt(in)`

`in` can be `string`, `int`, `float`, `bool`.

Convert a variable or value to `int`.

Returns `int`.

Example:

```go
toInt("1") // returns 1 in int
```

## `toFloat(in)`

`in` can be `string`, `int`, `float`, `bool`.

Convert a variable or value to `float`.

Return `float`.

Example:

```go
toFloat(1) // returns 1 in float
```

## `toBool(in)`

`in` can be `string`, `int`, `float`, `bool`.

Convert a variable or value to `bool`.

Returns `bool`.

Example:

```go
toBool("TRUE") // returns true
```

## `varType(in Any)`

`in` can be `string`, `int`, `float`, `bool`, `datetime`, `map`.

Get `string` with variable type of `in`

Returns `string`.

Example:

```go
varType(1) // returns "int"
varType(now()) // returns "datetime"
varType("santiago") // returns "string"
```

## `customBoolString(in, t, f)`

`in` should be `bool`.
`t` and `f` should be `string`

Convert a `bool` to `string` but using custom values for `true` and `false`

Returns `string`.

Example:

```go
customBoolString(true, "IT'S TRUE!", "IT'S FALSE!") // returns "IT'S TRUE!"
```

## `negate(in)`

`in` should be `bool`.

Negate a `bool`

Returns `bool`.

Example:

```go
negate(true) // returns false
```

## `ceil(in)`

`in` should be `float`.

Ceil a `float` to next `int` value.

Returns `int`.

Example:

```go
ceil(12.15) // returns 13
```

## `floor(in)`

`in` should be `float`.

Floor a `float` to previous `int` value.

Returns `int`.

Example:

```go
floor(12.15) // returns 12
```

## `toStringDecimal(in, points)`

`in` should be `float`.
`points` should be `int`.

Convert a `float` to `string` with fixed decimal points.

Returns `string`.

Example:

```go
toStringDecimal(12.1513, 2) // returns "12.15"
```

## `format(in, fmt)`

`in` should be `datetime`.
`fmt` should be `string`.

Returns a `datetime` in `string` with defined format (`fmt`).

Returns `string`.

Example:

If `now()` is 2021-07-14 05:14:13.000

```go
format(now(), "2006-01-01") // returns "2021-07-14"
```

Also, all `datetime` variables has a builtin method to format called `Format`, so, the above is equivalent to:

```go
now().Format("2006-01-01") // returns "2021-07-14"
```

## `now()`

Returns a `datetime` with current date and time.

## `subString(in, start, end)`

`in` should be `string`.
`start` and `end` should be `int`.

`string` is like an array, start with 0.

Returns the a contiguous sequence of characters within a `string` variable or value, where `start` (included) and `end` (excluded) are `int`.

Returns `string`.

Example:

```go
subString("santiago", 1, 4) // returns "ant"
```

## `toUpper(in)`

`in` should be `string`.

Returns the uppercase string.

Returns `string`.

Example:

```go
toUpper("santiago") // returns "SANTIAGO"
```

## `toLower(in)`

`in` should be `string`.

Returns the lowercase string.

Returns `string`.

Example:

```go
toLower("SANTIAGO") // returns "santiago"
```

## `trimSpace(in)`

`in` should be `string`.

Returns the string with all leading and trailing spaces removed.

Returns `string`.

Example:

```go
trimSpace("    SANTIAGO     ") // returns "SANTIAGO"
```

## `replaceAll(in, old, new)`

`in`, `old` and `new` should be `string`.

Returns the string with all contiguous sequence of characters in `old` replaced by `new`. It's case sensitive.

Returns `string`.

Example:

```go
replaceAll("santiago", "san", "zo") // returns "zotiago"
```

## `replaceAllInsensitive(in, old, new)`

`in`, `old` and `new` should be `string`.

Returns the string with all contiguous sequence of characters in `old` replaced by `new`. It's case insensitive.

Returns `string`.

Example:

```go
replaceAllInsensitive("SANTIAGO", "san", "zo") // returns "zoTIAGO"
```

## `capitalize(in)`

`in` should be `string`.

Returns the string with all first letter of each word in uppercase.

Returns `string`.

Example:

```go
capitalize("santiago de la cruz") // returns "Santiago De La Cruz"
```

## `contains(in, substr)`

`in` and `substr` should be `string`.

Returns a `bool` if string `in` contains a contiguous sequence of characters in `substr`.

Returns `bool`.

Example:

```go
contains("santiago", "ia") // returns true
```

## `hasPrefix(in, prefix)`

`in` and `prefix` should be `string`.

Returns a `bool` if string `in` contains a contiguous sequence of characters in `prefix` at the start.

Returns `bool`.

Example:

```go
hasPrefix("santiago", "san") // returns true
```

## `hasSuffix(in, suffix)`

`in` and `suffix` should be `string`.

Returns a `bool` if string `in` contains a contiguous sequence of characters in `suffix` at the end.

Returns `bool`.

Example:

```go
hasSuffix("santiago", "ago") // returns true
```

## `equalFold(in, cmp)`

`in` and `cmp` should be `string`.

Returns a `bool` if `in` is equal to `cmp` under Unicode case-folding, which is a more general form of case-insensitivity.

Returns `bool`.

Example:

```go
equalFold("santiago", "SaNtIaGO") // returns true
```

## `repeat(in, n)`

`in` should be `string`.
`n` should be `int`.

Returns a `string` repeated `n` times.

Returns `string`.

Example:

```go
repeat("s", 3) // returns "sss"
```

## `getMD5(in)`

`in` should be `string`.

Returns the MD5 of `in`.

Returns `string`.

Example:

```go
getMD5("santiago") // returns "a6f30815a43f38ec6de95b9a9d74da37"
```

## `getMD5FilePath(in)`

`in` should be `string`.

Returns the MD5 of the file if `in` is a filepath.

Returns `string`.

Example:

```go
getMD5FilePath("path_of_file") // returns "md5_of_file"
```

## `regexReplace(in, regex, new)`

`in`, `regex`, `new` should be `string`.

Returns the replacement string matches with the specified regular expression. You can use `$` for groups.

Returns `string`.

Example:

```go
regexReplace("santiago", "(a)", "$1OK") // returns "saOKntiago"
```