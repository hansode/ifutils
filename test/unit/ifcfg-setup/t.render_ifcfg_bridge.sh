#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare device=br0

## functions

function setUp() {
  :
}

function tearDown() {
  :
}

function test_render_ifcfg_bridge_no_opts() {
  local body="DEVICE=br0
TYPE=Bridge
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_bridge)"
}

function test_render_ifcfg_bridge_opts() {
  local body="DEVICE=${device}
TYPE=Bridge
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_bridge ${device})"
}

function test_render_ifcfg_bridge_opts_mac() {
  local body="DEVICE=${device}
TYPE=Bridge
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_bridge ${device} mac=${mac})"
}

## shunit2

. ${shunit2_file}
