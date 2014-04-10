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
  local device index=0

  for device in eth0 br0 bond0 tap0 vlan0 lo; do
    mkdir -p ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}
    echo ${index} > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/ifindex
    echo ${index} > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/iflink
    echo ${index} > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/type
    index=$((${index} + 1))
  done

  device=br0
  mkdir ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/bridge

  device=bond0
  mkdir ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/bonding

  device=tap0
  touch ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/tun_flags

  device=vlan0
  echo 1 > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/iflink

  device=lo
  echo 772 > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/type
}

function tearDown() {
  rm -r ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}
}

function test_device_type_no_opts() {
  local device=

  device_type ${device}
  assertNotEquals 0 ${?}
}

function test_device_type_ethernet() {
  local device=eth0

  assertEquals ethernet "$(device_type ${device})"
}

function test_device_type_bridge() {
  local device=br0

  assertEquals bridge "$(device_type ${device})"
}

function test_device_type_bonding() {
  local device=bond0

  assertEquals bonding "$(device_type ${device})"
}

function test_device_type_tap() {
  local device=tap0

  assertEquals tap "$(device_type ${device})"
}

function test_device_type_vlan() {
  local device=vlan0

  assertEquals vlan "$(device_type ${device})"
}

function test_device_type_lo() {
  local device=lo

  assertEquals lo "$(device_type ${device})"
}

## shunit2

. ${shunit2_file}
