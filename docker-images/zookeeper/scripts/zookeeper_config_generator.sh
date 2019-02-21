#!/usr/bin/env bash

# Write the config file
cat <<EOF
# the directory where the snapshot is stored.
dataDir=${ZOOKEEPER_DATA_DIR}
#clientPort=$(expr 10 \* 2181 + $ZOOKEEPER_ID - 1)
clientPort=21810

# Provided configuration
${ZOOKEEPER_CONFIGURATION}
# Zookeeper nodes configuration
EOF

NODE=1
#FOLLOWER_PORT=$(expr 10 \* 2888)
#ELECTION_PORT=$(expr 10 \* 3888)
while [ $NODE -le $ZOOKEEPER_NODE_COUNT ]; do
  echo "server.${NODE}=my-cluster-zookeeper-${NODE}.my-cluster-zookeeper:2888:3888"
  let NODE=NODE+1
done
