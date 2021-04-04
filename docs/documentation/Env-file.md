# Environment variables file

Dixer supports load a env file from path to load environment variables in file.

Use the key `env_file_path` or use the option `-ef` or `--envfile` from command line followed with file path of env file

A example test .env file:

```txt
OPTION_1 = "1"
OPTION_2 = "2"
OPTION_3 = 3
MY_NAME = "Santiago"
```

And to read env variables in the PCF use `env = true` in your variable declaration:

```toml
[[variables]]
name = 'OPTION_1'
type = 'string'
env = true

[[variables]]
name = 'OPTION_2'
type = 'string'
env = true

[[variables]]
name = 'OPTION_3'
type = 'int'
env = true

[[variables]]
name = 'MY_NAME'
type = 'string'
env = true
```