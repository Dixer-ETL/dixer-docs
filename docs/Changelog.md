# Changelog

## 1.7.0 <small>_ UNRELEASED</small>

This version upgrade the runtime to `go1.16.5`.

### New binaries:
* White Edition for macOS with Apple Silicon (ARM64).
* White Edition for OpenBSD in MIPS64 arch.
* Sky Edition for Linux in ARM64 arch.
* Red Edition for Linux in ARM64 arch.

### New
* Disabe the color in terminal setting environment variabe `NO_COLOR` with any value to complain with [`NO_COLOR`](https://no-color.org/).
* Support insert to `DOUBLE` column in FirebirdSQL.
* New method [`ToStringDecimal`](documentation/expressions/Float-methods.md#tostringdecimaln-int) for `float` variable type to convert the `float` to a string with fixed decimal values.
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
* New method for string expression [`RegexReplace`](documentation/expressions/String-methods.md#regexreplaceregex-string-replacement-string) to replace all characters that match expression.
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
