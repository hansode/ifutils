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
