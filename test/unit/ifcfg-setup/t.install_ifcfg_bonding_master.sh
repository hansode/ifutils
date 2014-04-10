#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare device=bond0
IFCFG_PATH_PREFIX=ifcfg-bond9

## functions

function setUp() {
  function install_ifcfg_file() { echo ${@}; }
}

function tearDown() {
  :
}

function test_install_ifcfg_bonding_master_no_opts() {
  install_ifcfg_bonding_master
  assertEquals 0 ${?}
}

function test_install_ifcfg_bonding_master_opts() {
  install_ifcfg_bonding_master ${device}
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
