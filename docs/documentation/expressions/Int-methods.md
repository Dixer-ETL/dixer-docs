# List of methods for int values variables

List of methods for integers. Consider name of variable is `n` and value is `12` for all examples.

## `ToString()`

Returns the value of the variable in string. Example:

```javascript
n.ToString().Value //returns "12"
```

```javascript
n.ToString().ReplaceAll('1','0').Value //returns 02
```

## `ToFloat()`

Returns the value of the variable in float type. Used for convert to do operations with float variables. Example:

```javascript
n.ToFloat().Value //returns 12
```

## `ToBool()`

Returns a bool. If `n` value is `1` returns `true`, otherwise `false`. Example:

```javascript
n.ToBool().Value //returns false
```