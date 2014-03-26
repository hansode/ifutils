#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare ifname=eth0
IFCFG_PATH_PREFIX=ifcfg-eth9

## functions

function setUp() {
  function install_ifcfg_file() { echo ${@}; }
}

function tearDown() {
  :
}

function test_install_ifcfg_ethernet_no_opts() {
  install_ifcfg_ethernet
  assertEquals 0 ${?}
}

function test_install_ifcfg_ethernet_opts() {
  install_ifcfg_ethernet ${ifname}
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
