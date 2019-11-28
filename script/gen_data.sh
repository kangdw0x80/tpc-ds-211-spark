#!/bin/bash

# SCALE_FACTOR
SCALE_FACTOR=1
TARGET_DIR="../gen_data_${SCALE_FACTOR}"
DATA_GEN_BIN="../tools/dsdgen"

mkdir $TARGET_DIR
cp ../tools/tpcds.idx ./
${DATA_GEN_BIN} -scale $SCALE_FACTOR -dir ${TARGET_DIR}
rm tpcds.idx
