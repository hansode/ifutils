ifcfg-setup
===========

[![Build Status](https://travis-ci.org/hansode/ifcfg-setup.svg)](https://travis-ci.org/hansode/ifcfg-setup)

`ifcfg-setup` is a utility and framework for `/etc/sysconfig/network-scripts/ifcfg-X` file management

Requirements
------------

+ [bash](http://www.gnu.org/software/bash/)

Installation
------------

```
$ git clone https://github.com/hansode/ifcfg-setup.git
```

Usage
-----

```
$ ifcfg-setup <command> <device-type> <device-name> [opts...]
```

Getting Started
---------------

Install ifcfg-eth1.

```
$ ./bin/ifcfg-setup install ethernet eth1 ip=192.168.1.2 gw=192.168.1.1 bcast=192.168.1.255 net=192.168.1.0 mac=fe:ff:ff:ff:ff
DEVICE=eth1
TYPE=Ethernet
BOOTPROTO=static
ONBOOT=yes
IPADDR=192.168.1.2
NETWORK=192.168.1.0
BROADCAST=192.168.1.255
GATEWAY=192.168.1.1
```

Commands
--------

+ render
+ install
+ map

Device Types
------------

+ ethernet
+ bridge
+ vlan
+ tap

Options
-------

+ ip
+ mac
+ hw
+ mask
+ net
+ bcast
+ gw
+ dns1
+ dns2

License
-------

[Beerware](http://en.wikipedia.org/wiki/Beerware) license.

If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.
