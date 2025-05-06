#!/bin/bash

# Format HDFS (only once)
hdfs namenode -format

# Start the NameNode daemon
start-dfs.sh

# Tail the logs to keep the container running
tail -f $HADOOP_HOME/logs/*
