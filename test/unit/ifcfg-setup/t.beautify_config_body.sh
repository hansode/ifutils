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

function test_beautify_config_body_redirect() {
  assertEquals "$(beautify_config_body </dev/null)" ""
}

function test_beautify_config_body_pipe() {
  assertEquals "$(echo | beautify_config_body)" ""
}

## shunit2

. ${shunit2_file}
