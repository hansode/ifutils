#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

IFTREE_SYSFS_CLASS_NET_PATH_PREFIX=./sys.${$}

## functions

function setUp() {
  local nic index=0

  for nic in eth0 br0 bond0 tap0 vlan0 lo; do
    mkdir -p ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${nic}
    echo ${index} > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${nic}/ifindex
    echo ${index} > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${nic}/iflink
    echo ${index} > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${nic}/type
    index=$((${index} + 1))
  done

  nic=br0
  mkdir ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${nic}/bridge

  nic=bond0
  mkdir ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${nic}/bonding

  nic=tap0
  touch ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${nic}/tun_flags

  nic=vlan0
  echo 1 > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${nic}/iflink

  nic=lo
  echo 772 > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${nic}/type
}

function tearDown() {
  rm -r ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}
}

function test_nic_type_no_opts() {
  local nic=

  nic_type ${nic}
  assertNotEquals 0 ${?}
}

function test_nic_type_ethernet() {
  local nic=eth0

  assertEquals ethernet "$(nic_type ${nic})"
}

function test_nic_type_bridge() {
  local nic=br0

  assertEquals bridge "$(nic_type ${nic})"
}

function test_nic_type_bonding() {
  local nic=bond0

  assertEquals bonding "$(nic_type ${nic})"
}

function test_nic_type_tap() {
  local nic=tap0

  assertEquals tap "$(nic_type ${nic})"
}

function test_nic_type_vlan() {
  local nic=vlan0

  assertEquals vlan "$(nic_type ${nic})"
}

function test_nic_type_lo() {
  local nic=lo

  assertEquals lo "$(nic_type ${nic})"
}

## shunit2

. ${shunit2_file}
