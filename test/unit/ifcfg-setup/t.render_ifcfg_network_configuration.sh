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
  local body="BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_network_configuration)"
}

function test_render_ifcfg_network_configuration_opts() {
  local body="BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${ifname})"
}

function test_render_ifcfg_network_configuration_opts_address() {
  local address=fe:ff:ff:ff:ff:ff
  local body="BOOTPROTO=none
ONBOOT=yes
MACADDR=${address}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${ifname} address=${address})"
}

function test_render_ifcfg_network_configuration_opts_ip() {
  local ip=192.0.2.10
  local body="BOOTPROTO=static
ONBOOT=yes
IPADDR=${ip}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${ifname} ip=${ip})"
}

function test_render_ifcfg_network_configuration_opts_mask() {
  local ip=192.0.2.10
  local mask=255.255.255.0
  local body="BOOTPROTO=static
ONBOOT=yes
IPADDR=${ip}
NETMASK=${mask}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${ifname} ip=${ip} mask=${mask})"
}

function test_render_ifcfg_network_configuration_opts_net() {
  local ip=192.0.2.10
  local net=192.0.2.0
  local body="BOOTPROTO=static
ONBOOT=yes
IPADDR=${ip}
NETWORK=${net}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${ifname} ip=${ip} net=${net})"
}

function test_render_ifcfg_network_configuration_opts_bcast() {
  local ip=192.0.2.10
  local bcast=192.0.2.255
  local body="BOOTPROTO=static
ONBOOT=yes
IPADDR=${ip}
BROADCAST=${bcast}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${ifname} ip=${ip} bcast=${bcast})"
}

function test_render_ifcfg_network_configuration_opts_gw() {
  local ip=192.0.2.10
  local gw=192.0.2.1
  local body="BOOTPROTO=static
ONBOOT=yes
IPADDR=${ip}
GATEWAY=${gw}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${ifname} ip=${ip} gw=${gw})"
}

## shunit2

. ${shunit2_file}
