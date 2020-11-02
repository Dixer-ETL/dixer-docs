# List of methods for string values variables

List of methods for strings. Consider name of variable is `st` and value is ` abcdefgh ijklmnop ` (*note spaces at start and end*) for all examples.

## `SubString(a int, b int)`

Returns the a contiguous sequence of characters within a string variable, where `a` (excluded) and `b` (included) are `int`. Examples:

```javascript
st.SubString(4,6).Value //returns "de"
```

```javascript
st.SubString(4,7).Value //returns "def"
```

```javascript
st.SubString(4,8).Value //returns "defg"
```

```javascript
st.SubString(4,100).Value //returns "defgh ijklmnop "
```

```javascript
st.SubString(1,2).Value //returns "a"
```

```javascript
st.SubString(0,2).Value //returns " a"
```

## `ToUpper()`

Returns the string in uppercase. Example:

```javascript
st.ToUpper().Value //returns " ABCDEFGH IJKLMNOP "
```

## `ToLower()`

Returns the string in lowercase. Example:

```javascript
st.ToLower().Value //returns " abcdefgh ijklmnop "
```

## `TrimSpace()`

Returns the string with all leading and trailing spaces removed. Example:

```javascript
st.TrimSpace().Value //returns "abcdefgh ijklmnop"
```

## `ReplaceAll(old string, new string)`

Returns the string with all contiguous sequence of characters in `old` replaced by `new`. Examples:

```javascript
st.ReplaceAll(' ','').Value //returns "abcdefghijklmnop"
```

```javascript
st.ReplaceAll('abcd','ZZZZ').Value //returns " ZZZZefgh ijklmnop "
```

```javascript
st.ReplaceAll(' ','').ReplaceAll('abcd','ZZZZ').Value //returns "ZZZZefghijklmnop"
```

## `Capitalize()`

Returns the string with all first letter of each word in uppercase. Example:

```javascript
st.Capitalize().Value //returns " Abcdefgh Ijklmnop "
```

## `Contains(s string)`

Returns a bool if string contains a contiguous sequence of characters in `s`. Example:

```javascript
st.Contains(' ').Value //returns true
```

## `HasPrefix(s string)`

Returns a bool if string contains a contiguous sequence of characters in `s` at the start. Examples:

```javascript
st.HasPrefix(' a').Value //returns true
```

```javascript
st.HasPrefix('a').Value //returns false
```

## `HasSuffix(s string)`

Returns a bool if string contains a contiguous sequence of characters in `s` at the end. Examples:

```javascript
st.HasSuffix('p ').Value //returns true
```

```javascript
st.HasSuffix('p').Value //returns false
```

## `EqualFold(s string)`

Returns a bool if `s` is equal to string under Unicode case-folding, which is a more general form of case-insensitivity. Examples:

```javascript
st.EqualFold(' Abcdefgh Ijklmnop ').Value //returns true
```

```javascript
st.EqualFold(' ABCDEFGH Ijklmnop ').Value //returns true
```

```javascript
st.EqualFold('ABCDEFGH Ijklmnop').Value //returns false
```

## `Repeat(n int)`

Returns a string repeated `n` times. Examples:

```javascript
st.Repeat('2').Value //returns " abcdefgh ijklmnop  abcdefgh ijklmnop "
```

```javascript
st.Repeat('1').Value //returns " abcdefgh ijklmnop "
```

## `ToBool()`

Returns a bool. If `st` value is `1`, `t`, `T`, `true`, `TRUE` or `True` returns `true`, otherwise `false`. Example:

```javascript
st.ToBool().Value //returns false
```

## `GetMD5()`

Returns the MD5 of the string. Example:

```javascript
st.GetMD5().Value //returns "2ad55f487fa740783751f2e77ae49e35"
```

## `GetMD5FilePath()`

Returns the MD5 of the file if `st` is a filepath. Returns empty when error. Example:

```javascript
st.GetMD5FilePath().Value //returns the MD5 of a file path
```

## `RegexReplace(regex string, replacement string)`

Returns the replacement string matches with the specified regular expression. You can use `$` for groups. If regex is not valid, so empty string is returned. Examples:

```javascript
st.RegexReplace('a','DIXER').Value //returns ' DIXERbcdefgh ijklmnop '
```

```javascript
st.RegexReplace('(a)','${1}DIXER').Value //returns ' aDIXERbcdefgh ijklmnop '
```