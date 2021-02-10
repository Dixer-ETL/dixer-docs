# Changelog

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