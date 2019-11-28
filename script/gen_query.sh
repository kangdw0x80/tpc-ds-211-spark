#!/bin/bash

SCALE_FACTOR="1000"
TARGET_DIR="../gen_query_${SCALE_FACTOR}"
QUERY_GEN_BIN="../tools/dsqgen"


mkdir $TARGET_DIR
cp ../tools/tpcds.idx ./

for i in {1..99}
do
	echo $i
	echo "${QUERY_GEN_BIN} -VERBOSE Y -DIALECT ansi -DIRECTORY ../query_templates/ -SCALE ${SCALE_FACTOR} -OUTPUT_DIR ${TARGET_DIR} -TEMPLATE query${i}.tpl"
	${QUERY_GEN_BIN} -VERBOSE Y -DIALECT ansi -DIRECTORY ../query_templates/ -SCALE ${SCALE_FACTOR} -OUTPUT_DIR ${TARGET_DIR} -TEMPLATE query${i}.tpl
	if [ $i -ge 10 ]
	then
		mv ${TARGET_DIR}/query_0.sql ${TARGET_DIR}/query${i}.sql
	else
		mv ${TARGET_DIR}/query_0.sql ${TARGET_DIR}/query0${i}.sql
	fi
done
rm tpcds.idx
