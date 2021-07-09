# Supported data types

Dixer supports almost all datatypes of all databases supported when source is a RDBMS database, if you find a unsupported datatype message, please create an issue.

But, for destination, not all datatypes are covered. This is the list of supported datatypes when destination is a database.

!!! note
    In some cases datatypes names used in Dixer is the name provided by the driver, but for the user can be other datatype. Please test your destination datatype before create an issue.

## Oracle supported data type destinations

- CHAR
- FLOAT
- NCHAR
- DATE
- TIMESTAMP
- DOUBLE
- LONG RAW
- LONG
- NUMBER
- INTERVAL DAY TO SECOND
- INTERVAL YEAR TO MONTH
- NCLOB
- RAW
- TIMESTAMP WITH LOCAL TIME ZONE
- TIMESTAMP WITH TIME ZONE
- VARCHAR2
- NVARCHAR2

## Microsoft SQL Server supported data type destinations

- TEXT
- REAL
- BIGINT
- VARBINARY
- BIT
- CHAR
- DECIMAL
- FLOAT
- INT
- MONEY (not supported with Fast Load)
- NVARCHAR
- NTEXT
- NCHAR
- SMALLINT
- SMALLMONEY (not supported with Fast Load)
- TIME
- BINARY
- TINYINT
- VARCHAR
- DATE
- DATETIME
- SMALLDATETIME
- DATETIME2
- DATETIMEOFFSET

## MySQL supported data type destinations

- TEXT
- BLOB
- BIGINT
- VARBINARY
- BIT
- CHAR
- DECIMAL
- FLOAT
- INT
- SMALLINT
- TIME
- BINARY
- TINYINT
- VARCHAR
- DATE
- DATETIME
- TIMESTAMP
- DOUBLE

## PostgreSQL supported data type destinations

- TEXT
- NUMERIC
- BIT
- CHAR
- MONEY
- VARCHAR
- DATE
- TIMESTAMP
- CHAR ARRAY
- INT8
- VARBIT
- BOOL
- BPCHAR
- CID
- FLOAT8
- INT4
- INTERVAL
- JSON
- MACADDR
- NAME
- NUMRANGE
- OID
- FLOAT4
- INT2
- BYTEA
- TIMESTAMPTZ
- MACADDR8
- JSONB

!!! info
    There are a lot of datatypes in PostgreSQL, if you need support for one datatype please create an issue with result of this job:

    ```toml
    [[jobs]]
    id = 'pgtypes'
    name = 'PGSQL Types TO CSV'
    type = 'dataflow'
    disable = false
    ignore_error = false

    [jobs.source_config]
    connection = 'YOUR_POSTGRESQL_CONNECTION_ID'
    query = '''
    select version(),0 as oid
    union all
    SELECT typname, oid FROM pg_type WHERE oid < 10000 ORDER BY oid
    '''

    [jobs.destination_config]
    connection = 'conn-pgtypes'
    eol = 'CRLF'
    columns_name_in_first_row = true

    [[jobs.mapping]]
    column_source = '*'
    column_destination = '*'
    ```

## SQLite3 supported data type destinations

- TEXT
- BLOB (in hexadeximal format)
- INTEGER
- REAL
- NUMERIC

## IBM DB2 supported data type destinations

- BLOB
- INTEGER
- REAL
- BIGINT
- CHAR
- DECIMAL
- SMALLINT
- TIME
- VARCHAR
- DATE
- TIMESTAMP
- DOUBLE
- LONG VARCHAR
- CLOB
- CHAR FOR BIT DATA
- XML
- DECFLOAT

## SAP HANA DB supported data type destinations

- BLOB
- BOOLEAN
- INTEGER
- REAL
- BIGINT
- VARBINARY
- DECIMAL
- SMALLINT
- BINARY
- TINYINT
- VARCHAR
- DOUBLE
- SHORTTEXT
- ALPHANUM
- DAYDATE
- SECONDTIME
- SECONDDATE
- LONGDATE
- TEXT
- BINTEXT

## Firebird SQL supported data type destinations

- TEXT
- BLOB
- FLOAT
- TIME
- DATE
- TIMESTAMP
- LONG
- INT64
- SHORT
- VARYING
- DOUBLE
- BOOLEAN