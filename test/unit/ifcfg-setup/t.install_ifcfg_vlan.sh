#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare ifname=vlan2345
IFCFG_PATH_PREFIX=ifcfg-vlan9

## functions

function setUp() {
  function install_ifcfg_file() { echo ${@}; }
}

function tearDown() {
  :
}

function test_install_ifcfg_vlan_no_opts() {
  install_ifcfg_vlan
  assertEquals 0 ${?}
}

function test_install_ifcfg_vlan_opts() {
  install_ifcfg_vlan ${ifname}
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
