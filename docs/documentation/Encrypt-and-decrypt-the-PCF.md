# Encrypt and decrypt the PCF

The PCF can be encrypted to disallow other view the content.

When you encrypt the PCF, the password entered in console should be used only for decryption, the console returns a random password to execute the encrypted PCF.

To encrypt, use the options:
- `-f` or `--file` and the path of PCF to encrypt
- `-fmt` or `--format` and the format of  PCF (no needed for toml format)
- `-en` or `--encrypt`

Examples:

```bash
-f path_of_pcf.toml -en
```

```bash
-f path_of_pcf.json -fmt json -en
```

```bash
-f path_of_pcf.yml -fmt yaml -en
```

To decrypt, use - `-de` or `--decrypt`, no neccesary to specify the format.

Examples:

```bash
-f path_of_pcf.toml -de
```

```bash
-f path_of_pcf.json -de
```

```bash
-f path_of_pcf.yml -de
```

## Execute a encrypted PCF

To execute it, use `-p` or `--password` option followed by the random password generated for execute only.

Example:

```bash
-f path_of_pcf.yml -fmt yaml -p RANDOM_PASSWORD
```