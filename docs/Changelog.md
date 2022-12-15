# Changelog

## 2.3.0 <small>_ UNRELEASED</small>

This version upgrade the runtime to `go1.19.4`.

### New
* Possible to break a `bucle` using a expression with new key `break_condition`.
* Support sqlite3 for WHITE Edition in `linux/ppc64le` for `POWER PC 8` and `POWER PC 9`.
* You can set the license raw content in environment variable `DIXER_LIC_RAW`.
* `mail` job now has possibility to allow duplicate recipients in email, using `allow_duplicate_addresses = true`.
* `mail` job now have a new and simplest way to add attachments using the array object key `attachments_v2`. In `v2.4.0` will be `attachments` and old way will be removed but `attachments_v2` can be used too. In `v2.5.0` the key `attachments_v2` will be removed.

### Enhancement
* All files uploaded to `S3` will now have the Content-Type of the file using the extension.

### Bug Fixes
* Licenses request generated in `v2.2.0` were wrong, if you have a license for this version and wan't to upgrade, please contact us to generate another one for the same host.

### Libraries upgrades
* Excelize library upgraded to commit [61fda0b1cad4](https://github.com/qax-os/excelize/tree/61fda0b1cad4)
* IBM DB driver upgraded to version [v0.4.2](https://github.com/ibmdb/go_ibm_db/tree/v0.4.2)
* MySQL driver upgraded to version [v1.7.0](https://github.com/go-sql-driver/mysql/tree/v1.7.0)
* Oracle driver upgraded to version [v0.36.0](https://github.com/godror/godror/tree/v0.36.0)
* copy library upgraded to version [v1.9.0](https://github.com/otiai10/copy/tree/v1.9.0)
* aws-sdk-go-v2 library upgraded to version [v1.17.2](https://github.com/aws/aws-sdk-go-v2/tree/v1.17.2)
* SQLite3 driver (used in SKY, RED, GREEN and FULL editions) upgraded to version [v1.14.16](https://github.com/mattn/go-sqlite3/tree/v1.14.16)
* SQLite3 driver (used in WHITE edition) upgraded to version [v1.20.0](https://gitlab.com/cznic/sqlite/tree/v1.20.0)
* go-simple-mail library upgraded to version [v2.13.0](https://github.com/xhit/go-simple-mail/tree/v2.13.0)
* go-str2duration upgraded to version [v2.1.0](https://github.com/xhit/go-str2duration/tree/v2.1.0)
* go-toml library upgraded to version [v2.0.6](https://github.com/pelletier/go-toml/tree/v2.0.6)
* SAP HANA DB driver upgraded to version [v0.111.7](https://github.com/SAP/go-hdb/tree/v0.111.7)

## 2.2.0 <small>_ October 11, 2022</small>

This version upgrade the runtime to `go1.19.2`.

For personal use, you can execute Dixer for free without license, only you need to wait 30 seconds before worflow init. To avoid this limitation, consider buy a license.

### New
* New binary for `linux/loong64` WHITE Edition.
* Support sqlite3 for WHITE Edition in `freebsd/arm64`, `linux/riscv64`, `windows/arm64`.
* Allow load connection, mapping and variables from different extensions different that main PCF.
* License should have the owner information.
* New key `expected_status_code` for `httprequest` job type to return error if http status code returned is not the expected.
* New key `skip_cert_verification` for `smtp` connection type to avoid certificate validation.
* Support add attachments and inline from base64 in `mail` job type.
* Support add headers in `http` connection.
* Support add headers in `httprequest` job type.

### Enhancement
* Jobs type `query` with connection `mysql` can accept multiline statements.
* Avoid check hostname in license.
* No need to specify PCFformat with `-fmt, --format`. The type now is read from file extension. Supported `json, toml, tml, yaml, yml`.
* `password` in xlsx connection now is supported for save protected document.
* The key `attach_optional` now works for inline atachements.


### Bug Fixes
* Binary for `windows/386` was built with experimental sqlite3 support by error (no announced as supported). Now is removed to make binary more tiny.

### Libraries upgrades
* aws-sdk-go-v2 library upgraded to version [v1.16.16](https://github.com/aws/aws-sdk-go-v2/tree/v1.16.16)
* SQLite3 driver (used in WHITE edition) upgraded to version [v1.19.1](https://gitlab.com/cznic/sqlite/tree/v1.19.1)
* go-simple-mail library upgraded to version [v2.12.0](https://github.com/xhit/go-simple-mail/tree/v2.12.0)
* yaml upgraded to version [v3.0.1](https://github.com/go-yaml/yaml/tree/v3.0.1)
* Oracle driver upgraded to version [v0.34.0](https://github.com/godror/godror/tree/v0.34.0)
* SAP HANA DB driver upgraded to version [v0.108.2](https://github.com/SAP/go-hdb/tree/v0.108.2)
* ftp library upgraded to version [v0.1.0](https://github.com/jlaffaye/ftp/tree/v0.1.0)
* Excelize library upgraded to commit [c02346bafc6e](https://github.com/qax-os/excelize/tree/c02346bafc6e)
* go-toml library upgraded to version [v2.0.5](https://github.com/pelletier/go-toml/tree/v2.0.5)
* SQLite3 driver (used in SKY, RED, GREEN and FULL editions) upgraded to version [v1.14.15](https://github.com/mattn/go-sqlite3/tree/v1.14.15)
* FirebirdSQL driver upgraded to commit [803b00772b9](https://github.com/nakagami/firebirdsql/tree/803b00772b9)
* term library upgraded to commit [7a66f970e087](https://github.com/golang/term/tree/7a66f970e087)
* copy library upgraded to commit [d69252f9c80a](https://github.com/otiai10/copy/tree/d69252f9c80a)
* MSSQL driver upgraded to version [v0.12.3](https://github.com/denisenkom/go-mssqldb/tree/v0.12.3)
* Go text package upgraded to commit [23407e72ed5b](https://github.com/golang/text/tree/23407e72ed5b)

## 2.1.0 <small>_ March 19, 2022</small>

This version upgrade the runtime to `go1.17.8`.

### New
* `trim_space` support for dataflow mapping source variables.
* `trim_space` support for dataflow mapping destination databases. 

### Enhancement
* Return better error message when datatype for destination database is invalid.
* Improvements when source is ragged-right and fixed-width, now is compatible with dynamic row length.
* White Edition has full SQLite3 support for some platforms. [See list here](Editions.md#white-edition).

### Bug Fixes
* Fixed panic when `ignore_row_error` is true for source ragged-right and fixed-width.

### Libraries upgrades
* FirebirdSQL driver upgraded to version [v0.9.3](https://github.com/nakagami/firebirdsql/tree/v0.9.3)
* go-simple-mail library upgraded to version [v2.11.0](https://github.com/xhit/go-simple-mail/tree/v2.11.0)
* copy library upgraded to commit [9aae5f772](https://github.com/otiai10/copy/tree/9aae5f772)
* Oracle driver upgraded to version [v0.30.2](https://github.com/godror/godror/tree/v0.30.2)
* SAP HANA DB driver upgraded to version [v0.105.6](https://github.com/SAP/go-hdb/tree/0.105.6)
* Excelize library upgraded to version [v2.5.0](https://github.com/qax-os/excelize/tree/v2.5.0)
* SQLite3 driver (used in SKY, RED, GREEN and FULL editions) upgraded to version [v1.14.11](https://github.com/mattn/go-sqlite3/tree/v1.14.11)
* ftp library upgraded to commit [02685330ee35](https://github.com/jlaffaye/ftp/tree/02685330ee35)
* GoDotEnv upgraded to version [v1.4.0](https://github.com/joho/godotenv/tree/v1.4.0)
* term library upgraded to commit [03fcf44c2211](https://github.com/golang/term/tree/03fcf44c2211)
* aws-sdk-go-v2 library upgraded to version [v1.14.0](https://github.com/aws/aws-sdk-go-v2/tree/v1.14.0)
* decimal upgraded to version [v1.3.1](https://github.com/shopspring/decimal/tree/v1.3.1)
* color upgraded to version [v1.13.0](https://github.com/fatih/color/tree/v1.13.0)
* SQLite3 driver (used in WHITE edition) upgraded to version [v1.14.7](https://gitlab.com/cznic/sqlite/tree/v1.14.7)

## 2.0.0 <small>_ September 15, 2021</small>

!!! warning
    This is a breaking change version if you use expressions. See [changes](#changes)

This version upgrade the runtime to `go1.17.1`.

For macOS, Dixer v2.0.0 requires macOS 10.13 High Sierra or later; support for previous versions has been discontinued. 

### New
* White Edition for Windows ARM64.
* Support read protected XLSX file.
* New variable type called `map` to navegate a JSON.
* New inbuilt functions to replace methods. See [Builtin functions](documentation/expressions/Builtin-functions.md).
* Support load JSON and XML data from variable instead file with new key `data_var` when setting JSON and XML connections.
* Support `arguments_var` in job type `process`.
* SQLite3 it's has experimental support in White Edition in these os/arch combinations:
    - darwin/amd64
    - darwin/arm64
    - freebsd/amd64
    - linux/386
    - linux/amd64
    - linux/arm v5
    - linux/arm v6
    - linux/arm v7
    - linux/arm64
    - windows/amd64

### Enhancement
* Allow declare variables of type `int`, `float` and `bool` without `value` key in PCF.
* Performance improvements reading large PCF.
* Binary size reduced in some platforms (excluding white edition binaries with experimental SQLite3 support).
* Upgrade to aws-sdk-go-v2.

### Changes
* Breaking change: [Builtin functions](documentation/expressions/Builtin-functions.md) to replace [Methods](documentation/expressions/v1/README.md#methods).
* Breaking change: Not need more use `.Value` to get value of variable, function, and method. 
* Dropped support to connect to AWS using client certificate.

### Bug Fixes
* Fix bucle iteration counter is printed with value 1 in terminal.

### Libraries upgrades
* go-toml library upgraded to version [v1.9.4](https://github.com/pelletier/go-toml/tree/v1.9.4)
* Oracle driver upgraded to version [v0.25.4](https://github.com/godror/godror/tree/v0.25.4)
* FirebirdSQL driver upgraded to version [v0.9.2](https://github.com/nakagami/firebirdsql/tree/v0.9.2)
* SAP HANA DB driver upgraded to version [v0.105.3](https://github.com/SAP/go-hdb/tree/v0.105.3)
* Excelize library upgraded to version [v2.4.1](https://github.com/360EntSecGroup-Skylar/excelize/tree/v2.4.1)
* Expr library upgraded to version [v1.9.0](https://github.com/antonmedv/expr/tree/v1.9.0)
* SQLite3 driver upgraded to version [v1.14.8](https://github.com/mattn/go-sqlite3/tree/v1.14.8)

## 1.8.1 <small>_ July 18, 2021</small>

### New
* New default variable `OS` with the operative system listed in [`OS list`](documentation/OS-list.md).
* New key `has_wrong_number_fields` for dataflow source config to load data from CSV with ramdon columns length.

### Enhancement
* Improvements in `dataflow`.
* Allow repeat column for XLSX source in `dataflow`.

### Changes
* When source is XLSX one column only, if cell is empty then is ignored.

### Bug Fixes
* Fixed rows has duplicated values for previous row in `dataflow`.
* Fixed reading XLSX file with empty rows and different indexes because Office 365.

### Libraries upgrades
* FirebirdSQL driver upgraded to commit [72ac8744015a](https://github.com/nakagami/firebirdsql/tree/72ac8744015a)

## 1.8.0 <small>_ July 12, 2021</small>

This version upgrade the runtime to `go1.16.6`.

Note: For Windows x64 Sky, Red, Green and Full editions, the runtime is `go1.16.5`.

The evaluation time decreased from 1 minute to 15 seconds.

### New
* Allow read the license path file from environment variable `DIXER_LIC`.
* Added new key to mapping in `dataflow` to return the timezone of datetime when source is DB.
* Ability to set the journal mode to SQLite3 database.
* Support `JSONB` datatype column destination in PostgreSQL.
* Allow fixed value in mapping column_source when setting new key `source_is_value`.
* Allow normal expressions for Mapping Expression and Skip Rule Expression.
* `null_when_empty` now works when source is a database.
* Now it's possible add mapping expression for the same column using `mapping.{type}.this.Value`
* New method for string expression [`ReplaceAllInsensitive`](documentation/expressions/v1/String-methods.md#replaceallinsensitiveold-string-new-string) to replace strings case insensitive.
* `bucle` can configured with a new key `counter_var` to update a int variable with actual counter from `init` to `end` and use that counter in your jobs.
* New job type [`fileexists`](documentation/jobs/File-exists.md) to check if file exists.
* New key `attach_optional` for `mail` job type to ignore empty attachments values.
* Support connect to SMTP Server without authentication setting `none` in `auth_type`.
* Support insert to `BOOLEAN` datatype in FirebirdSQL.
* Support FirebirdSQL 4.0 read and insert to `INT128`, `TIME WITH TIME ZONE` and `TIMESTAMP WITH TIME ZONE`.

### Enhancement
* Improvements in `dataflow` from DB to DB insertion. Now is possible insert a lot of types to another types with automatic convertions.
* The `--format` command line option allow `yml` for `yaml`.
* The `--format` command line option now is case insensitive.
* FirebirdSQL can be used in RISC-V arch.
* Allowed case insensitive `encoding` for connections.
* Improved initial execution of binary.
* Improvements with `dataflow` execution when expressions are used.
* Allow convert string with number with decimals to int in Expression Mapping.
* Allow get `NUMBER` int64 from Oracle.
* Allow repeat column source index for CSV, Ragged Right and Fixed Width.
* MSSQL bulkcopy from int to varchar and nvarchar.
* MSSQL bulkcopy from float to int.
* MSSQL forked driver driver updated.
* Return error selecting FirebirdSQL 4.0 new datatypes `DECFLOAT(16)`, `DECFLOAT(34)`. Currently aren't supported.

### Changes
* Breaking change: job type `bucle` refactored. `iterations` replaced by `end` and is like a normal for loop.
* Date and times from DB in `dataflow` are returned without timezone applied.
* `skip` object in `dataflow` job type renamed to `dataflow_skip`. Not a breaking change, but `skip` is deprecated.
* Error inserting row only returns the row data when source is not a database.

### Bug Fixes
* Fixed access denied when using `decompress` job type in non Windows systems.
* Fixed panic inserting to `DECIMAL` in SAP HANA DB.
* Fixed reading DATARACE when using Skip Rule when you have two or more dataflow using it.
* Fixed dataflow variables to databases not evaluated.
* Avoid exec the events when job `exec_condition` is `false`.
* Fix panic when error checking Oracle Database rows (this panic wasn't never in released binaries)
* Fixed panic selecting columns `TIME WITH TIME ZONE` and `TIMESTAMP WITH TIME ZONE` from FirebirdSQL 4.0

### Libraries upgrades
* SAP HANA DB driver upgraded to version [v0.105.1](https://github.com/SAP/go-hdb/tree/v0.105.1)
* FirebirdSQL driver upgraded to commit [1d8ebc461c6](https://github.com/nakagami/firebirdsql/tree/1d8ebc461c6)
* go-toml library upgraded to version [v1.9.3](https://github.com/pelletier/go-toml/tree/v1.9.3)
* term library upgraded to commit [6886f2dfbf5b](https://github.com/golang/term/tree/6886f2dfbf5b)
* go-simple-mail library upgraded to version [v2.10.0](https://github.com/xhit/go-simple-mail/tree/v2.10.0)
* MSSQL driver upgraded to commit [a78da2aabd817](https://github.com/denisenkom/go-mssqldb/tree/a78da2aabd817)

## 1.7.0 <small>_ June 03, 2021</small>

This version upgrade the runtime to `go1.16.5`.

### New binaries
* White Edition for macOS with Apple Silicon (ARM64).
* White Edition for OpenBSD in MIPS64 arch.
* Sky Edition for Linux in ARM64 arch.
* Red Edition for Linux in ARM64 arch.

### New
* Disable the color in terminal setting environment variabe `NO_COLOR` with any value to complain with [`NO_COLOR`](https://no-color.org/).
* Support insert to `DOUBLE` column in FirebirdSQL.
* New method [`ToStringDecimal`](documentation/expressions/v1/Float-methods.md#tostringdecimaln-int) for `float` variable type to convert the `float` to a string with fixed decimal values.
* Now it's possible to set the mapping in another file and call the file in the main PCF with `mapping_file_path` key. It's possible to set a variable too indicating this file path with `mapping_file_path_var`.
* Now it's possible to set the connections in another file and call the file in the main PCF with `connections_file_path` key. It's possible to set a variable too indicating this file path with `connections_file_path_var`.
* Now it's possible to set the variables in another file and call the file in the main PCF with `variables_file_path` key.
* Support connect to FirebirdSQL database with encoding different to UTF-8 using the key `encoding` or `encoding_var` in the connection.
* Support execute a query from variable in job type `query` with the new key `query_var`.
* Support execute a select query from variable in job type `dataflow` when source is a database with the new key `query_var`.

### Enhancement
* With IBM DB driver upgrade, now is possible to read big numbers from `DECIMAL` datatype from DB2.
* Return error code 8130 when dataflow doesn't have a mapping defined.
* Stable binary for NetBSD in ARM64.

### Changes
* When a column `TIME` is selected from FirebirdSQL and MySQL to a file without date formatting, the year is `0001` instead `0000`.
* The time returned from date columns from Oracle Database respect the timezone of database. See [https://stackoverflow.com/a/29272926](https://stackoverflow.com/a/29272926/4734062).

### Bug Fixes
* Fixed bug added in v1.5.0 executing job types `httprequest` and `soaprequest`.
* Fixed exporting `CLOB` from DB2: now the output is a correct hexadeximal value when destination is not a database.
* Fixed inserting not hexadecimal value to `BLOB` column in FirebirdSQL.
* Fixed reading `CHAR` (internal Dixer datatype is `TEXT`) and `VARCHAR` (internal Dixer datatype is `VARYING`) columns from FirebirdSQL.
* Fixed export duplicated last row when source is a XLSX file generated from Quickbooks (and maybe other software).

### Libraries upgrades
* color upgraded to version [v1.12.0](https://github.com/fatih/color/tree/v1.12.0)
* IBM DB driver upgraded to version [v0.4.1](https://github.com/ibmdb/go_ibm_db/tree/v0.4.1)
* FirebirdSQL driver upgraded to version [v0.9.1](https://github.com/nakagami/firebirdsql/tree/v0.9.1)
* decimal upgraded to version [v1.2.0](https://github.com/shopspring/decimal/tree/v1.2.0)
* PostgreSQL driver upgraded to commit [9e747ca506](https://github.com/lib/pq/tree/9e747ca506)
* MySQL driver upgraded to version [v1.6.0](https://github.com/go-sql-driver/mysql/tree/v1.6.0)
* Oracle driver upgraded to version [v0.25.1](https://github.com/godror/godror/tree/v0.25.1)
* MSSQL driver upgraded to commit [35162394aa](https://github.com/denisenkom/go-mssqldb/tree/35162394aa)
* SAP HANA DB driver upgraded to version [v0.104.0](https://github.com/SAP/go-hdb/tree/v0.104.0)
* yaml upgraded to version [v2.4.0](https://github.com/go-yaml/yaml/tree/v2.4.0)
* jsparser upgraded to version [v1.5.0](https://github.com/tamerh/jsparser/tree/v1.5.0)
* ftp library upgraded to commit [5d4190119067](https://github.com/jlaffaye/ftp/tree/5d4190119067)
* go-toml library upgraded to version [v1.9.1](https://github.com/pelletier/go-toml/tree/v1.9.1)
* aws-sdk-go library upgraded to version [v1.38.54](https://github.com/aws/aws-sdk-go/tree/v1.38.54)
* go-simple-mail library upgraded to version [v2.9.1](https://github.com/xhit/go-simple-mail/tree/v2.9.1)
* gosoap library upgraded to version [v1.4.4](https://github.com/tiaguinho/gosoap/tree/v1.4.4)

## 1.6.0 <small>_ May 11, 2021</small>

This version upgrade the runtime to `go1.15.12` and add performance improvements.

This version remove the SKY edition for unsupported platforms because SQLite3 driver only works for supported OS/ARCH.

Binaries corrections. Now were built correctly.

### New
* Support download a directory from AWS S3 using the new `s3operation` called `downloaddir`.
* Support download a directory from FTP using the new `ftpoperation` called `downloaddir`.
* New job type `updatevar` to update a variable value.
* New job type `vartofile` to save variable value to file.
* New message when job finish successfully.
* Support exec a job if meet a condition with an expression with new key `exec_condition`.

### Enhancement
* Improvements printing in terminal and saving in log file.
* Improvements setting connections.
* Minor improvement in `process` job type in non Windows systems.
* Improvements reading and writing DECIMAL datatype in SAP Hana Database.
* Full support BOOLEAN datatype in SAP Hana Database.
* Added support to read a ST_GEOMETRY datatype from SAP Hana Database.
* CSV connection default delimiter is comma if not defined.
* Use the new terminal package [golang.org/x/term](https://pkg.go.dev/golang.org/x/term).

### Changes
* Graph was refactored to add a link in job types `jobsgroup`, `bucle` and `dataflow` to see the workflow called by this. In `dataflow`, the workflow is called in `exec_workflow` in `foreach_row`.
* The command line option `--grapthhtml` was removed and `--graph` is the same like removed `--grapthhtml`.
* When selecting a `BOOLEAN` column from SAP Hana Database, previously a `0` or `1` was returned. Now is a string `false` or `true`.
* Removed binary Green Edition for Windows 386.

### Bug Fixes
* Fixed incorrect error code `8048` triggered when reading connections keys. Now new error code `8128` is triggered.
* Handle a, maybe, future "bug" uploading local directory to AWS S3. Currently is a bug in AWS but theirs not returns any error yet.
* Fixed a panic when is used the asterisk all columns way in dataflow mapping and error happens scanning rows from database.
* Fixed incorrect output to CSV file when delimiter is not defined.
* Fixed error `Binary was compiled with 'CGO_ENABLED=0', go-sqlite3 requires cgo to work.` for officially supported platforms.
* Fixed error printed twice sometimes.
* Fixed incorrect colors printed in terminal with high concurrency workflows.
* Fixed errors in compiled binaries because failed builders.

### Libraries upgrades
* SAP HANA DB driver upgraded to version [v0.103.3](https://github.com/SAP/go-hdb/tree/v0.103.3)
* go-toml library upgraded to version [v1.9.0](https://github.com/pelletier/go-toml/tree/v1.9.0)
* Excelize library upgraded to version [v2.4.0](https://github.com/360EntSecGroup-Skylar/excelize/tree/v2.4.0)
* Crypto library upgraded to commit [4f45737414dc](https://github.com/golang/crypto/tree/4f45737414dc)
* SQLite3 driver upgraded to version [v1.14.7](https://github.com/mattn/go-sqlite3/tree/v1.14.7)

## 1.5.0 <small>_ April 04, 2021</small>

This version upgrade the runtime to `go1.15.11` and add performance improvements.

### New
* Declare variables that are environment variables in the OS with the new boolean key `env`.
* Support loading an environment variable file `key=value` for your variables with `env=true` in your PCF.
* Upload a directory to an FTP Server with new FTP operation `uploaddir`.
* Delete a directory in AWS S3 with the new S3 operation `deletedir`.
* Color in the terminal! Color for some messages in the terminal. It's beta. You can disable it with `-c false`.
* Execute a query from file in job types `query` and `dataflow`.
* New value `tls` for encryption type to connect to SMTP server with `SSL/TLS`. Previously only `ssl` was accepted for this encryption type.
* Now it's possible to connect to AWS using TLS client certificates.

### Changes
* The exit code for all errors in OSes not Windows is `1`.
* Breaking change: key `local_filepath` renamed to `local_file_path` for AWS S3 and FTP operations `uploadfile` and `downloadfile`.
* Breaking change: key `remote_filepath` renamed to `remote_file_path` for AWS S3 and FTP operations `uploadfile` and `downloadfile`(FTP only: `renamefile`).

### Bug Fixes
* Fixed the execution of PCF with multiples jobs with same ID. New error code `8113` is triggered.
* In job type `process` send the SIGCHLD when finish to avoid zombie process.
* Fixed not error when it's not possible to capture output of process in job type `process`. New error code `8114` is triggered.
* Fixed error code `8092` not triggered for jobs not called in events.
* Fixed error code `8108` never triggered when error happens uplaoding file to AWS S3.
* Return error when isn't not possible set header in XLSX destination file.

### Libraries upgrades
* go-simple-mail library upgraded to version [v2.8.1](https://github.com/xhit/go-simple-mail/tree/v2.8.1)
* Excelize library upgraded to version [v2.3.2](https://github.com/360EntSecGroup-Skylar/excelize/tree/v2.3.2)
* aws-sdk-go library upgraded to version [v1.38.12](https://github.com/aws/aws-sdk-go/tree/v1.38.12)

## 1.4.0 <small>_ February 10, 2021</small>

This version upgrade the runtime to `go1.15.8`.

### New
* Now it's possible to generate a Graphviz compatible diagram of the PCF.

### Changes
* The old way using a prefix `variable::` and `expr::` for column_source mapping was removed.

### Bug Fixes
* Fixed bug introduced in v1.3.0 when new mapping keys `source_is_variable` and `source_is_expression` are assigned to source JSON and XML.

## 1.3.0 <small>_ November 20, 2020</small>

This version upgrade the runtime to `go1.15.5` that requires macOS 10.12 Sierra or later, and has been progress in improving the stability and performance of the 64-bit RISC-V on Linux.

### New
* New job type [`s3operation`](documentation/jobs/S3-operations.md) to perform Amazon S3 tasks.
* New connection type [`aws`](documentation/Create-a-connection.md#connection-to-aws) to connect to Amazon Web Services.
* New method for string expression [`RegexReplace`](documentation/expressions/v1/String-methods.md#regexreplaceregex-string-replacement-string) to replace all characters that match expression.
* New keys `source_is_variable` and `source_is_expression` in mapping for dataflow to defined if derivated column is a expression or variable. The old way using a prefix `variable::` and `expr::` are working but are deprecated.
* Added binary for Windows x86 and Green edition.
* Added key to accept a encrypted username in connections `username_encrypted`. Can accept a variable with suffix `_var`.

### Changes
* In version [1.1.0](#110-_-september-02-2020) the job type `for` was deprecated by `bucle`, now is removed.
* Correction in message for error code `8056` to better clarity.
* If a job doesn't have name, so print the jod ID like the name.
* Encrypt connection password flag `--encryptconnpass` change to `--encryptvalue` to encrypt others texts to apply in other keys that accept `_encrypted` suffix.
* License request cannot be generated in some Linux systems where dmidecode returns empty serial number like WSL. 

### Bug Fixes
* Fixed PCF decryption.
* Fixed invalid escape in some values in JSON destination.
* Fixed connecting to an instance in MSSQL Server.
* In `mail` job type, `from_email` is optional. If not provided, the username to connect to SMTP Server is used instead launch an error.

### Libraries upgrades
* PostgreSQL driver upgraded to commit [083382b7e](https://github.com/lib/pq/commit/083382b7e6fc78cc91eb57afab268fe2f1b6ed6d)
* MSSQL driver upgraded to commit [1e08a3fab](https://github.com/denisenkom/go-mssqldb/tree/1e08a3fab20416d36c5fe538e75939710003f611)
* SAP HANA DB driver upgraded to version [v0.102.2](https://github.com/SAP/go-hdb/tree/v0.102.2)
* Go text package upgraded to commit [22f1617af](https://github.com/golang/text/tree/22f1617af38ed4cd65b3b96e02bab267e560155c)

## 1.2.0 <small>_ October 26, 2020</small>

This version upgrade the runtime to `go1.14.10`.

The evaluation time increased from 25 seconds to 1 minute.

### New
* Posibility to specify the execution directory of a process in `process` job with the new key `start_in`.
* New method for string expression to get the MD5 of the string or a filepath.
* Save the output returned for `soaprequest`, `httprequest` and `process` in a variable.

### Enhancement
* Get error returned writing output for `soaprequest`, `httprequest` and `process`. Error code `8106`.
* New flags `--license` and `-lic` to specify the path of the license file.
* To connect to a DB, the port is optional and use default ports depending the RDBMS.
* Performance improvements in `dataflow` when destination is a JSON file.

### Bug Fixes
* Fixed invalid escape in some values in JSON destination.
* Fixed connecting to an instance in MSSQL Server.

### Libraries upgrades
* FirebirdSQL driver upgraded to version [v0.9.0](https://github.com/nakagami/firebirdsql/tree/v0.9.0)
* go-toml library upgraded to version [v1.8.1](https://github.com/pelletier/go-toml/tree/v1.8.1)
* SQLite3 driver upgraded to version [v1.14.4](https://github.com/mattn/go-sqlite3/tree/v1.14.4)
* ftp library upgraded to commit [0de5c29d4555](https://github.com/jlaffaye/ftp/tree/0de5c29d4555)
* Excelize library upgraded to commit [9d470bb38f99](https://github.com/360EntSecGroup-Skylar/excelize/tree/9d470bb38f99)
* Expr library upgraded to version [v1.8.9](https://github.com/antonmedv/expr/tree/v1.8.9)
* Crypto library upgraded to commit [9e8e0b390897](https://github.com/golang/crypto/tree/9e8e0b390897)
* Oracle driver upgraded to version [v0.20.5](https://github.com/godror/godror/tree/v0.20.5)

## 1.1.0 <small>_ September 02, 2020</small>

This version upgrade the runtime to `go1.14.8`.

### New
* New destination: HTML Table.
* New destination: Markdown Table.
* New job type [`jobsgroup`](documentation/jobs/Jobs-group.md).
* New job type [`compress`](documentation/jobs/Compress.md).
* New job type [`decompress`](documentation/jobs/Decompress.md).
* Ability to execute a job or complete worlflow in defined comma separated list of OS.
* Allow unescape xml element values with new mapping key `source_xml_unescape`.
* Allow CDATA in destination XML element value with new key `destination_xml_cdata`.
* Added optimized binaries for POWER9 in archs ppc64 and ppc64le and Operative Systems Linux and AIX.
* Added experimental binary RISC-V 64 bit for Linux. (Without support for FirebirdSQL).

### Enhancement
* Output of job type `process` is saved when timeout exceeded or unexpected exit code is returned.
* Job type `for` now is called `bucle`. The old name is deprecated. This version is the last to support it.
* Performance improvements in job type `delay`.
* The `custom_duration` key in `delay` job type can accept the duration doesn't matter the order of units.
* Performance improvements inserting in Oracle table when there is a destination column with data type `INTERVAL DAY TO SECOND`.

### Bug Fixes
* Solved: XML destination values weren't escaped. Now this is the default behavior.
* Fixed when output of job type `process` is blank in some cases.

### Libraries upgrades
* FirebirdSQL driver upgraded to commit [0cfab755829a](https://github.com/nakagami/firebirdsql/tree/0cfab755829a)
* go-toml library upgraded to version [v1.8.0](https://github.com/pelletier/go-toml/tree/v1.8.0)
* SQLite3 driver upgraded to version [v1.14.2](https://github.com/mattn/go-sqlite3/tree/v1.14.2)
* go-simple-mail library upgraded to version [v2.5.1](https://github.com/xhit/go-simple-mail/tree/v2.5.1)
* xml-stream-parser library upgraded to version [v1.4.0](https://github.com/tamerh/xml-stream-parser/tree/v1.4.0)
* ftp library upgraded to commit [39e3779af0db](https://github.com/jlaffaye/ftp/tree/39e3779af0db)
* Excelize library upgraded to version [v2.3.0](https://github.com/360EntSecGroup-Skylar/excelize/tree/v2.3.0)
* copy library upgraded to version [v1.2.0](https://github.com/otiai10/copy/tree/v1.2.0)
* go-str2duration upgraded to version [v2.0.0](https://github.com/xhit/go-str2duration/tree/v2.0.0)
* gosoap library upgraded to commit [49156ec557](https://github.com/tiaguinho/gosoap/tree/49156ec55791ac44b1ab7ceef73cace3f4b1a752)

## 1.0.1 <small>_ August 06, 2020</small>

* Upgrade PostgreSQL driver to [this commit](https://github.com/lib/pq/tree/24222a3b71eb19911ce2c82dbcdd0cbc913f335c)
* For licensed binaries, not neccesary the license.txt file

## 1.0.0 <small>_ July 09, 2020</small>

* Initial public release.
