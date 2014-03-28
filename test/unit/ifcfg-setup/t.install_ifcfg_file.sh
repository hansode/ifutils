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
  function gen_file_path() { echo /dev/stdout; }
  function tee() { echo ${@}; }
}

function tearDown() {
  :
}

function test_install_ifcfg_file_no_opts() {
  assertEquals "/etc/sysconfig/network-scripts/ifcfg-${device}" "$(install_ifcfg_file </dev/null)"
}

function test_install_ifcfg_file_opts() {
  assertEquals "/etc/sysconfig/network-scripts/ifcfg-${device}" "$(install_ifcfg_file ${device} </dev/null)"
}

## shunit2

. ${shunit2_file}
