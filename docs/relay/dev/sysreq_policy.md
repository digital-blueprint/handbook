# System Requirements Policy

## Goals

The API gateway and all of the bundles should be runnable on a majority of systems
without the user having to install extra repositories or requiring updates using third party packages.

## Policy

* All libraries and bundles should try to support the following systems:

    * The latest Ubuntu release
    * The latest Debian Stable release that is older then one year
    * The latest Ubuntu LTS release that is older then one year
    * The latest Red Hat/Red Hat like release that is older then one year
    * The latest CentOS Stream release that is older then one year

    Rationale: The latest Ubuntu release to ease development and the one year
    limit to give users one year to update their system to the next stable
    release.

* Further more our PHP support range is limited by:

    * The PHP version range supported by the major Symfony version we use
    * The Symfony version we use needs to have active security support

* Specific non-core bundles can require other PHP version ranges, in case some
  features can not reasonable be provided otherwise. This should be highlighted
  in the bundle documentation.

* Any requirements for external dependencies, like databases, reverse proxies,
  file servers, external services, should ideally also be provided by the
  systems listed above.

## Further Resources

Links:

* https://symfony.com/releases#long-term-support-release
* https://endoflife.date/debian
* https://endoflife.date/ubuntu
* https://endoflife.date/almalinux
* https://endoflife.date/rocky-linux
* https://endoflife.date/oraclelinux
* https://endoflife.date/centos
* https://packages.debian.org/testing/php
* https://packages.debian.org/stable/php
* https://packages.debian.org/oldstable/php
* https://packages.ubuntu.com/search?keywords=php

Example for how to list PHP versions provided by AppStream in Red Hat like distros and how to switch between them:

```console
$ docker run -it quay.io/centos/centos:stream8 bash
$ dnf module list php
CentOS Stream 8 - AppStream
Name                Stream                 Profiles                                 Summary                             
php                 7.2 [d]                common [d], devel, minimal               PHP scripting language              
php                 7.3                    common [d], devel, minimal               PHP scripting language              
php                 7.4                    common [d], devel, minimal               PHP scripting language              
php                 8.0                    common [d], devel, minimal               PHP scripting language              

Hint: [d]efault, [e]nabled, [x]disabled, [i]nstalled
$ dnf module install php
$ dnf module switch-to php:8.0
```
