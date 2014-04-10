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
  function show_device() { echo show_device "${@}"; }
}

function tearDown() {
  :
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
