#!/bin/bash
#
# requires:
#   bash
#

## include files

. $(cd ${BASH_SOURCE[0]%/*} && pwd)/helper_shunit2.sh

## variables

IFTREE_PROCFS_NET_VLAN_CONFIG_PATH=./config.${$}

## functions

function setUp() {
  cat <<-EOS > ${IFTREE_PROCFS_NET_VLAN_CONFIG_PATH}
	VLAN Dev name    | VLAN ID
	Name-Type: VLAN_NAME_TYPE_RAW_PLUS_VID_NO_PAD
	vlan112        | 112  | p1p1
	vlan122        | 122  | p1p1
	vlan2901       | 2901  | em1
	vlan2902       | 2902  | em1
	vlan2903       | 2903  | em1
	vlan2904       | 2904  | em1
	vlan2905       | 2905  | em1
	vlan2906       | 2906  | em1
	vlan2907       | 2907  | em1
	vlan2908       | 2908  | p1p1
	vlan3006       | 3006  | em1
	EOS
}

function tearDown() {
  if [[ -f "${IFTREE_PROCFS_NET_VLAN_CONFIG_PATH}" ]]; then
    rm ${IFTREE_PROCFS_NET_VLAN_CONFIG_PATH}
  fi
}

function test_vlan_seq_show_file_exists() {
  vlan_seq_show
  assertEquals 0 ${?}
}

function test_vlan_seq_show_file_not_found() {
  rm -f ${IFTREE_PROCFS_NET_VLAN_CONFIG_PATH}

  vlan_seq_show
  assertEquals 0 ${?}
}

function test_vlan_seq_show_file_non_root() {
  chmod -r ${IFTREE_PROCFS_NET_VLAN_CONFIG_PATH}

  vlan_seq_show
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
