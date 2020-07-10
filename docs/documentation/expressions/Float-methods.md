# List of methods for float values variables

List of methods for float. Consider name of variable is `f` and value is `12.50` for all examples.

## `ToString()`

Returns the value of the variable in string. Example:

```javascript
f.ToString().Value //returns "12.5"
```

```javascript
f.ToString().ReplaceAll('1','0').Value //returns "02.5"
```

## `ToFloat()`

Returns the value of the variable in int type. Used for convert to do operations with int variables. Example:

```javascript
f.ToInt().Value //returns 12
```

## `Ceil()`

Returns the value of the variable in int type rounded up. Example:

```javascript
f.Ceil().Value //returns 13
```

## `Floor()`

Returns the value of the variable in int type rounded down. Example:

```javascript
f.Floor().Value //returns 11
```

## `ToBool()`

Returns a bool. If `f` value is `1` returns `true`, otherwise `false`. Example:

```javascript
f.ToBool().Value //returns false
```