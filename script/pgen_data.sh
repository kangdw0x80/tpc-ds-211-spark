#!/bin/bash

SCALE_FACTOR=1000
TARGET_DIR="./testgen_data_${SCALE_FACTOR}"
DATA_GEN_BIN="../tools/dsdgen"

PARALLEL_LEVEL="1000"

declare -a pids

function usage()
{
   echo "$0 start_idx end_idx"
}

if [ $# -ne 2 ]
then
   usage $@
   exit
fi

mkdir $TARGET_DIR

cp ../tools/tpcds.idx ./

for ((i=$1;i<=$2;i++))
do
   ${DATA_GEN_BIN} -scale $SCALE_FACTOR -dir ${TARGET_DIR} -PARALLEL ${PARALLEL_LEVEL}  -child $i &
   echo "${DATA_GEN_BIN} -scale $SCALE_FACTOR -dir ${TARGET_DIR} -PARALLEL ${PARALLEL_LEVEL}  -child $i &"
   pids+=($!)
done

echo Waiting...
for pid in ${pids[*]}
do
   wait $pid
done
rm tpcds.idx
