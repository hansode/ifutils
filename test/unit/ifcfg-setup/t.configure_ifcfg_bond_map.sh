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
  function install_ifcfg_file() { echo ${@}; }
  function configure_bonding_conf() { :; }
  function install_ifcfg_bond_master() { :; }
  function install_ifcfg_bond_slave() { :; }
}

function tearDown() {
  :
}

function test_configure_ifcfg_bond_map_no_opts() {
  configure_ifcfg_bond_map
  assertEquals 0 ${?}
}

function test_configure_ifcfg_bond_map_opts() {
  configure_ifcfg_bond_map
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
