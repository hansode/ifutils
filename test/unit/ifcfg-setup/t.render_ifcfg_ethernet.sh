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

function test_render_ifcfg_ethernet_no_opts() {
  local body="DEVICE=eth0
TYPE=Ethernet
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_ethernet)"
}

function test_render_ifcfg_ethernet_opts() {
  local body="DEVICE=${device}
TYPE=Ethernet
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_ethernet ${device})"
}

function test_render_ifcfg_ethernet_opts_hw() {
  local hw=fe:ff:ff:ff:ff:ff
  local body="DEVICE=${device}
TYPE=Ethernet
BOOTPROTO=none
ONBOOT=yes
HWADDR=${hw}"
  assertEquals "${body}" "$(render_ifcfg_ethernet ${device} hw=${hw})"
}

## shunit2

. ${shunit2_file}
