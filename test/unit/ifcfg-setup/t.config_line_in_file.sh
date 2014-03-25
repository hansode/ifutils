#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

declare config_path=adsf.$$

## functions

function setUp() {
  :
}

function tearDown() {
  rm ${config_path}
}

function test_config_line_in_file() {
  config_line_in_file ${config_path} asdf
  assertEquals 0 ${?}

  assertEquals asdf "$(cat ${config_path})"
}

## shunit2

. ${shunit2_file}
