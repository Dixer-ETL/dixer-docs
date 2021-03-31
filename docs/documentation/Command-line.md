# Command line

When executing the Dixer binary with `-h` or `--help` this is the information displayed:

```
Options:
-g, --graph
        file path of generated graphviz compatible diagram file of PCF

-gh, --graphhtml
        same as --graph but result is the graph is embedded in html

-lic, --license
        license file path

-f, --file
        PCF file path

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

-ev, --encryptvalue
        encrypts a value to use in a key with suffix "_encrypted" in PCF

-genlicreq, --generatelicenserequest
        generates the file containing the information for license generation request

-c, --color
        enable or disable colored messages in terminal [0|1] default: 1

-h, --help
        display this help information
```

Examples:

- Executing a PCF: `Dixer_binary -f path_of_pcf`

- Executing a PCF setting variables values: `Dixer_binary -f path_of_pcf -v variable1="my name" -v variable2="my lastname"`

- Encrypting a PCF: `Dixer_binary -f path_of_pcf -en`