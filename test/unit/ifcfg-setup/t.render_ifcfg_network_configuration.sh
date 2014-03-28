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

function test_render_ifcfg_network_configuration_no_opts() {
  local body="BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_network_configuration)"
}

function test_render_ifcfg_network_configuration_opts() {
  local body="BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${device})"
}

function test_render_ifcfg_network_configuration_opts_device() {
  local device=eth0
  local body="DEVICE=${device}
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${device} device=${device})"
}

function test_render_ifcfg_network_configuration_opts_type() {
  local type=Ethernet
  local body="TYPE=${type}
BOOTPROTO=none
ONBOOT=yes"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${device} type=${type})"
}

function test_render_ifcfg_network_configuration_opts_mac() {
  local mac=fe:ff:ff:ff:ff:ff
  local body="BOOTPROTO=none
ONBOOT=yes
MACADDR=${mac}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${device} mac=${mac})"
}

function test_render_ifcfg_network_configuration_opts_ip() {
  local ip=192.0.2.10
  local body="BOOTPROTO=static
ONBOOT=yes
IPADDR=${ip}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${device} ip=${ip})"
}

function test_render_ifcfg_network_configuration_opts_mask() {
  local ip=192.0.2.10
  local mask=255.255.255.0
  local body="BOOTPROTO=static
ONBOOT=yes
IPADDR=${ip}
NETMASK=${mask}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${device} ip=${ip} mask=${mask})"
}

function test_render_ifcfg_network_configuration_opts_net() {
  local ip=192.0.2.10
  local net=192.0.2.0
  local body="BOOTPROTO=static
ONBOOT=yes
IPADDR=${ip}
NETWORK=${net}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${device} ip=${ip} net=${net})"
}

function test_render_ifcfg_network_configuration_opts_bcast() {
  local ip=192.0.2.10
  local bcast=192.0.2.255
  local body="BOOTPROTO=static
ONBOOT=yes
IPADDR=${ip}
BROADCAST=${bcast}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${device} ip=${ip} bcast=${bcast})"
}

function test_render_ifcfg_network_configuration_opts_gw() {
  local ip=192.0.2.10
  local gw=192.0.2.1
  local body="BOOTPROTO=static
ONBOOT=yes
IPADDR=${ip}
GATEWAY=${gw}"
  assertEquals "${body}" "$(render_ifcfg_network_configuration ${device} ip=${ip} gw=${gw})"
}

## shunit2

. ${shunit2_file}
