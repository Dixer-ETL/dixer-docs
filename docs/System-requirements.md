# System requeriments

## Hardware requeriments

Dixer was developed to use minimal resources, but this can increase because your workflow. (Especially when use a dataflow with millions of rows to destination XLSX).

### RAM

Dixer use in almost all **Jobs** few RAM.

**Jobs** like migrate to a Excel File use hugh RAM depending the total rows to migrate.

The mininal is 512 MB of RAM in most workflows.

### Processor

1 GHz minimal.

Also Dixer supports a variety of archs (depending your OS).

## Officially supported OS and archs

Dixer officially support the following OS and Archs:

### Windows

Windows Server 2008 R2 and higher or Windows 7 and higher. Only x64.

### Linux

Kernel version 2.6.23 or later. Only x64.

### macOS

macOS (OS X) 10.12 or higher. Only x64.

## Not officially supported OS and archs

Dixer offer evaluation binaries in these OS and Archs, but aren't officially supported:

### Windows (others)

* x86
* ARMv7 binary

### Linux (others)

* x86
* ARM (v5,v6,v7,v8): requires newer kernels at least v3.1
* MIPS, MIPSLE, MIPS64
* MIPS64LE: kernel 4.1 fails, works 4.8
* PPC64 and PPC64LE. POWER8 and POWER9
* S/390x
* RISC-V 64 bits

### OpenBSD

OpenBSD with kernel >= 6.2 and arch x86, x64, ARMv6, ARMv7, ARMv8

### FreeBSD

FreeBSD 11.2 or higher. x86, x64, ARMv6, ARMv7, ARMv8

### NetBSD

Kernel version >= 7.0 and x86, x64, ARMv6, ARMv7

ARMv8 can be unestable.

### Solaris

illumos (former OpenSolaris 10) based distributions or Oracle Solaris 11+. Only x64.

### Plan9

Plan9 for x86, x64, ARMv6, ARMv7

### DragonFly BSD

Kernel version 4.6 or higher. x64 only.

### AIX

PPC64 arch only. POWER8 and POWER9.