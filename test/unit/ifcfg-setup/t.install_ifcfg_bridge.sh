#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare device=br0
IFCFG_PATH_PREFIX=ifcfg-br9

## functions

function setUp() {
  function install_ifcfg_file() { echo ${@}; }
}

function tearDown() {
  :
}

function test_install_ifcfg_bridge_no_opts() {
  install_ifcfg_bridge
  assertEquals 0 ${?}
}

function test_install_ifcfg_bridge_opts() {
  install_ifcfg_bridge ${device}
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
