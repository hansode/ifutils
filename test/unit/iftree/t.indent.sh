#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

## functions

function setUp() {
  :
}

function tearDown() {
  :
}

function test_indent() {
  assertEquals "  " "$(echo | indent)"
}

## shunit2

. ${shunit2_file}
