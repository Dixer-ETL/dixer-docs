# Migrate from source to destination

Dixer allows to migrate data from and to:

* Microsoft SQL Server*
* MySQL*
* IBM DB2*
* Oracle*
* Excel file (.xlsx)
* CSV
* XML
* JSON
* Firebird SQL
* PostgreSQL
* Variables
* SQLite3*
* Ragged Right File
* Fixed Width File
* SAP HANA DB
* HTML Table (only destination)
* Markdown Table (only destination)

**Microsoft SQL Server requires TLS 1.2 (MSSQL 2008 SP4 or superior, MSSQL 2008 R2 SP3 or superior)*

**IBM-DB2 requires [clidriver](https://public.dhe.ibm.com/ibmdl/export/pub/software/data/db2/drivers/odbc_cli/). In Windows is runtime need it, but others OS need it to execute the Dixer binary.*

**Oracle requires [Oracle Instant Client](https://www.oracle.com/database/technologies/instant-client/downloads.html) at runtime.*

**SQLite3 authentication with user and password not supported. Also encrypted databases not supported.*

The type is `dataflow`.

## Keys for job `dataflow`

- `omit_rows`: Optional. To define how many firsts rows to skip from source. Integer. Default `0`.
- `omit_rows_var`: Optional. To define variable with value int  of how many firsts rows to skip from source. String.
- `source_config`: Mandatory. To define keys of source configuration. Object.
    - `connection_id`: Mandatory. To set connection ID. String.
- `destination_config`: Mandatory. To define keys of destination configuration. Object.
    - `connection_id`: Mandatory. To set connection ID. String.
- `mapping_file_path`: Optional. File path containing the mapping to avoid putting in the main PCF file. The file should be in the same format (toml, json, yaml) that main PCF file. Mapping should be inside `jobs` object.
- `mapping_file_path_var`: Optional. Variable defined with the file path of mapping file.
- `mapping`: Mandatory if mapping should be in main PCF. To define array of columns to mapping. Array Object.
    - `column_source`: Mandatory. To define the source column. String.
    - `column_destination`: Mandatory. (*but not necessary when destination are Fixed Width or Ragged Right*) to define the destination column. String.
    - `omit`: Optional. To define omit the column in destination. Bool.
    - `source_is_variable`: Optional. To define if `column_source` is a variable. Bool. 
    - `source_is_expression`: Optional. To define if `column_source` is an expression. Bool.
    - `source_is_value`: Optional. To define if `column_source` is a fixed value. Bool.
    - `null_when_empty`: Optional. To define if `null` will be inserted in destination database if source value is empty. Bool. NOTE: From v1.8.0 you can use it when source is a database.
    - `trim_space`: Optional. To trim all trailing spaces in the value when source is a file CSV, Fixed Width, JSON, XML, XLSX, Ragged Right. Bool.
    - `source_datetime_format`: Optional. To define the format of a datetime in the source where this is not a database and destination is a database (SQLITE3 excluded). String. [How formatting](../../Time-and-date-formatting.md).
    - `destination_datetime_format`: Optional. To define the format of a datetime in the destination where this is not a database (SQLITE3 excluded). String. [How formatting](../../Time-and-date-formatting.md).
    - `source_json_array_index`: Optional. To define the index to get from a JSON array type value when source is JSON. int
    - `destination_json_number_as_string`: Optional. Use to define if number input should be a string in JSON object destination. Bool. Default `false`.
    - `destination_json_bool_as_string`: Optional. Use to define if bool input should be a string in JSON object destination. Bool. Default `false`.
    - `source_xml_unescape`: Optional. Use to define if value from xml source should be unescaped. Bool. Default `false`.
    - `destination_xml_cdata`: Optional. Use to define if value to xml source should be CDATA. Bool. Default `false`.
    - `source_time_with_tz`: Optional. To return the timezone for datetime column from database source. Bool. Default `false`.
- `dataflow_skip`: Optional. To define a rule with an expression to skip rows when match. Object. (`skip in Dixer v1.7.0 and below`).
    - `rule`: Optional. To define expression to skip rows if match. String.
    - `rule_var`: Optional. To set variable with defined expression to skip rows if match. String.
    - `disable`: Optional. To enable or disable the skip rule expression. Bool. Default `false`.
    - `disable_var`: Optional. To set variable with defined bool to enable or disable skip rule expression. String.

In `source_config` and `destination_config` there are keys depending the source and destination connection type:

For all destinations (except when source is variables), is possible to ignore rows if error ocurred trying to inserting. Set in `destination_config` these keys:

- `ignore_row_error`: Optional. Ignore row if error. Default `false`. Bool.
- `ignore_row_error_var`: Optional. Variable with defined to ignore error inserting row. String.
- `enable_log_row_error`: Optional. Show a WARNING in the log when row was ignored and print the error. Default `false`. Bool.
- `enable_log_row_error_var`: Optional. Variable with defined to log the error inserting row. String.
- `rows_to_transfer`: Optional. Limit the total rows to transfer to destination. Default `0` (all rows). Int.
- `rows_to_transfer_var`: Optional. Variable with defined to set limit of rows to transfer. String.

## CSV

Keys for `source_config`:

- None

Keys for `destination_config`:

- `eol`: Optional. End of line in destination csv file. Allowed values: `CRLF`, `CR` and `LF`. Default `CRLF`. String.
- `eol_var`: Optional. Variable with defined end of line in destination csv file. String.
- `columns_name_in_first_row`: Optional. To set the first row the names in `column_destination`. Bool. Default `false`.
- `columns_name_in_first_row_var`: Optional. Variable with defined bool to use in first row the names in `column_destination`. String.

## XLSX

Keys for `source_config`:

- None

Keys for `destination_config`:

- `max_rows_per_sheet`: Optional. To set how many rows transfer for sheet. Int.
- `max_rows_per_sheet_var`: Optional. Variable with defined int with how many rows transfer for sheet. String.
- `columns_name_in_first_row`: Optional. To set the first row the names in `column_destination`. Bool. Default `false`.
- `columns_name_in_first_row_var`: Optional. Variable with defined bool to use in first row the names in `column_destination`. String.

## JSON

Keys for `source_config`:

- None

Keys for `destination_config`:

- None

## XML

Keys for `source_config`:

- None

Keys for `destination_config`:

- None

## Variables

Keys for `source_config`:

- None

Keys for `destination_config`:

- None

## Ragged Right

Keys for `source_config`:

- None

Keys for `destination_config`:

- None

## Fixed Width

Keys for `source_config`:

- None

Keys for `destination_config`:

- None

## HTML Table

Keys for `destination_config`:

- None

## Databases

Keys for `source_config`:

- `query`: Optional. To define the query to get the data. String.
- `query_var`: Optional. Variable with the query to get the data. String.
- `query_file_path`: Optional. The path of file containing the query. String.
- `query_file_path_var`: Optional. Variable with the path of file containing the query. String.

Keys for `destination_config`:

- `table`: Mandatory. Table name destination. String.
- `table_var`: Optional. Variable with defined table name destination. String.

It's possible to do a batch insert when destinations are:

- Microsoft SQL Server
- MySQL
- PostgreSQL
- Oracle
- IBM DB2
- SQLite3

For this, use this keys is your `destination_config`:

- `batch_insert`: Optional. To enable or disable batch insert. Bool.
- `batch_insert_var`: Optional. variable with defined bool to enable or disable batch insert. String.
- `rows_per_batch`: Optional. To set batch insert rows per batch. Int. Default `25`.
- `rows_per_batch_var`: Optional. variable with defined int for batch insert rows per batch. String.

Batch insert uses a prepared statement with inserts configured with `rows_per_batch` or `rows_per_batch_var`, too much rows in batch can decrease the speed of transfer. Set with value that best suits your environment.

Also there are limits in some databases for batch insert:

- Microsoft SQL Server: The limit is `1000 / total columns to transfer` so if there are 2 columns, the limit is `500` and so on.
- MySQL and PostgreSQL: The limit is `65535 / total columns to transfer`.

In PostgreSQL, is possible to use the [COPY] feature to increase speed inserting in PostgreSQL table. The performance is +85% faster without this feature. You can enable it adding these keys to `destination_config`:

- `bulk_copy`: Optional. To enable or disable PostgreSQL COPY. Bool. Default `false`.
- `bulk_copy_var`: Optional. variable with defined bool to enable or disable PostgreSQL COPY. String.

In Microsoft SQL Server, is possible to use the [Bulk Copy Fast Load Feature](https://docs.microsoft.com/en-us/sql/connect/oledb/features/performing-bulk-copy-operations?view=sql-server-ver15) to make a fast load. You can enable it adding these keys to `destination_config`:

- `fast_load`: Optional. To enable or disable MSSQL fast load. Bool. Default `false`.
- `fast_load_var`: Optional. variable with defined bool to enable or disable MSSQL fast load. String.
- `check_constrains`: Optional. To enable or disable MSSQL fast load check constrains. Bool. Default `false`.
- `check_constrains_var`: Optional. variable with defined bool to enable or disable MSSQL fast load check constrains. String.
- `fire_triggers`: Optional. To enable or disable MSSQL fast load fire triggers. Bool. Default `false`.
- `fire_triggers_var`: Optional. variable with defined bool to enable or disable MSSQL fast load fire triggers. String.
- `keep_nulls`: Optional. To enable or disable MSSQL fast load keep nulls. Bool. Default `false`.
- `keep_nulls_var`: Optional. variable with defined bool to enable or disable MSSQL fast load keep nulls. String.
- `table_lock`: Optional. To enable or disable MSSQL fast load table lock. Bool. Default `false`.
- `table_lock_var`: Optional. variable with defined bool to enable or disable MSSQL fast load table lock. String.
- `rows_per_batch`: Optional. To set MSSQL fast load rows per batch. Int. Default `0`.
- `rows_per_batch_var`: Optional. variable with defined int for MSSQL fast load rows per batch. String.
- `kilobytes_per_batch`: Optional. To set MSSQL fast load kilobytes per batch. Int. Default `0`.
- `kilobytes_per_batch_var`: Optional. variable with defined int for MSSQL fast load kilobytes per batch. String.

!!! warning
    If MSSQL Fast Load is enabled, then the column destination in mapping is case sensitive with the name of table destination.

!!! info
    The default setting to transfer rows is one by one. It's the most slow.

!!! note
    For Microsoft SQL Server and PostgreSQL, if Fast Load or Bulk Copy are enabled, this is used despite if batch insert is enabled or not.

!!! warning
    If MSSQL Fast Load is enabled, the Unicode characters above U+00FF will be inserted with error.

## Mapping

The mapping values for `column_source` and `column_destination` is different depending the source and destination. See the mapping keys in [Keys for job `dataflow`](#keys-for-job-dataflow).

For `column_source` and `column_destination` in databases, use the column name.

For `column_source` in CSV, Ragged Right and Fixed Width are the index of columns in the file, starting with 0.

For `column_destination` in Ragged Right and Fixed Width, this key isn't necessary.

For `column_source` in XLSX is the column name letter (A, B, C, etc...)

For `column_source` XML and JSON, is the object key in JSON or name of column in XML. Support multiple levels. Example:

For JSON input file:

```json
{
  "colors": [
    {
      "color": "black",
      "category": "hue",
      "type": "primary",
      "code": {
        "rgba": [255,255,255,1],
        "hex": "#000",
        "misc":{
          "comment":{
            "val":"hello!"
          }
        }
      }
    },
    {
      "color": "white",
      "category": "value",
      "code": {
        "rgba": [0,0,0,1],
        "hex": "#FFF",
        "misc":{
          "comment":{
            "val":"hey!"
          }
        }
      }
    }
  ]
}

```

To get `val` key, in `column_source` set `code->misc->comment->val` (Supposing `colors` is the value for json connection in key `array_key`). Same logic with XML input file.

For JSON only: you can get a value from a JSON array specifying the index in `source_json_array_index` key.

Mapping of a dataflow can be set in another file and called with `mapping_file_path` and can be accept variable with the path using `mapping_file_path_var`