# Changelog

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