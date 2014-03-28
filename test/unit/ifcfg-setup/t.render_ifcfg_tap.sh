#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare device=tap0

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
  local body="DEVICE=${device}
TYPE=Tap
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_tap ${device})"
}

function test_render_ifcfg_tap_opts_mac() {
  local body="DEVICE=${device}
TYPE=Tap
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_tap ${device} mac=${mac})"
}

## shunit2

. ${shunit2_file}
