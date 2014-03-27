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

function test_ethernet_vlan_bridge() {
  bonding_mode=1

  function gen_priimary() {
    case "${1}" in
      [01]) echo 1 ;; [23]) echo 3 ;; [45]) echo 5 ;;
    esac
  }

  for i in {0..5}; do
    ifindex=$((${i} + 1))
    map_ifcfg_bond bond$((${i} / 2)) slave=eth${ifindex} mode=${bonding_mode} \
     primary=eth$(gen_priimary ${i}) miimon=100 updelay=10000
    assertEquals 0 ${?}
  done

  configure_vlan_conf

  for i in {0..2}; do
    vlan_if=vlan200${i}
    map_ifcfg_vlan ${vlan_if} physdev=bond${i}
    assertEquals 0 ${?}

    br_master_if=br${i}; br_slave_if=${vlan_if}
    map_ifcfg_bridge ${br_master_if} slave=${br_slave_if}
    assertEquals 0 ${?}
  done
}

## shunit2

. ${shunit2_file}
