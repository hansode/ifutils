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

function test_render_ifcfg_ethernet_no_opts() {
  local body="DEVICE=eth0
TYPE=Ethernet
BOOTPROTO=static
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_ethernet)"
}

function test_render_ifcfg_ethernet_opts() {
  local body="DEVICE=${ifname}
TYPE=Ethernet
BOOTPROTO=static
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_ethernet ${ifname})"
}

function test_render_ifcfg_ethernet_opts_ip() {
  local ip=192.0.2.10
  local body="DEVICE=${ifname}
TYPE=Ethernet
BOOTPROTO=static
IPADDR=${ip}
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_ethernet ${ifname})"
}

function test_render_ifcfg_ethernet_opts_mask() {
  local mask=255.255.255.0
  local body="DEVICE=${ifname}
TYPE=Ethernet
BOOTPROTO=static
NETMASK=${mask}
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_ethernet ${ifname})"
}

function test_render_ifcfg_ethernet_opts_net() {
  local net=192.0.2.0
  local body="DEVICE=${ifname}
TYPE=Ethernet
BOOTPROTO=static
NETWORK=${net}
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_ethernet ${ifname})"
}

function test_render_ifcfg_ethernet_opts_bcast() {
  local bcast=192.0.2.255
  local body="DEVICE=${ifname}
TYPE=Ethernet
BOOTPROTO=static
BROADCAST=${bcast}
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_ethernet ${ifname})"
}

function test_render_ifcfg_ethernet_opts_gw() {
  local gw=192.0.2.1
  local body="DEVICE=${ifname}
TYPE=Ethernet
BOOTPROTO=static
GATEWAY=${gw}
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_ethernet ${ifname})"
}

## shunit2

. ${shunit2_file}
