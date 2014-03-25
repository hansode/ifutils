#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare ifname=vlan2345

## functions

function setUp() {
  :
}

function tearDown() {
  :
}

function test_render_ifcfg_vlan_no_opts() {
  local body="DEVICE=vlan1000
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_vlan)"
}

function test_render_ifcfg_vlan_opts() {
  local body="DEVICE=${ifname}
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_vlan ${ifname})"
}

## shunit2

. ${shunit2_file}
