#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare device=bond0

## functions

function setUp() {
  :
}

function tearDown() {
  :
}

function test_render_ifcfg_bonding_master_no_opts() {
  local body="DEVICE=bond0
BOOTPROTO=none
ONBOOT=yes
BONDING_OPTS=\"mode=1\""
  assertEquals "${body}" "$(render_ifcfg_bonding_master)"
}

function test_render_ifcfg_bonding_master_opts() {
  local body="DEVICE=${device}
BOOTPROTO=none
ONBOOT=yes
BONDING_OPTS=\"mode=1\""
  assertEquals "${body}" "$(render_ifcfg_bonding_master ${device})"
}

function test_render_ifcfg_bonding_master_opts_mode() {
  local mode=2
  local body="DEVICE=${device}
BOOTPROTO=none
ONBOOT=yes
BONDING_OPTS=\"mode=${mode}\""
  assertEquals "${body}" "$(render_ifcfg_bonding_master ${device} mode=${mode})"
}

## shunit2

. ${shunit2_file}
