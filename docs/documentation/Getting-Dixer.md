# Getting Dixer

You can download a evaluation binary [here](../Download.md).

## Setup

### Add execute permissions

In UNIX systems, add execution permission to binary downloaded with `chmod +x dixer_binary`.

### Execute Green and Full editions in Linux and macOS

Green and Full editions needs to export environments variables `LD_LIBRARY_PATH` in Linux and `DYLD_LIBRARY_PATH` in macOS with the path of `clidriver/lib` required to use IBM DB2 driver.

Linux:

```
export LD_LIBRARY_PATH=THE_PATH_OF_CLIDRIVER/lib
```

macOS:

```
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:THE_PATH_OF_CLIDRIVER/lib
```

### Using a non-root account for dmidecode (only for licensed binaries)

In Linux, to use a license it's neccesary to allow a non-root account for `dmidecode`.

By default, the dmidecode command can only be run on Unix systems using the root user account.

Using a standard user account will display the following error

```
/dev/mem: Permission denied
```

To allow a non-root account to execute the dmidecode application the following steps must be completed.

- Select an existing account, or create a new dedicated user account on the Unix systems.
- Open the sudoers configuration file - typically `/etc/sudoers`.
- Add the following settings to the sudoers file

```
User_Alias DIXERLIC = YOUR_USERNAME
Cmnd_Alias DMIDECODE = /usr/sbin/dmidecode
DIXERLIC ALL = NOPASSWD: DMIDECODE
```

The non-root user should now be able to execute the dmidecode command without being prompted for a password.