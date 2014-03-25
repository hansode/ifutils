#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare ifname=eth0

## functions

function setUp() {
  :
}

function tearDown() {
  :
}

function test_gen_ifcfg_path_no_opts() {
  assertEquals $(gen_ifcfg_path) /etc/sysconfig/network-scripts/ifcfg-${ifname}
}

function test_gen_ifcfg_path_opts() {
  assertEquals $(gen_ifcfg_path ${ifname}) /etc/sysconfig/network-scripts/ifcfg-${ifname}
}

## shunit2

. ${shunit2_file}
