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
    echo ${index} > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/address
    index=$((${index} + 1))
  done

  device=br0
  mkdir ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/bridge
  mkdir ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/brif

  device=bond0
  mkdir ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/bonding
  touch ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/bonding/slaves

  device=tap0
  touch ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/tun_flags

  device=vlan0
  echo 1 > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/iflink

  device=lo
  echo 772 > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/type
}

function tearDown() {
  if [[ -d ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX} ]]; then
    rm -r  ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}
  fi
}

function test_show_device_no_opts() {
  local device=

  show_device ${device}
  assertNotEquals 0 ${?}
}

function test_show_device_ethernet() {
  local device=eth0

  show_device ${device}
  assertEquals 0 ${?}
}

function test_show_device_bridge() {
  local device=br0

  show_device ${device}
  assertEquals 0 ${?}
}

function test_show_device_bonding() {
  local device=bond0

  show_device ${device}
  assertEquals 0 ${?}
}

function test_show_device_tap() {
  local device=tap0

  show_device ${device}
  assertEquals 0 ${?}
}

function test_show_device_vlan() {
  local device=vlan0

  show_device ${device}
  assertEquals 0 ${?}
}

function test_show_device_lo() {
  local device=lo

  show_device ${device}
  assertEquals 0 ${?}
}

function test_show_device_not_exists() {
  local device=unknown

  show_device ${device}
  assertNotEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
