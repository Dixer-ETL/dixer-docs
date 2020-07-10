# List of methods for datetime values variables

List of methods for datetime. Consider name of variable is `t` and value is `2020-08-14 18:05:01.123456789` for all examples.

## `Format(f string)`

Returns the value of the variable in string in defined format defined in `f`. Example:

```javascript
t.Format('2006-01-02').Value //returns "2020-08-14"
```

```javascript
t.Format('15:04:05').Value //returns "18:05:01"
```

```javascript
t.Format('02/01/2006 04:05.000').Value //returns "14/08/2020 05:01.123"
```