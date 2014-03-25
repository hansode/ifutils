#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

function setUp() {
  function gen_ifcfg_path() { echo /dev/null; }
}

function tearDown() {
  :
}

function test_configure_ifcfg_vlan_map_no_opts() {
  configure_ifcfg_vlan_map
  assertEquals 0 ${?}
}

function test_configure_ifcfg_vlan_map_opts() {
  configure_ifcfg_vlan_map
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
