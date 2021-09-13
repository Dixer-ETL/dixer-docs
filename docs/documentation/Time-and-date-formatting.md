# Time and date formatting

To format a time or date Dixer uses the same time or date formatting layout used in Go programming language.

## Standard time and date formats

| Go layout                       | Note                |
|---------------------------------|---------------------|
| January 2, 2006                 | Date                |
| 01/02/06                        |                     |
| Jan-02-06                       |                     |
|                                 |                     |
| 15:04:05                        | Time                |
| 3:04:05 PM                      |                     |
|                                 |                     |
| Jan _2 15:04:05                 | Timestamp           |
| Jan _2 15:04:05.000000          | with microseconds   |
|                                 |                     |
| 2006-01-02T15:04:05-0700        | ISO 8601 (RFC 3339) |
| 2006-01-02                      |                     |
| 15:04:05                        |                     |
|                                 |                     |
| 02 Jan 06 15:04 MST             | RFC 822             |
| 02 Jan 06 15:04 -0700           | with numeric zone   |
|                                 |                     |
| Mon, 02 Jan 2006 15:04:05 MST   | RFC 1123            |
| Mon, 02 Jan 2006 15:04:05 -0700 | with numeric zone   |

## Layout options

| Type     | Options                                                |
|----------|--------------------------------------------------------|
| Year     | 06   2006                                              |
| Month    | 01   1   Jan   January                                 |
| Day      | 02   2   _2   (width two, right justified)             |
| Weekday  | Mon   Monday                                           |
| Hours    | 03   3   15                                            |
| Minutes  | 04   4                                                 |
| Seconds  | 05   5                                                 |
| ms μs ns | .000   .000000   .000000000                            |
| ms μs ns | .999   .999999   .999999999   (trailing zeros removed) |
| am/pm    | PM   pm                                                |
| Timezone | MST                                                    |
| Offset   | -0700   -07   -07:00   Z0700   Z07:00                  |

## Corner cases

It’s not possible to specify that an hour should be rendered without a leading zero in a 24-hour time format.

It’s not possible to specify midnight as 24:00 instead of 00:00. A typical usage for this would be giving opening hours ending at midnight, such as 07:00-24:00.

It’s not possible to specify a time containing a leap second: 23:59:60. In fact, the time package assumes a Gregorian calendar without leap seconds.

## Example uses

In default variable `NOW` you can get the date in a specific format:

```javascript
NOW.Format('2006-01-02') // returns the date in YYYY-MM-DD string format
```

!!! note
    For Dixer v1 is<br>
    ```javascript
    NOW.Format('2006-01-02').Value // returns the date in YYYY-MM-DD string format
    ```

Also you can specify the format for source and destination in the mapping column keys `source_datetime_format` and `destination_datetime_format`.

```javascript
source_datetime_format = '2006-01-02 15:04:05.999999' //means that the source is a date in the format specified
```

!!! note
    This information is thanks to Stefan Nilsson from [Your Basic](https://yourbasic.org) and was extrated from [Format a time or date](https://yourbasic.org/golang/format-parse-string-time-date-example/).
