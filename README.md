# tpc-ds-211-spark
TPC-DS Query Patch for Spark(TPC-DS v2.11.0rc2)


## query.patch
Patch this file to query_template directory
unzip "TPC-ds.zip"
cp query.patch v2.11.0rc2/
cd v2.11.0rc2
patch -p1 < query.patch


## gen_data.sh, gen_query.sh script
These scripts generate queies/data with scale factor
1. Write scale factor in each scripts
2. Run scripts

## pgen_data.sh
Generate partial data with start/end index
We use 2 variable, SCALE_FACTOR and PARALLEL_LEVEL
PARALLEL_LEVEL is # of processes.
example) Generate 1TB data for tpc-ds with 2 nodes(each node run 500 Proc)
- write "SCALE_FACTOR=1000"
- wrtie "PARALLEL_LEVEL=1000"
- Deploy script+tpc-ds to all nodes
- run script in all nodes.
  - bash pgen_data.sh 1 500(Node 01)
  - bash pgen_data.sh 501 1000(Node 02)


