#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare ifname=tap0

## functions

function setUp() {
  function install_ifcfg_file() { echo ${@}; }
  function configure_bonding_conf() { echo ${@}; }
  function configure_vlan_conf() { echo ${@}; }
  function gen_ifcfg_path() { echo /dev/null; }
}

function tearDown() {
  :
}

function test_ifcfg_cli_render() {
  local cmd=render

  ifcfg_cli ${cmd} ethernet eth0
  assertEquals 0 ${?}

  ifcfg_cli ${cmd} bridge br0
  assertEquals 0 ${?}

  ifcfg_cli ${cmd} vlan vlan2000
  assertEquals 0 ${?}

  ifcfg_cli ${cmd} tap tap0
  assertEquals 0 ${?}
}

function test_ifcfg_cli_install() {
  local cmd=install

  ifcfg_cli ${cmd} ethernet eth0
  assertEquals 0 ${?}

  ifcfg_cli ${cmd} bridge br0
  assertEquals 0 ${?}

  ifcfg_cli ${cmd} vlan vlan2000
  assertEquals 0 ${?}

  ifcfg_cli ${cmd} tap tap0
  assertEquals 0 ${?}
}

function test_ifcfg_cli_map() {
  local cmd=map

  ifcfg_cli ${cmd} vlan vlan2000
  assertEquals 0 ${?}

  ifcfg_cli ${cmd} bridge br0
  assertEquals 0 ${?}
}

function test_ifcfg_cli_undefined() {
  ifcfg_cli undefined ethernet eth0
  assertNotEquals 0 ${?}

  ifcfg_cli render unknown eth0
  assertNotEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
