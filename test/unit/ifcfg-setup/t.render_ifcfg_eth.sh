#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare ifname=eth0

## functions

function setUp() {
  :
}

function tearDown() {
  :
}

function test_render_ifcfg_eth_no_opts() {
  local body="DEVICE=eth0
TYPE=Ethernet
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_eth)"
}

function test_render_ifcfg_eth_opts() {
  local body="DEVICE=${ifname}
TYPE=Ethernet
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_eth ${ifname})"
}

function test_render_ifcfg_eth_opts_ip() {
  local ip=192.0.2.10
  local body="DEVICE=${ifname}
TYPE=Ethernet
BOOTPROTO=none
IPADDR=${ip}
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_eth ${ifname})"
}

function test_render_ifcfg_eth_opts_mask() {
  local mask=255.255.255.0
  local body="DEVICE=${ifname}
TYPE=Ethernet
BOOTPROTO=none
NETMASK=${mask}
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_eth ${ifname})"
}

function test_render_ifcfg_eth_opts_net() {
  local net=192.0.2.0
  local body="DEVICE=${ifname}
TYPE=Ethernet
BOOTPROTO=none
NETWORK=${net}
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_eth ${ifname})"
}

function test_render_ifcfg_eth_opts_bcast() {
  local bcast=192.0.2.255
  local body="DEVICE=${ifname}
TYPE=Ethernet
BOOTPROTO=none
BROADCAST=${bcast}
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_eth ${ifname})"
}

function test_render_ifcfg_eth_opts_gw() {
  local gw=192.0.2.1
  local body="DEVICE=${ifname}
TYPE=Ethernet
BOOTPROTO=none
GATEWAY=${gw}
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_eth ${ifname})"
}

## shunit2

. ${shunit2_file}
