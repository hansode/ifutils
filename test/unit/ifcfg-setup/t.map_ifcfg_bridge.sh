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

function test_map_ifcfg_bridge_no_opts() {
  map_ifcfg_bridge
  assertEquals 0 ${?}
}

function test_map_ifcfg_bridge_opts() {
  map_ifcfg_bridge
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
