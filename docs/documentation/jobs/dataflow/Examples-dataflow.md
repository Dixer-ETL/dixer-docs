# Examples `dataflow`

## CSV to JSON

Example showing a simple `dataflow` from CSV file to JSON file.

??? example
    === "TOML"
        ```toml
        exec_workflow = 'job_1'

        [[connections]]
        id = 'csv-conn'
        type = 'csv'
        name = 'CSV CONNECTION'
        path = 'PATH_OF_CSV'
        delimiter = ','
        enclosure = '"'

        [[connections]]
        id = 'json-conn'
        type = 'json'
        name = 'JSON CONNECTION'
        path = 'PATH_OF_JSON'
        array_key = 'list'

        [[jobs]]
        id = 'job_1'
        name = 'CSV TO JSON'
        type = 'dataflow'
        disable = false
        ignore_error = false

        [jobs.source_config]
        connection_id = 'csv-conn'

        [jobs.destination_config]
        connection_id = 'json-conn'

        [[jobs.mapping]]
        column_source = '0'
        column_destination = 'firstname'
        omit = false

        [[jobs.mapping]]
        column_source = '1'
        column_destination = 'lastname'
        omit = false
        ```

    === "YAML"
        ```yaml
        exec_workflow: job_1
        connections:
          - id: csv-conn
            type: csv
            name: CSV CONNECTION
            path: PATH_OF_CSV
            delimiter: ','
            enclosure: '"'
          - id: json-conn
            type: json
            name: JSON CONNECTION
            path: PATH_OF_JSON
            array_key: list
        jobs:
          - id: job_1
            name: CSV TO JSON
            type: dataflow
            disable: false
            ignore_error: false
            source_config:
              connection_id: csv-conn
            destination_config:
              connection_id: json-conn
            mapping:
              - column_source: '0'
                column_destination: firstname
                omit: false
              - column_source: '1'
                column_destination: lastname
                omit: false
        ```

    === "JSON"
        ```json
        {
            "exec_workflow": "job_1",
            "connections": [
            {
                "id": "csv-conn",
                "type": "csv",
                "name": "CSV CONNECTION",
                "path": "PATH_OF_CSV",
                "delimiter": ",",
                "enclosure": "\""
            },
            {
                "id": "json-conn",
                "type": "json",
                "name": "JSON CONNECTION",
                "path": "PATH_OF_JSON",
                "array_key": "list"
            }
            ],
            "jobs": [
            {
                "id": "job_1",
                "name": "CSV TO JSON",
                "type": "dataflow",
                "disable": false,
                "ignore_error": false,
                "source_config": {
                    "connection_id": "csv-conn"
                },
                "destination_config": {
                    "connection_id": "json-conn"
                },
                "mapping": [
                {
                    "column_source": "0",
                    "column_destination": "firstname",
                    "omit": false
                },
                {
                    "column_source": "1",
                    "column_destination": "lastname",
                    "omit": false
                }
                ]
            }
            ]
        }
        ```

## MYSQL to ORACLE

Example showing a simple `dataflow` between databases

??? example
    === "TOML"
        ```toml
        exec_workflow = 'job_1'

        [[connections]]
        id = 'mysql-conn'
        type = 'mysql'
        name = 'MYSQL Connection'
        host = 'localhost'
        username = 'usr'
        password = 'pass'
        database = 'test'
        port = 3306

        [[connections]]
        id = 'oracle-conn'
        type = 'oracle'
        name = 'ORACLE Connection'
        host = 'host_oracle'
        port = 1521
        username = 'user'
        password = 'pass'
        servicename = 'XE'

        [[jobs]]
        id = 'job_1'
        name = 'MySQL TO ORACLE'
        type = 'dataflow'
        disable = false
        ignore_error = false

        [jobs.source_config]
        connection_id = 'mysql-conn'
        query = 'select cast(now() as date) as date1, now() as date2'

        [jobs.destination_config]
        connection_id = 'oracle-conn'
        table = 'TEST'

        [[jobs.mapping]]
        column_source = 'date1'
        column_destination = 'DATE1'

        [[jobs.mapping]]
        column_source = 'date2'
        column_destination = 'DATE2'
        ```

    === "YAML"
        ```yaml
        exec_workflow: job_1
        connections:
          - id: mysql-conn
            type: mysql
            name: MYSQL Connection
            host: localhost
            username: usr
            password: pass
            database: test
            port: 3306
          - id: oracle-conn
            type: oracle
            name: ORACLE Connection
            host: host_oracle
            port: 1521
            username: user
            password: pass
            servicename: XE
        jobs:
          - id: job_1
            name: MySQL TO ORACLE
            type: dataflow
            disable: false
            ignore_error: false
            source_config:
              connection_id: mysql-conn
              query: 'select cast(now() as date) as date1, now() as date2'
            destination_config:
              connection_id: oracle-conn
              table: TEST
            mapping:
              - column_source: date1
                column_destination: DATE1
              - column_source: date2
                column_destination: DATE2

        ```
    
    === "JSON"
        ```json
        {
            "exec_workflow": "job_1",
            "connections": [
              {
                "id": "mysql-conn",
                "type": "mysql",
                "name": "MYSQL Connection",
                "host": "localhost",
                "username": "usr",
                "password": "pass",
                "database": "test",
                "port": 3306
              },
              {
                "id": "oracle-conn",
                "type": "oracle",
                "name": "ORACLE Connection",
                "host": "host_oracle",
                "port": 1521,
                "username": "user",
                "password": "pass",
                "servicename": "XE"
              }
            ],
            "jobs": [
              {
                "id": "job_1",
                "name": "MySQL TO ORACLE",
                "type": "dataflow",
                "disable": false,
                "ignore_error": false,
                "source_config": {
                  "connection_id": "mysql-conn",
                  "query": "select cast(now() as date) as date1, now() as date2"
                },
                "destination_config": {
                  "connection_id": "oracle-conn",
                  "table": "TEST"
                },
                "mapping": [
                  {
                    "column_source": "date1",
                    "column_destination": "DATE1"
                  },
                  {
                    "column_source": "date2",
                    "column_destination": "DATE2"
                  }
                ]
              }
            ]
        }
        ```

## XLSX to XML and RAGGED RIGHT to CSV in parallel

Example showing the execution of two jobs with type `dataflow` in parallel.

??? example
    === "TOML"
        ```toml
        exec_workflow = 'job_1,job_2'

        [[connections]]
        id = 'xlsx-conn'
        type = 'xlsx'
        name = 'EXCEL CONNECTION'
        path = 'PATH_OF_XLSX'
        sheet_name = 'SHEET_NAME'

        [[connections]]
        id = 'xml-conn'
        type = 'xml'
        name = 'XML CONNECTION'
        path = 'PATH_OF_XML'
        root_name = 'root'
        row_name = 'info'

        [[connections]]
        id = 'ragged-conn'
        type = 'ragged-right'
        name = 'RAGGED RIGHT CONNECTION'
        path = 'PATH_OF_FILE'
        row_delimiter = 'CRLF'
        columns_len = [
            20,
            25,
        ]

        [[connections]]
        id = 'csv-conn'
        type = 'csv'
        name = 'CSV CONNECTION'
        path = 'PATH_OF_CSV'
        delimiter = ','
        enclosure = '"'

        [[jobs]]
        id = 'job_1'
        name = 'XLSX TO XML'
        type = 'dataflow'
        disable = false
        ignore_error = false
        omit_rows = 1

        [jobs.source_config]
        connection_id = 'xlsx-conn'

        [jobs.destination_config]
        connection_id = 'xml-conn'

        [[jobs.mapping]]
        column_source = 'A'
        column_destination = 'firstname'

        [[jobs.mapping]]
        column_source = 'B'
        column_destination = 'lastname'

        [[jobs]]
        id = 'job_2'
        name = 'RAGGED RIGHT TO CSV'
        type = 'dataflow'
        disable = false
        ignore_error = false

        [jobs.source_config]
        connection_id = 'ragged-conn'

        [jobs.destination_config]
        connection_id = 'csv-conn'
        eol = 'CRLF'
        columns_name_in_first_row = false

        [[jobs.mapping]]
        column_source = '0'
        column_destination = 'firstname'

        [[jobs.mapping]]
        column_source = '1'
        column_destination = 'lastname'
        ```

    === "YAML"
        ```yaml
        exec_workflow: 'job_1,job_2'
        connections:
          - id: xlsx-conn
            type: xlsx
            name: EXCEL CONNECTION
            path: PATH_OF_XLSX
            sheet_name: SHEET_NAME
          - id: xml-conn
            type: xml
            name: XML CONNECTION
            path: PATH_OF_XML
            root_name: root
            row_name: info
          - id: ragged-conn
            type: ragged-right
            name: RAGGED RIGHT CONNECTION
            path: PATH_OF_FILE
            row_delimiter: CRLF
            columns_len:
              - 20
              - 25
          - id: csv-conn
            type: csv
            name: CSV CONNECTION
            path: PATH_OF_CSV
            delimiter: ','
            enclosure: '"'
        jobs:
          - id: job_1
            name: XLSX TO XML
            type: dataflow
            disable: false
            ignore_error: false
            omit_rows: 1
            source_config:
              connection_id: xlsx-conn
            destination_config:
              connection_id: xml-conn
            mapping:
              - column_source: A
                column_destination: firstname
              - column_source: B
                column_destination: lastname
          - id: job_2
            name: RAGGED RIGHT TO CSV
            type: dataflow
            disable: false
            ignore_error: false
            source_config:
              connection_id: ragged-conn
            destination_config:
              connection_id: csv-conn
              eol: CRLF
              columns_name_in_first_row: false
            mapping:
              - column_source: '0'
                column_destination: firstname
              - column_source: '1'
                column_destination: lastname
        ```
    
    === "JSON"
        ```json
        {
            "exec_workflow": "job_1,job_2",
            "connections": [
              {
                "id": "xlsx-conn",
                "type": "xlsx",
                "name": "EXCEL CONNECTION",
                "path": "PATH_OF_XLSX",
                "sheet_name": "SHEET_NAME"
              },
              {
                "id": "xml-conn",
                "type": "xml",
                "name": "XML CONNECTION",
                "path": "PATH_OF_XML",
                "root_name": "root",
                "row_name": "info"
              },
              {
                "id": "ragged-conn",
                "type": "ragged-right",
                "name": "RAGGED RIGHT CONNECTION",
                "path": "PATH_OF_FILE",
                "row_delimiter": "CRLF",
                "columns_len": [
                  20,
                  25
                ]
              },
              {
                "id": "csv-conn",
                "type": "csv",
                "name": "CSV CONNECTION",
                "path": "PATH_OF_CSV",
                "delimiter": ",",
                "enclosure": "\""
              }
            ],
            "jobs": [
              {
                "id": "job_1",
                "name": "XLSX TO XML",
                "type": "dataflow",
                "disable": false,
                "ignore_error": false,
                "omit_rows": 1,
                "source_config": {
                  "connection_id": "xlsx-conn"
                },
                "destination_config": {
                  "connection_id": "xml-conn"
                },
                "mapping": [
                  {
                    "column_source": "A",
                    "column_destination": "firstname"
                  },
                  {
                    "column_source": "B",
                    "column_destination": "lastname"
                  }
                ]
              },
              {
                "id": "job_2",
                "name": "RAGGED RIGHT TO CSV",
                "type": "dataflow",
                "disable": false,
                "ignore_error": false,
                "source_config": {
                  "connection_id": "ragged-conn"
                },
                "destination_config": {
                  "connection_id": "csv-conn",
                  "eol": "CRLF",
                  "columns_name_in_first_row": false
                },
                "mapping": [
                  {
                    "column_source": "0",
                    "column_destination": "firstname"
                  },
                  {
                    "column_source": "1",
                    "column_destination": "lastname"
                  }
                ]
              }
            ]
        }
        ```

