#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

IFCFG_VLAN_CONF_PATH=vlan.conf.$$

## functions

function setUp() {
  touch ${IFCFG_VLAN_CONF_PATH}
}

function tearDown() {
  rm  ${IFCFG_VLAN_CONF_PATH}
}

function test_configure_vlan_conf_no_opts() {
  configure_vlan_conf
  assertEquals 0 ${?}

  assertEquals "VLAN=yes
VLAN_NAME_TYPE=VLAN_PLUS_VID_NO_PAD" "$(cat ${IFCFG_VLAN_CONF_PATH})"
}

## shunit2

. ${shunit2_file}
