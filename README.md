# Postsrsd

[![Build Status](https://travis-ci.org/mricon/puppet-postsrsd.svg?branch=master)]
(https://travis-ci.org/mricon/puppet-postsrsd)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup](#setup)
4. [Reference](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview
Puppet module to manage postsrsd installation and configuration.

## Module Description
This module installs and configures the postsrsd daemon version 1.4+, see
https://github.com/roehling/postsrsd for more details.

This module was forked from https://github.com/thomasvs/puppet-postsrsd.

## Setup
You MUST set $srs_secret_content, as it is bad practice to use auto-generated
values (if you ever migrate, you will lose ability verify your previously
issued envelope-senders).

It's expected that this module will be used with hiera, so the quickest way to
configure it for your environment is to add it to your Puppetfile:

```
mod 'mricon-postsrsd'
```

The minimal configuration bits that should go into hiera are:

```yaml
postsrsd::config::srs_secret_content: 'somestring24+charslong'
```

Without the above, the module will refuse to run.

## Reference
### postsrsd

#### `manage_package`

Whether to manage the package. At least on Red Hat systems, the only place
where the postsrsd package is available is in one of the COPR locations.

Default: `true`

#### `manage_service`

Whether to manage the postsrsd service.

Default: `true`

#### `package_name`

Package name (OS-specific).

Default: `postsrsd`

#### `service_name`

Service name (OS-specific).

Default: `postsrsd`

#### `sysconfig_file`

Location of the startup parameters file.

Default: `/etc/sysconfig/postsrsd`

### postsrsd::config

For the descriptions, see the default configuration file.

#### `srs_domain`
You do not have to define it, as the default behaviour is for postsrsd to take
the output of `postconf -h mydomain`.

Default: undef

#### `srs_exclude_domains`
An *Array* of domains to exclude from being processed by postsrsd.

Default: undef

#### `srs_separator`
Default: '='

#### `srs_secret_file`
Location of the file with the secret used to hash the values.

Default: `/etc/postsrsd.secret`

#### `srs_secret_content`
The value of the secret used to hash the values. The only value that must be
set for the module to work.

Default: undef

#### `srs_hashlength`
Default: 4

#### `srs_hashmin`
Default: 4

#### `srs_forward_port`
Default: 10001

#### `srs_reverse_port`
Default: 10002

#### `srs_listen_addr`
Default: 127.0.0.1

#### `run_as`
Default: `nobody`

#### `chroot`
Default: undef

## Limitations
This module will NOT make any changes to your postfix installation, so you
will need to adjust your configuration using the postfix module.

Written and tested for CentOS 7 and Debian stretch (9) only. To get the package for CentOS, please see
https://copr.fedorainfracloud.org/coprs/natolumin/postsrsd/
