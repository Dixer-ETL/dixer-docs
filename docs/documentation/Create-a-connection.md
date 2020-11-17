# Create a connection

If your **Job** require access to a file, database, URL, SMTP server or FTP Server, you first need to create a connection. The connection configuration is available for all **Jobs**.

All connections need to be set in `connections` array of objects and all contains 2 mandatory keys that are `id` and `type`, both string and doesn't have use of variables.

A third key `name` is optional.

The `type` key is the type of the connection.

The keys `encoding` and `encoding_var` are use to set the encoding of the connections type `csv`, `json`, `xml`, `ragged-right` and `fixed-width`. See encoding list supported: [Encodings](Encodings.md). If not set, default is `UTF-8`.

!!! note
    You can use keys needed only. If for example the path of a file is a variable (`path_var` key) then isn't neccesary to use the `path` key.

## Valid `type` values

- [`csv`](#connection-to-csv-file)
- [`mysql`](#connection-to-mysql-database)
- [`mssql`](#connection-to-mssql-database)
- [`json`](#connection-to-json-file)
- [`xml`](#connection-to-xml-file)
- [`pgsql`](#connection-to-postgresql-database)
- [`xlsx`](#connection-to-xlsx-file)
- `vars` *doesn't need to create a connection, but the connection id should be 0 always.*
- [`firebird`](#connection-to-firebird-sql-database)
- [`sqlite3`](#connection-to-sqlite3-database)
- [`oracle`](#connection-to-oracle-database)
- [`ibm-db2`](#connection-to-ibm-db2-database)
- [`ragged-right`](#connection-to-ragged-right-file)
- [`fixed-width`](#connection-to-fixed-width-file)
- [`ftp`](#connection-to-ftp-server)
- [`http`](#connection-to-http-url)
- [`smtp`](#connection-to-smtp-server)
- [`sap-hdb`](#connection-to-sap-hana-database)
- [`html-table`](#connection-to-html-table)
- [`markdown-table`](#connection-to-markdown-table)
- [`aws`](#connection-to-aws)

## Connection to CSV file

Keys:

- `path`: the path of file. String.
- `path_var`: key to set a variable with the path. String.
- `delimiter`: delimiter of csv file. String.
- `delimiter_var`: key to set a variable with the delimiter. String.
- `delimiter`: delimiter of csv file. String. Default `,`.
- `delimiter_var`: key to set a variable with the delimiter. String.
- `enclosure`: enclosure of csv file. String.
- `enclosure_var`: key to set a variable with the enclosure. String.
- `encoding`: encoding of file. String. Default is `UTF-8` if not is specified.
- `encoding_var`: key to set a variable with the encoding. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'csv-conn1'
    type = 'csv'
    name = 'CSV CONNECTION'
    path = 'test/in_files/testtypes.csv'
    delimiter = ','
    path_var = ''
    delimiter_var = ''
    enclosure = '"'
    enclosure_var = ''
    encoding = 'UTF-8'
    encoding_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: csv-conn1
        type: csv
        name: CSV CONNECTION
        path: test/in_files/testtypes.csv
        delimiter: ','
        path_var: ''
        delimiter_var: ''
        enclosure: '"'
        enclosure_var: ''
        encoding: 'UTF-8'
        encoding_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "csv-conn1",
          "type": "csv",
          "name": "CSV CONNECTION",
          "path": "test/in_files/testtypes.csv",
          "delimiter": ",",
          "path_var": "",
          "delimiter_var": "",
          "enclosure": "\"",
          "enclosure_var": "",
          "encoding": "UTF-8",
          "encoding_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `path_var`, `delimiter_var`, `encoding_var` and `enclosure_var` can be omitted because are empty.

## Connection to MYSQL database

Keys:

- `host`: ip or name of the MySQL server. String
- `host_var`: key to set a variable with the host. String.
- `database`: database to connect in MySQL server. String
- `database_var`: key to set a variable with the database. String.
- `port`: port to connect to the database in MySQL server. Integer. Default 3306.
- `port_var`: key to set a variable with the port. String.
- `username`: username to connect to the database in MySQL server. String
- `username_var`: key to set a variable with the username. String.
- `password`: password to connect to the database in MySQL server. String
- `password_var`: key to set a variable with the password. String.
- `password_encrypted`: password id saved with the password to connect to the database in MySQL server. String
- `password_encrypted_var`: key to set a variable with the password_encrypted. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'mysql-conn1'
    type = 'mysql'
    name = 'MYSQL Connection'
    host = 'localhost'
    username = 'root'
    password = 'pass'
    password_encrypted = ''
    database = 'test'
    port = 3306
    host_var = ''
    username_var = ''
    password_var = ''
    database_var = ''
    port_var = 'mysqlport'
    password_encrypted_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: mysql-conn1
        type: mysql
        name: MYSQL Connection
        host: localhost
        username: root
        password: pass
        password_encrypted: ''
        database: test
        port: 3306
        host_var: ''
        username_var: ''
        password_var: ''
        database_var: ''
        port_var: mysqlport
        password_encrypted_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "mysql-conn1",
          "type": "mysql",
          "name": "MYSQL Connection",
          "host": "localhost",
          "username": "root",
          "password": "pass",
          "password_encrypted": "",
          "database": "test",
          "port": 3306,
          "host_var": "",
          "username_var": "",
          "password_var": "",
          "database_var": "",
          "port_var": "mysqlport",
          "password_encrypted_var": "",
        }
      ]
    ```

!!! note
    In these examples the keys `host_var`, `username_var`, `password_var`, `password_encrypted`, `password_encrypted_var` and `database_var` can be omitted because are empty.
    
    Also `port` can be omitted because key `port_var` is set with a variable (should be `int`).

## Connection to MSSQL database

Keys:

- `host`: ip or name of the MSSQL server. String
- `host_var`: key to set a variable with the host. String.
- `database`: database to connect in MSSQL server. String
- `database_var`: key to set a variable with the database. String.
- `port`: port to connect to the database in MSSQL server. Integer. Default 1433.
- `port_var`: key to set a variable with the port. String.
- `windows_auth`: set true if you want to connect to the database in MSSQL server using Windows Authentication (only supported in Windows). Bool
- `windows_auth_var`: key to set a variable with the windows_auth boolean value. String.
- `username`: username to connect to the database in MSSQL server. String
- `username_var`: key to set a variable with the username. String.
- `password`: password to connect to the database in MSSQL server. String
- `password_var`: key to set a variable with the password. String.
- `password_encrypted`: password id saved with the password to connect to the database in MSSQL server. String
- `password_encrypted_var`: key to set a variable with the password_encrypted. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'mssql-conn1'
    type = 'mssql'
    name = 'mssql Connection'
    host = 'localhost/instance'
    windows_auth = true
    username = 'test'
    password = 'pass'
    password_encrypted = ''
    database = 'testdb'
    port = 1433
    host_var = ''
    username_var = ''
    password_var = ''
    database_var = ''
    port_var = 'mssqlport'
    password_encrypted_var = ''
    windows_auth_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: mssql-conn1
        type: mssql
        name: mssql Connection
        host: localhost/instance
        windows_auth: true
        username: test
        password: pass
        password_encrypted: ''
        database: testdb
        port: 1433
        host_var: ''
        username_var: ''
        password_var: ''
        database_var: ''
        port_var: mssqlport
        password_encrypted_var: ''
        windows_auth_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "mssql-conn1",
          "type": "mssql",
          "name": "mssql Connection",
          "host": "localhost/instance",
          "windows_auth": true,
          "username": "test",
          "password": "pass",
          "password_encrypted": "",
          "database": "testdb",
          "port": 1433,
          "host_var": "",
          "username_var": "",
          "password_var": "",
          "database_var": "",
          "port_var": "mssqlport",
          "password_encrypted_var": "",
          "windows_auth_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `host_var`, `username_var`, `password_var`, `password_encrypted`, `password_encrypted_var`, `windows_auth_var` and `database_var` can be omitted because are empty.

    Also the key `port` can be omitted because key `port_var` is set with a variable (should be `int`).

    Also the keys `username` and `password` can be omitted because key `windows_auth` is set to `true`.

## Connection to JSON file

The JSON input should have an array key with objects to obtain the values, an example input is:

```json
{
   "conversation":[
      {
         "Name":"Ed",
         "Text":"Knock knock."
      },
      {
         "Name":"Sam",
         "Text":"Who's there?"
      },
      {
         "Name":"Ed",
         "Text":"Go fmt."
      },
      {
         "Name":"Sam",
         "Text":"Go fmt who?"
      },
      {
         "Name":"Ed",
         "Text":"Go fmt yourself!"
      }
   ]
}
```

!!! note
    Doesn't matter how big if the JSON file, you can specify it in the connection.

If connection is used for JSON output, then the JSON will have the same structure.

Keys:

- `path`: the path of file. String.
- `path_var`: key to set a variable with the path. String.
- `array_key`: json array key for get the data. String.
- `array_key_var`: key to set a variable with the json array key. String.
- `encoding`: encoding of file. String. Default is `UTF-8` if not is specified.
- `encoding_var`: key to set a variable with the encoding. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'json-conn1'
    type = 'json'
    name = 'JSON CONNECTION'
    path = 'test/out_files/test.json'
    array_key = 'list'
    path_var = ''
    array_key_var = ''
    encoding = 'UTF-8'
    encoding_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: json-conn1
        type: json
        name: JSON CONNECTION
        path: test/out_files/test.json
        array_key: list
        path_var: ''
        array_key_var: ''
        encoding: 'UTF-8'
        encoding_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "json-conn1",
          "type": "json",
          "name": "JSON CONNECTION",
          "path": "test/out_files/test.json",
          "array_key": "list",
          "path_var": "",
          "array_key_var": "",
          "encoding": "UTF-8",
          "encoding_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `encoding_var`, `path_var` and `array_key_var` can be omitted because are empty.

## Connection to XML file

The XML input should have an row name with objects to obtain the values, an example input is:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<bookstore>
   <book>
      <title>The Iliad and The Odyssey</title>
      <price>12.95</price>
      <comments>
         <userComment rating="4">Best translation I've read.</userComment>
         <userComment rating="2">I like other versions better.</userComment>
      </comments>
   </book>
   <book>
      <title>Anthology of World Literature</title>
      <price>24.95</price>
      <comments>
         <userComment rating="3">Needs more modern literature.</userComment>
         <userComment rating="4">Excellent overview of world literature.</userComment>
      </comments>
   </book>
   <journal>
      <title>Journal of XML parsing</title>
      <issue>1</issue>
   </journal>
</bookstore>
```

!!! note
    Doesn't matter how many row names have the input XML, you can specify it in the connection.

If connection is used for XML output, then the JSON will have the this structure:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<root>
    <book>
        <columntest>4</columntest>
    </book>
    <book>
        <columntest>27</columntest>
    </book>
    <book>
        <columntest>21</columntest>
    </book>
    <book>
        <columntest>27</columntest>
    </book>
</root>
```
The root name of XML output can be set in connection, the row name in this output example is `book`.

Keys:

- `path`: the path of file. String.
- `path_var`: key to set a variable with the path. String.
- `row_name`: xml row name key to get the data. String.
- `row_name_var`: key to set a variable with the xml row name key. String.
- `root_name`: xml name of root for output only. String.
- `root_name_var`: key to set a variable with the xml name of root. String.
- `encoding`: encoding of file. String. Default is `UTF-8` if not is specified.
- `encoding_var`: key to set a variable with the encoding. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'xml-conn1'
    type = 'xml'
    name = 'XML CONNECTION'
    path = 'test/in_files/test.xml'
    path_var = ''
    root_name = 'root'
    row_name = 'book'
    root_name_var = ''
    row_name_var = ''
    encoding = 'UTF-8'
    encoding_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: xml-conn1
        type: xml
        name: XML CONNECTION
        path: test/in_files/test.xml
        path_var: ''
        root_name: root
        row_name: book
        root_name_var: ''
        row_name_var: ''
        encoding: 'UTF-8'
        encoding_var: ''
    ```

=== "JSON"
    ```json
      "connections": [
        {
          "id": "xml-conn1",
          "type": "xml",
          "name": "XML CONNECTION",
          "path": "test/in_files/test.xml",
          "path_var": "",
          "root_name": "root",
          "row_name": "book",
          "root_name_var": "",
          "row_name_var": "",
          "encoding": "UTF-8",
          "encoding_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `path_var`, `row_name_var`, `encoding_var` and `root_name_var` can be omitted because are empty.

## Connection to PostgreSQL database

Keys:

- `host`: ip or name of the PostgreSQL server. String
- `host_var`: key to set a variable with the host. String.
- `database`: database to connect in PostgreSQL server. String
- `database_var`: key to set a variable with the database. String.
- `port`: port to connect to the database in PostgreSQL server. Integer. Default 5432.
- `port_var`: key to set a variable with the port. String.
- `username`: username to connect to the database in PostgreSQL server. String
- `username_var`: key to set a variable with the username. String.
- `password`: password to connect to the database in PostgreSQL server. String
- `password_var`: key to set a variable with the password. String.
- `password_encrypted`: password id saved with the password to connect to the database in PostgreSQL server. String
- `password_encrypted_var`: key to set a variable with the password_encrypted. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'pgsql-conn1'
    type = 'pgsql'
    name = 'pgsql Connection'
    host = 'localhost'
    username = 'test'
    password = 'pass'
    password_encrypted = ''
    database = 'testdb'
    port = 5432
    host_var = ''
    username_var = ''
    password_var = ''
    database_var = ''
    port_var = ''
    password_encrypted_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: pgsql-conn1
        type: pgsql
        name: pgsql Connection
        host: localhost
        username: test
        password: pass
        password_encrypted: ''
        database: testdb
        port: 5432
        host_var: ''
        username_var: ''
        password_var: ''
        database_var: ''
        port_var: ''
        password_encrypted_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "pgsql-conn1",
          "type": "pgsql",
          "name": "pgsql Connection",
          "host": "localhost",
          "username": "test",
          "password": "pass",
          "password_encrypted": "",
          "database": "testdb",
          "port": 5432,
          "host_var": "",
          "username_var": "",
          "password_var": "",
          "database_var": "",
          "port_var": "",
          "password_encrypted_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `port_var`, `host_var`, `username_var`, `password_var`, `password_encrypted`, `password_encrypted_var` and `database_var` can be omitted because are empty.

## Connection to XLSX file

Keys:

- `path`: the path of file. String.
- `path_var`: key to set a variable with the path. String.
- `sheet_name`: name of sheet. String.
- `sheet_name_var`: key to set a variable with the name of sheet. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'xlsx-conn1'
    type = 'xlsx'
    name = 'XLSX CONNECTION'
    path = 'test/out_files/test.xlsx'
    sheet_name = 'sheet12345'
    path_var = ''
    sheet_name_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: xlsx-conn1
        type: xlsx
        name: XLSX CONNECTION
        path: test/out_files/test.xlsx
        sheet_name: sheet12345
        path_var: ''
        sheet_name_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "xlsx-conn1",
          "type": "xlsx",
          "name": "XLSX CONNECTION",
          "path": "test/out_files/test.xlsx",
          "sheet_name": "sheet12345",
          "path_var": "",
          "sheet_name_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `path_var` and `sheet_name_var` can be omitted because are empty.

## Connection to Firebird SQL database

Keys:

- `host`: ip or name of the Firebird SQL server. String
- `host_var`: key to set a variable with the host. String.
- `database`: path of database to connect in Firebird SQL server. String
- `database_var`: key to set a variable with the path of database. String.
- `port`: port to connect to the database in Firebird SQL server. Integer. Default 3050.
- `port_var`: key to set a variable with the port. String.
- `username`: username to connect to the database in Firebird SQL server. String
- `username_var`: key to set a variable with the username. String.
- `password`: password to connect to the database in Firebird SQL server. String
- `password_var`: key to set a variable with the password. String.
- `password_encrypted`: password id saved with the password to connect to the database in Firebird SQL server. String
- `password_encrypted_var`: key to set a variable with the password_encrypted. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'firebird-conn1'
    type = 'firebird'
    name = 'firebird Connection'
    host = 'localhost'
    username = 'test'
    password = 'pass'
    password_encrypted = ''
    database = 'C:/db/testdb.fdb'
    port = 3050
    host_var = ''
    username_var = ''
    password_var = ''
    database_var = ''
    port_var = ''
    password_encrypted_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: firebird-conn1
        type: firebird
        name: firebird Connection
        host: localhost
        username: test
        password: pass
        password_encrypted: ''
        database: 'C:/db/testdb.fdb'
        port: 3050
        host_var: ''
        username_var: ''
        password_var: ''
        database_var: ''
        port_var: ''
        password_encrypted_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "firebird-conn1",
          "type": "firebird",
          "name": "firebird Connection",
          "host": "localhost",
          "username": "test",
          "password": "pass",
          "password_encrypted": "",
          "database": "C:/db/testdb.fdb",
          "port": 3050,
          "host_var": "",
          "username_var": "",
          "password_var": "",
          "database_var": "",
          "port_var": "",
          "password_encrypted_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `port_var`, `host_var`, `username_var`, `password_var`, `password_encrypted`, `password_encrypted_var` and `database_var` can be omitted because are empty.

## Connection to SQLite3 database

Keys:

- `database`: path of SQLite3 database. String
- `database_var`: key to set a variable with the path of SQLite3 database. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'sqlite3-conn1'
    type = 'sqlite3'
    name = 'sqlite3 Connection'
    database = 'C:/db/testdb.db'
    database_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: sqlite3-conn1
        type: sqlite3
        name: sqlite3 Connection
        database: 'C:/db/testdb.db'
        database_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "sqlite3-conn1",
          "type": "sqlite3",
          "name": "sqlite3 Connection",
          "database": "C:/db/testdb.db",
          "database_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `database_var` can be omitted because is empty.

## Connection to Oracle database

Keys:

- `host`: ip or name of the Oracle server. String
- `host_var`: key to set a variable with the host. String.
- `port`: port to connect in Oracle server. Integer. Default 1521.
- `port_var`: key to set a variable with the port. String.
- `servicename`: service name or SID to connect in Oracle server. String
- `servicename_var`: key to set a variable with the service name or SID. String.
- `username`: username to connect in Oracle server. String
- `username_var`: key to set a variable with the username. String.
- `password`: password to connect in Oracle server. String
- `password_var`: key to set a variable with the password. String.
- `password_encrypted`: password id saved with the password to connect in Oracle server. String
- `password_encrypted_var`: key to set a variable with the password_encrypted. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'oracle-conn1'
    type = 'oracle'
    name = 'oracle Connection'
    host = 'localhost'
    username = 'test'
    password = 'pass'
    password_encrypted = ''
    servicename = 'XE'
    port = 1521
    host_var = ''
    username_var = ''
    password_var = ''
    servicename_var = ''
    port_var = ''
    password_encrypted_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: oracle-conn1
        type: oracle
        name: oracle Connection
        host: localhost
        username: test
        password: pass
        password_encrypted: ''
        servicename: 'XE'
        port: 1521
        host_var: ''
        username_var: ''
        password_var: ''
        servicename_var: ''
        port_var: ''
        password_encrypted_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "oracle-conn1",
          "type": "oracle",
          "name": "oracle Connection",
          "host": "localhost",
          "username": "test",
          "password": "pass",
          "password_encrypted": "",
          "servicename": "XE",
          "port": 1521,
          "host_var": "",
          "username_var": "",
          "password_var": "",
          "servicename_var": "",
          "port_var": "",
          "password_encrypted_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `port_var`, `host_var`, `username_var`, `password_var`, `password_encrypted`, `password_encrypted_var` and `servicename_var` can be omitted because are empty.

## Connection to IBM DB2 database

Keys:

- `host`: ip or name of the IBM DB2 server. String
- `host_var`: key to set a variable with the host. String.
- `port`: port to connect to dababase in IBM DB2 server. Integer. Default 50000.
- `port_var`: key to set a variable with the port. String.
- `database`: database to connect in IBM DB2 server. String
- `database_var`: key to set a variable with the database. String.
- `schema`: schema to connect in IBM DB2 server. String
- `schema_var`: key to set a variable with the schema. String.
- `username`: username to connect in IBM DB2 server. String
- `username_var`: key to set a variable with the username. String.
- `password`: password to connect in IBM DB2 server. String
- `password_var`: key to set a variable with the password. String.
- `password_encrypted`: password id saved with the password to connect in IBM DB2 server. String
- `password_encrypted_var`: key to set a variable with the password_encrypted. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'ibm-db2-conn1'
    type = 'ibm-db2'
    name = 'ibm-db2 Connection'
    host = 'localhost'
    username = 'test'
    password = 'pass'
    password_encrypted = ''
    database = 'SAMPLE'
    schema = 'SCHEMATEST'
    port = 50000
    host_var = ''
    username_var = ''
    password_var = ''
    database_var = ''
    port_var = ''
    password_encrypted_var = ''
    schema_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: ibm-db2-conn1
        type: ibm-db2
        name: ibm-db2 Connection
        host: localhost
        username: test
        password: pass
        password_encrypted: ''
        database: 'SAMPLE'
        schema: 'SCHEMATEST'
        port: 50000
        host_var: ''
        username_var: ''
        password_var: ''
        database_var: ''
        port_var: ''
        password_encrypted_var: ''
        schema_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "ibm-db2-conn1",
          "type": "ibm-db2",
          "name": "ibm-db2 Connection",
          "host": "localhost",
          "username": "test",
          "password": "pass",
          "password_encrypted": "",
          "database": "SAMPLE",
          "schema": "SCHEMATEST",
          "port": 50000,
          "host_var": "",
          "username_var": "",
          "password_var": "",
          "database_var": "",
          "port_var": "",
          "password_encrypted_var": "",
          "schema_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `port_var`, `schema_var`, `host_var`, `username_var`, `password_var`, `password_encrypted`, `password_encrypted_var` and `database_var` can be omitted because are empty.

## Connection to Ragged Right file

Keys:

- `path`: the path of file. String.
- `path_var`: key to set a variable with the path. String.
- `row_delimiter`: row delimiter of file. String.
- `row_delimiter_var`: key to set a variable with the row delimiter. String.
- `columns_len`: length of columns. Integer array.
- `encoding`: encoding of file. String. Default is `UTF-8` if not is specified.
- `encoding_var`: key to set a variable with the encoding. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'ragged-conn'
    type = 'ragged-right'
    name = 'RAGGED RIGHT CONNECTION'
    path = 'test/in_files/ragged.txt'
    path_var = ''
    row_delimiter = 'CRLF'
    row_delimiter_var = ''
    columns_len = [
        10,
        50,
        12,
    ]
    encoding = 'UTF-8'
    encoding_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: ragged-conn
        type: ragged-right
        name: RAGGED RIGHT CONNECTION
        path: test/in_files/ragged.txt
        path_var: ''
        row_delimiter: CRLF
        row_delimiter_var: ''
        columns_len:
          - 10
          - 50
          - 12
        encoding: 'UTF-8'
        encoding_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "ragged-conn",
          "type": "ragged-right",
          "name": "RAGGED RIGHT CONNECTION",
          "path": "test/in_files/ragged.txt",
          "path_var": "",
          "row_delimiter": "CRLF",
          "row_delimiter_var": "",
          "columns_len": [
            10,
            50,
            12
          ],
          "encoding": "UTF-8",
          "encoding_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `encoding_var`, `path_var` and `row_delimiter_var` can be omitted because are empty.

## Connection to Fixed Width file

Keys:

- `path`: the path of file. String.
- `path_var`: key to set a variable with the path. String.
- `row_delimiter`: row delimiter of file. String.
- `row_delimiter_var`: key to set a variable with the row delimiter. String.
- `columns_len`: length of columns. Integer array.
- `encoding`: encoding of file. String. Default is `UTF-8` if not is specified.
- `encoding_var`: key to set a variable with the encoding. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'fixed-conn'
    type = 'fixed-width'
    name = 'fixed width CONNECTION'
    path = 'test/in_files/fixed.txt'
    path_var = ''
    row_delimiter = 'CRLF'
    row_delimiter_var = ''
    columns_len = [
        10,
        50,
        12,
    ]
    encoding = 'UTF-8'
    encoding_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: fixed-conn
        type: fixed-width
        name: fixed width CONNECTION
        path: test/in_files/fixed.txt
        path_var: ''
        row_delimiter: CRLF
        row_delimiter_var: ''
        columns_len:
          - 10
          - 50
          - 12
        encoding: 'UTF-8'
        encoding_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "fixed-conn",
          "type": "fixed-width",
          "name": "fixed width CONNECTION",
          "path": "test/in_files/fixed.txt",
          "path_var": "",
          "row_delimiter": "CRLF",
          "row_delimiter_var": "",
          "columns_len": [
            10,
            50,
            12
          ],
          "encoding": "UTF-8",
          "encoding_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `encoding_var`, `path_var` and `row_delimiter_var` can be omitted because are empty.

## Connection to FTP server

Keys:

- `host`: ip or name of the FTP server. String
- `host_var`: key to set a variable with the host. String.
- `port`: port to connect to FTP server. Integer
- `port_var`: key to set a variable with the port. String.
- `username`: username to connect in FTP server. String
- `username_var`: key to set a variable with the username. String.
- `password`: password to connect in FTP server. String
- `password_var`: key to set a variable with the password. String.
- `password_encrypted`: password id saved with the password to connect in FTP server. String
- `password_encrypted_var`: key to set a variable with the password_encrypted. String.
- `connect_timeout`: timeout in seconds for connection attemp to FTP server. Integer
- `connect_timeout_var`: key to set a variable with the timeout in seconds for connection attemp to FTP server. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'ftp-conn'
    type = 'ftp'
    name = 'FTP Connection'
    host = 'ftp.host.com'
    port = 21
    username = 'test'
    password = 'pass'
    password_encrypted = ''
    connect_timeout = 15
    host_var = ''
    port_var = ''
    username_var = ''
    password_var = ''
    connect_timeout_var = ''
    password_encrypted_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: ftp-conn
        type: ftp
        name: FTP Connection
        host: ftp.host.com
        port: 21
        username: test
        password: pass
        password_encrypted: ''
        connect_timeout: 15
        host_var: ''
        port_var: ''
        username_var: ''
        password_var: ''
        connect_timeout_var: ''
        password_encrypted_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "ftp-conn",
          "type": "ftp",
          "name": "FTP Connection",
          "host": "ftp.host.com",
          "port": 21,
          "username": "test",
          "password": "pass",
          "password_encrypted": "",
          "connect_timeout": 15,
          "host_var": "",
          "port_var": "",
          "username_var": "",
          "password_var": "",
          "connect_timeout_var": "",
          "password_encrypted_var": ""
        }
      ]
    ```

!!! note
In these examples the keys `connect_timeout_var`, `host_var`, `username_var`, `password_var`, `password_encrypted`, `password_encrypted_var` and `port_var` can be omitted because are empty.

## Connection to HTTP URL

You can use this connection with `httprequest` and `soaprequest` job types.

Keys:

- `url`: url. String
- `url_var`: key to set a variable with the url. String.
- `username`: username to connect with basic authentication. String
- `username_var`: key to set a variable with the username. String.
- `password`: password to connect with basic authentication. String
- `password_var`: key to set a variable with the password. String.
- `password_encrypted`: password id saved with the password to connect with basic authentication. String
- `password_encrypted_var`: key to set a variable with the password_encrypted. String.
- `timeout`: timeout in seconds for connection to url. Integer
- `timeout_var`: key to set a variable with the timeout. String.
- `auth_type`: optional. Authentication type of connection. Permitted values: `basic`, `digest`, `none`. String. Default `none`.
- `auth_type_var`: optional. Key to set a variable with the authentication type. String.

!!! warning
    Digest authentication is not supported for `soaprequest`.

    For `soaprequest`, if the wsdl file is local, the url should be `file://` and the path of wsdl file. Example: `file://C:/WSDL_Directory/ipservice.asmx`

Examples: 

=== "TOML"
    ```toml
    [[connections]]
    id = 'http-conn'
    type = 'http'
    name = 'http Connection'
    url = 'http://wsgeoip.lavasoft.com/ipservice.asmx?WSDL'
    username = 'aaaaa'
    password = 'bbbbb'
    password_encrypted = ''
    timeout = 10
    url_var = ''
    username_var = ''
    password_var = ''
    timeout_var = ''
    password_encrypted_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: http-conn
        type: http
        name: http Connection
        url: 'http://wsgeoip.lavasoft.com/ipservice.asmx?WSDL'
        username: aaaaa
        password: bbbbb
        password_encrypted: ''
        timeout: 10
        url_var: ''
        username_var: ''
        password_var: ''
        timeout_var: ''
        password_encrypted_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "http-conn",
          "type": "http",
          "name": "http Connection",
          "url": "http://wsgeoip.lavasoft.com/ipservice.asmx?WSDL",
          "username": "aaaaa",
          "password": "bbbbb",
          "password_encrypted": "",
          "timeout": 10,
          "url_var": "",
          "username_var": "",
          "password_var": "",
          "timeout_var": "",
          "password_encrypted_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `url_var`, `timeout_var`, `username_var`, `password_var`, `password_encrypted` and `password_encrypted_var` can be omitted because are empty.

## Connection to SMTP server

Keys:

- `host`: ip or name of the SMTP server. String
- `host_var`: key to set a variable with the host. String.
- `port`: port to connect to SMTP server. Integer
- `port_var`: key to set a variable with the port. String.
- `username`: username to connect to SMTP server. String
- `username_var`: key to set a variable with the username. String.
- `password`: password to connect to SMTP server. String
- `password_var`: key to set a variable with the password. String.
- `password_encrypted`: password id saved with the password to connect to SMTP server. String
- `password_encrypted_var`: key to set a variable with the password_encrypted. String.
- `connect_timeout`: timeout in seconds to connect in SMTP server. Integer
- `connect_timeout_var`: key to set a variable with the connect timeout. String.
- `send_timeout`: timeout in seconds to send an email through SMTP server. Integer
- `send_timeout_var`: key to set a variable with the send timeout. String.
- `encryption_type`: encryption type of connection. Permitted values: `none`, `ssl`, `starttls`, otherwise `none` is used. String
- `encryption_type_var`: key to set a variable with the encryption type. String.
- `auth_type`: authentication type of connection. Permitted values: `plain`, `login`, `cram-md5`, otherwise `plain` is used. String
- `auth_type_var`: key to set a variable with the authentication type. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'smtp-conn'
    type = 'smtp'
    name = 'SMTP Connection'
    host = 'smtp.server.com'
    port = 25
    username = 'test@example.com'
    password = 'pass'
    password_encrypted = '20e54e43-1dad-457a-a9c6-a3520e598da9'
    encryption_type = 'none'
    auth_type = 'plain'
    connect_timeout = 10
    send_timeout = 10
    host_var = ''
    port_var = 'port3'
    username_var = 'smtpuser'
    password_var = 'smtppass'
    password_encrypted_var = ''
    encryption_type_var = 'encryption'
    auth_type_var = ''
    connect_timeout_var = 'connecttimeout'
    send_timeout_var = 'sendtimeout'
    ```

=== "YAML"
    ```yaml
    connections:
      - id: smtp-conn
        type: smtp
        name: SMTP Connection
        host: smtp.server.com
        port: 25
        username: test@example.com
        password: pass
        password_encrypted: 20e54e43-1dad-457a-a9c6-a3520e598da9
        encryption_type: none
        auth_type: plain
        connect_timeout: 10
        send_timeout: 10
        host_var: ''
        port_var: port3
        username_var: smtpuser
        password_var: smtppass
        password_encrypted_var: ''
        encryption_type_var: encryption
        auth_type_var: ''
        connect_timeout_var: connecttimeout
        send_timeout_var: sendtimeout
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "smtp-conn",
          "type": "smtp",
          "name": "SMTP Connection",
          "host": "smtp.server.com",
          "port": 25,
          "username": "test@example.com",
          "password": "pass",
          "password_encrypted": "20e54e43-1dad-457a-a9c6-a3520e598da9",
          "encryption_type": "none",
          "auth_type": "plain",
          "connect_timeout": 10,
          "send_timeout": 10,
          "host_var": "",
          "port_var": "smtpport",
          "username_var": "smtpuser",
          "password_var": "smtppass",
          "password_encrypted_var": "",
          "encryption_type_var": "encryption",
          "auth_type_var": "",
          "connect_timeout_var": "connecttimeout",
          "send_timeout_var": "sendtimeout"
        }
      ]
    ```

!!! note
    In these examples the keys  `port`, `username`, `encryption_type`, `send_timeout`, and `connect_timeout` can be omitted because keys with suffix `_var` are set.

    Also the keys  `host_var`, `password_encrypted_var` and `auth_type_var` can be omitted because keys are empty.

    Also the keys  `password` and `password_var` can be omitted because key `password_encrypted` is set.

## Connection to SAP HANA database

Keys:

- `host`: ip or name of the SAP HANA DB server. String
- `host_var`: key to set a variable with the host. String.
- `port`: port to connect to dababase in SAP HANA DB server. Integer. Default 39013.
- `port_var`: key to set a variable with the port. String.
- `schema`: schema to connect in SAP HANA DB server. String
- `schema_var`: key to set a variable with the schema. String.
- `username`: username to connect in SAP HANA DB server. String
- `username_var`: key to set a variable with the username. String.
- `password`: password to connect in SAP HANA DB server. String
- `password_var`: key to set a variable with the password. String.
- `password_encrypted`: password id saved with the password to connect in SAP HANA DB server. String
- `password_encrypted_var`: key to set a variable with the password_encrypted. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'sap-hdb-conn1'
    type = 'sap-hdb'
    name = 'sap-hdb Connection'
    host = 'localhost'
    username = 'test'
    password = 'pass'
    password_encrypted = ''
    schema = 'SCHEMATEST'
    port = 39013
    host_var = ''
    username_var = ''
    password_var = ''
    port_var = ''
    password_encrypted_var = ''
    schema_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: sap-hdb-conn1
        type: sap-hdb
        name: sap-hdb Connection
        host: localhost
        username: test
        password: pass
        password_encrypted: ''
        schema: 'SCHEMATEST'
        port: 39013
        host_var: ''
        username_var: ''
        password_var: ''
        port_var: ''
        password_encrypted_var: ''
        schema_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "sap-hdb-conn1",
          "type": "sap-hdb",
          "name": "sap-hdb Connection",
          "host": "localhost",
          "username": "test",
          "password": "pass",
          "password_encrypted": "",
          "schema": "SCHEMATEST",
          "port": 39013,
          "host_var": "",
          "username_var": "",
          "password_var": "",
          "port_var": "",
          "password_encrypted_var": "",
          "schema_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `port_var`, `schema_var`, `host_var`, `username_var`, `password_var`, `password_encrypted` and `password_encrypted_var` can be omitted because are empty.
  
## Connection to HTML Table

Keys:

- `path`: the path of file. String.
- `path_var`: key to set a variable with the path. String.
- `encoding`: encoding of file. String. Default is `UTF-8` if not is specified.
- `encoding_var`: key to set a variable with the encoding. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'html-table-conn1'
    type = 'html-table'
    name = 'HTML TABLE CONNECTION'
    path = 'test/out_files/test.html'
    path_var = ''
    encoding = 'UTF-8'
    encoding_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: html-table-conn1
        type: html-table
        name: HTML TABLE CONNECTION
        path: test/out_files/test.html
        path_var: ''
        encoding: 'UTF-8'
        encoding_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "html-table-conn1",
          "type": "html-table",
          "name": "HTML TABLE CONNECTION",
          "path": "test/out_files/test.html",
          "path_var": "",
          "encoding": "UTF-8",
          "encoding_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `path_var` and `encoding_var` can be omitted because are empty.

## Connection to Markdown Table

Keys:

- `path`: the path of file. String.
- `path_var`: key to set a variable with the path. String.
- `encoding`: encoding of file. String. Default is `UTF-8` if not is specified.
- `encoding_var`: key to set a variable with the encoding. String.

Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'markdown-table-conn1'
    type = 'markdown-table'
    name = 'MARKDOWN TABLE CONNECTION'
    path = 'test/out_files/test.md'
    path_var = ''
    encoding = 'UTF-8'
    encoding_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: markdown-table-conn1
        type: markdown-table
        name: MARKDOWN TABLE CONNECTION
        path: test/out_files/test.md
        path_var: ''
        encoding: 'UTF-8'
        encoding_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "markdown-table-conn1",
          "type": "markdown-table",
          "name": "MARKDOWN TABLE CONNECTION",
          "path": "test/out_files/test.md",
          "path_var": "",
          "encoding": "UTF-8",
          "encoding_var": ""
        }
      ]
    ```

!!! note
    In these examples the keys `path_var` and `encoding_var` can be omitted because are empty.

## Connection to AWS

Keys:

- `region`: Region to connect to AWS account. String.
- `region_var`: key to set a variable with the region. String.
- `access_key_id`: The Access Key ID to connect to AWS. String.
- `access_key_id_var`: key to set a variable with the access_key_id. String.
- `secret_access_key`: Secret Access Key to connect to AWS. String
- `secret_access_key_var`: key to set a variable with the secret_access_key. String.
- `secret_access_key_encrypted`: secret_access_key encrypted. String
- `secret_access_key_encrypted_var`: key to set a variable with the secret_access_key_encrypted. String.


Examples:

=== "TOML"
    ```toml
    [[connections]]
    id = 'aws-conn'
    type = 'aws'
    name = 'AWS Connection'
    region = 'us-east-2'
    access_key_id = 'ACCESSKEYID'
    secret_access_key = 'SECRETACCESSKEY'
    secret_access_key_encrypted = ''
    region_var = ''
    access_key_id_var = ''
    secret_access_key_var = ''
    secret_access_key_encrypted_var = ''
    ```

=== "YAML"
    ```yaml
    connections:
      - id: aws-conn
        type: aws
        name: AWS Connection
        region: 'us-east-2'
        access_key_id: ACCESSKEYID
        secret_access_key: SECRETACCESSKEY
        secret_access_key_encrypted: ''
        region_var: ''
        access_key_id_var: ''
        secret_access_key_var: ''
        secret_access_key_encrypted_var: ''
    ```

=== "JSON"
    ```json
    "connections": [
        {
          "id": "aws-conn",
          "type": "aws",
          "name": "AWS Connection",
          "region": "us-east-2",
          "access_key_id": "ACCESSKEYID",
          "secret_access_key": "SECRETACCESSKEY",
          "secret_access_key_encrypted": "",
          "region_var": "",
          "access_key_id_var": "",
          "secret_access_key_var": "",
          "secret_access_key_encrypted_var": ""
        }
      ]
    ```

!!! note
In these examples the keys `secret_access_key_encrypted`, `region_var`, `access_key_id_var`, `secret_access_key_var`, `secret_access_key_encrypted_var` can be omitted because are empty.