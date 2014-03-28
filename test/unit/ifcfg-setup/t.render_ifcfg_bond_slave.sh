#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare device=eth0

## functions

function setUp() {
  :
}

function tearDown() {
  :
}

function test_render_ifcfg_bond_slave_no_opts() {
  local body="DEVICE=${device}
BOOTPROTO=none
ONBOOT=yes
MASTER=${master}
SLAVE=yes"
  assertEquals "${body}" "$(render_ifcfg_bond_slave)"
}

function test_render_ifcfg_bond_slave_opts() {
  local body="DEVICE=${device}
BOOTPROTO=none
ONBOOT=yes
MASTER=${master}
SLAVE=yes"
  assertEquals "${body}" "$(render_ifcfg_bond_slave ${device})"
}

## shunit2

. ${shunit2_file}
