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

  for device in eth0 br0 bond0 tap0 vlan0 vlan1 vlan2 lo; do
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
  echo 0 > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/iflink

  device=vlan1
  echo 0 > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/iflink

  device=vlan2
  echo 0 > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/iflink

  device=lo
  echo 772 > ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}/type

  function show_vlan_map() {
    cat <<-EOS
	device=vlan0 vlan_id=0 physdev=eth0
	device=vlan1 vlan_id=1 physdev=eth0
	device=vlan2 vlan_id=2 physdev=eth0
	EOS
  }
}

function tearDown() {
  rm -r ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}
}

function test_iftree_cli_no_opts() {
  local device=

  iftree_cli
  assertEquals 0 ${?}
}

function test_iftree_cli_opts() {
  local device=eth0

  iftree_cli "${device}"
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
