#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare device=eth0
declare ifcfg_path_prefix=/etc/sysconfig/network-scripts/ifcfg

## functions

function setUp() {
  :
}

function tearDown() {
  :
}

function test_gen_ifcfg_path_no_opts() {
  assertEquals ${ifcfg_path_prefix}-${device} "$(gen_ifcfg_path)"
}

function test_gen_ifcfg_path_opts() {
  assertEquals ${ifcfg_path_prefix}-${device} "$(gen_ifcfg_path ${device})"
}

function test_gen_ifcfg_path_opts_const() {
  IFCFG_PATH_PREFIX=/path/to/ifcfg
  assertEquals ${IFCFG_PATH_PREFIX}-${device} "$(gen_ifcfg_path ${device})"
}

## shunit2

. ${shunit2_file}
