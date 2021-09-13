# List of methods for bool values variables

List of methods for bool. Consider name of variable is `b` and value is `true` for all examples.

## `ToString()`

Returns the value of the variable in string. `true` if true and `false` if false. Example:

```javascript
b.ToString().Value //returns "true"
```

## `Custom(t string, f string)`

Returns the value of the variable in string but with custom string returned. `t` if true and `f` if false. Example:

```javascript
b.Custom('TRUE','FALSE').Value //returns "TRUE"
```

```javascript
b.Custom('1','0').Value //returns "1"
```

```javascript
b.Custom('yes','no').Value //returns "yes"
```

## `Negate()`

Returns a bool inverted. Example:

```javascript
b.Negate().Value //returns false
```

```javascript
b.Negate().Negate().Value //returns true
```