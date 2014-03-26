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

function test_render_ifcfg_network_configuration_no_opts() {
  local body="BOOTPROTO=static"
  assertEquals "${body}" "$(render_ifcfg_network_configuration)"
}

function test_render_ifcfg_network_configuration_opts() {
  local body="BOOTPROTO=static"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${ifname})"
}

function test_render_ifcfg_network_configuration_opts_ip() {
  local ip=192.0.2.10
  local body="BOOTPROTO=static
IPADDR=${ip}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${ifname} ip=${ip})"
}

function test_render_ifcfg_network_configuration_opts_mask() {
  local mask=255.255.255.0
  local body="BOOTPROTO=static
NETMASK=${mask}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${ifname} mask=${mask})"
}

function test_render_ifcfg_network_configuration_opts_net() {
  local net=192.0.2.0
  local body="BOOTPROTO=static
NETWORK=${net}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${ifname} net=${net})"
}

function test_render_ifcfg_network_configuration_opts_bcast() {
  local bcast=192.0.2.255
  local body="BOOTPROTO=static
BROADCAST=${bcast}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${ifname} bcast=${bcast})"
}

function test_render_ifcfg_network_configuration_opts_gw() {
  local gw=192.0.2.1
  local body="BOOTPROTO=static
GATEWAY=${gw}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${ifname} gw=${gw})"
}

## shunit2

. ${shunit2_file}
