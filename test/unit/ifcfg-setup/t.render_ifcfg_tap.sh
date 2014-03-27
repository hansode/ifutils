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
  :
}

function tearDown() {
  :
}

function test_render_ifcfg_tap_no_opts() {
  local body="DEVICE=tap0
TYPE=Tap
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_tap)"
}

function test_render_ifcfg_tap_opts() {
  local body="DEVICE=${ifname}
TYPE=Tap
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_tap ${ifname})"
}

function test_render_ifcfg_tap_opts_mac() {
  local body="DEVICE=${ifname}
TYPE=Tap
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_tap ${ifname} mac=${mac})"
}

## shunit2

. ${shunit2_file}
