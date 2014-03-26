#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare ifname=bond0

## functions

function setUp() {
  :
}

function tearDown() {
  :
}

function test_render_ifcfg_bond_master_no_opts() {
  local body="DEVICE=bond0
BOOTPROTO=none
ONBOOT=yes
BONDING_OPTS=\"mode=1\""
  assertEquals "${body}" "$(render_ifcfg_bond_master)"
}

function test_render_ifcfg_bond_master_opts() {
  local body="DEVICE=${ifname}
BOOTPROTO=none
ONBOOT=yes
BONDING_OPTS=\"mode=1\""
  assertEquals "${body}" "$(render_ifcfg_bond_master ${ifname})"
}

function test_render_ifcfg_bond_master_opts_mode() {
  local mode=2
  local body="DEVICE=${ifname}
BOOTPROTO=none
ONBOOT=yes
BONDING_OPTS=\"mode=${mode}\""
  assertEquals "${body}" "$(render_ifcfg_bond_master ${ifname} mode=${mode})"
}

## shunit2

. ${shunit2_file}
