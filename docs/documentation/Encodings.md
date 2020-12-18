# Encodings

Dixer supports read and set encoding of connection types `csv`, `json`, `xml`, `ragged-right` and `fixed-width` using the `encoding` or `encoding_var` keys.

The supported encodings are:

- `UTF-8`: It's the default, you can leave in blank the `encoding` and `encoding_var` keys if you want.
- `UTF-16`: UTF-16 with BOM
- `UTF-16LE`: UTF-16 Little-Endian without BOM
- `UTF-16BE`: UTF-16 Big-Endian without BOM
- `IBM037`: IBM Code Page 037
- `IBM437`: IBM Code Page 437
- `IBM850`: IBM Code Page 850
- `IBM852`: IBM Code Page 852
- `IBM855`: IBM Code Page 855
- `IBM00858`: Windows Code Page 858
- `IBM860`: IBM Code Page 860
- `IBM862`: IBM Code Page 862
- `IBM863`: IBM Code Page 863
- `IBM865`: IBM Code Page 865
- `IBM866`: IBM Code Page 866
- `IBM1047`: IBM Code Page 1047
- `IBM1140`: IBM Code Page 1140
- `ISO-8859-1`: ISOLatin1
- `ISO-8859-2`: ISOLatin2
- `ISO-8859-3`: ISOLatin3
- `ISO-8859-4`: ISOLatin4
- `ISO-8859-5`: ISOLatinCyrillic
- `ISO-8859-6`: ISOLatinArabic
- `ISO-8859-6-E`: ISOLatinArabic explicit mode
- `ISO-8859-6-I`: ISOLatinArabic implicit mode
- `ISO-8859-7`: ISOLatinGreek
- `ISO-8859-8`: ISOLatinHebrew
- `ISO-8859-8-E`: ISOLatinHebrew explicit mode
- `ISO-8859-8-I`: ISOLatinHebrew implicit mode
- `ISO-8859-9`: ISOLatin5
- `ISO-8859-10`: ISOLatin6
- `ISO-8859-13`
- `ISO-8859-14`
- `ISO-8859-15`
- `ISO-8859-16`
- `KOI8-R`
- `KOI8-U`
- `macintosh`
- `x-mac-cyrillic`
- `windows-874`
- `windows-1250`
- `windows-1251`
- `windows-1252`
- `windows-1253`
- `windows-1254`
- `windows-1255`
- `windows-1256`
- `windows-1257`
- `windows-1258`

# How encoding works?

Dixer works internally with UTF-8, so when a encoding is specified to a file, if is a source, Dixer transform supported characters in file to UTF-8, and for writing, transform the UTF-8 to speficied encoding. If a character doesn't match this will be ignored, for example, if you are writing a file in `ISO-8859-13` and some column value is `español` then the output result in destination file is `espaol`.