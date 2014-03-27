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
  TMPDIR=/tmp/${$}
  mkdir ${TMPDIR}

  IFCFG_PATH_PREFIX=${TMPDIR}/ifcfg.${$}
  IFCFG_BONDING_CONF_PATH=${TMPDIR}/bonding.conf.${$}
  IFCFG_VLAN_CONF_PATH=${TMPDIR}/network.${$}
}

function tearDown() {
  for i in ${TMPDIR}/*; do
    echo === ${i} ===
    cat ${i}
  done

  rm -f ${IFCFG_PATH_PREFIX}
  rm -f ${IFCFG_BONDING_CONF_PATH}
  rm -f ${IFCFG_VLAN_CONF_PATH}
  rm -r ${TMPDIR}
}

function test_cli() {
  brname=brtap
  ethname=eth1

  ifcfg_cli install tap ${ethname} mac=fe:ff:ff:ff:ff:ff
  assertEquals 0 ${?}

  ifcfg_cli install bridge ${brname}  mac=
  assertEquals 0 ${?}

  ifcfg_cli install bridge ${brname}  slave=${ethname}
  assertEquals 0 ${?}
}

## shunit2

. ${shunit2_file}
