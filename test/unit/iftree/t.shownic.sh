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
  mkdir ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${nic}/brif

  nic=bond0
  mkdir ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${nic}/bonding
  touch ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${nic}/bonding/slaves

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

function test_shownic_no_opts() {
  local nic=

  shownic ${nic}
  assertNotEquals 0 ${?}
}

function test_shownic_ethernet() {
  local nic=eth0

  shownic ${nic}
  assertEquals 0 ${?}
}

function test_shownic_bridge() {
  local nic=br0

  shownic ${nic}
  assertEquals 0 ${?}
}

function test_shownic_bonding() {
  local nic=bond0

  shownic ${nic}
  assertEquals 0 ${?}
}

function test_shownic_tap() {
  local nic=tap0

  shownic ${nic}
  assertEquals 0 ${?}
}

function test_shownic_vlan() {
  local nic=vlan0

  shownic ${nic}
  assertEquals 0 ${?}
}

function test_shownic_lo() {
  local nic=lo

  shownic ${nic}
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
