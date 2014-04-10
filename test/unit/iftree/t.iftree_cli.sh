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
  local device=eth0
  mkdir -p ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}/${device}

  function show_device() { echo show_device "${@}"; }
}

function tearDown() {
  if [[ -d ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX} ]]; then
    rm -r  ${IFTREE_SYSFS_CLASS_NET_PATH_PREFIX}
  fi
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

function test_iftree_cli_sysfs_not_found() {
  IFTREE_SYSFS_CLASS_NET_PATH_PREFIX=

  iftree_cli
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
