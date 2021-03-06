ifutils
=======

[![Build Status](https://travis-ci.org/hansode/ifutils.svg)](https://travis-ci.org/hansode/ifutils)

+ `ifcfg-setup` is a utility and framework for `/etc/sysconfig/network-scripts/ifcfg-X` file management
+ `iftree` shows networking interface hierarchy

Requirements
------------

+ [bash](http://www.gnu.org/software/bash/)

Installation
------------

```
$ git clone https://github.com/hansode/ifutils.git
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
+ bonding
+ bridge
+ vlan
+ tap

Options
-------

+ onboot
+ ip
+ mask
+ net
+ bcast
+ gw
+ mac
+ dns1
+ dns2
+ bridge

License
-------

[Beerware](http://en.wikipedia.org/wiki/Beerware) license.

If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.
