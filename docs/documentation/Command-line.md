# Command line

When executing the Dixer binary with `-h` or `--help` this is the information displayed:

```
Options:
-g, --graph
        file path of PCF graph in html

-lic, --license
        license file path

-f, --file
        PCF file path

-ef, --envfile
        Environment variables file path

-fmt, --format
        PCF format [toml|json|yaml] default: toml

-v, --variable
        set value to variable. Example value: var1="variable value"

-w, --workflow
        modify exec_workflow in PCF to execute defined workflow

-en, --encrypt
        encrypt PCF file with password specified

-de, --decrypt
        decrypt PCF file with password specified

-p, --password
        execute encrypted PCF with password

-gcp, --gcpercent
        sets the garbage collection target percentage

-ncpu, --numcpu
        sets the number of logical processors to use

-memlimit, --memorylimit
        sets the memory limit to use in bytes

-ev, --encryptvalue
        encrypts a value to use in a key with suffix "_encrypted" in PCF

-genlicreq, --generatelicenserequest
        generates the file containing the information for license generation request

-c, --color
        enable or disable colored messages in terminal [0|1] default: 1

-h, --help
        display this help information

-licreqname, --licenserequestname
        set the name in license request

-licreqemail, --licenserequestemail
        set the email in license request

-licrequrl, --licenserequesturl
        set the url in license request

-licreqcompany, --licenserequestcompany
        set the company name in license request
```

!!! note
    You can disable the color in terminal setting the [`NO_COLOR`](https://no-color.org/) environment variable to any value or setting the `TERM` environment variable to `dumb`.

## Examples

### Execute a PCF

```bash
/path/dixer/binary -f path_of_pcf
```

### Execute a PCF setting variables values

```bash
/path/dixer/binary -f path_of_pcf -v variable1="my name" -v variable2="my lastname"
```

### Encrypting a PCF

```bash
/path/dixer/binary -f path_of_pcf -en
```

### Execute a specific job in your PCF

```bash
/path/dixer/binary -f path_of_pcf -w jobID
```

### Execute a specific workflow in your PCF

```bash
/path/dixer/binary -f path_of_pcf -w jobID1:jobID2,jobID3
```
