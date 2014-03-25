#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare ifname=bond0
IFCFG_PATH_PREFIX=ifcfg-bond9

## functions

function setUp() {
  :
}

function tearDown() {
  :
}

function test_install_ifcfg_bond_master_no_opts() {
  install_ifcfg_bond_master
  assertEquals 0 ${?}
}

function test_install_ifcfg_bond_master_opts() {
  install_ifcfg_bond_master ${ifname}
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
