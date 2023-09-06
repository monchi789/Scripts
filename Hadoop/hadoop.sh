#!/bin/bash
apt update

# Install java, curl and wget
apt install openjdk-17-jdk wget curl ssh -y

# Check the java vers
java -version

# Export java 
echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/' >> .bashrc

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/ echo $JAVA_HOME

# Create user Hadoop 
adduser hadoop

# Download Hadoop
wget https://archive.apache.org/dist/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz

# Desconpress and change name
tar xf hadoop-3.1.2.tar.gz
mv hadoop-3.1.2 hadoop

# Move files to hadoop user
cp -r hadoop /home/hadoop/

# Export Hadoop variables
echo 'export HADOOP_HOME=/home/hadoop/hadoop' >> .bashrc
echo 'export HADOOP_INSTALL=$HADOOP_HOME' >> .bashrc
echo 'export HADOOP_MAPRED_HOME=$HADOOP_HOME' >> .bashrc
echo 'export HADOOP_COMMON_HOME=$HADOOP_HOME' >> .bashrc
echo 'export HADDOP_HDFS_HOME=$HADDOP_HOME' >> .bashrc
echo 'export YARN_HOME=$HADOOP_HOME' >> .bashrc
echo 'export HADOOP_COMMON_LIB_NATIVE=$HADOOP_HOME/lib/native' >> .bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin' >> .bashrc

# Reload the configuration
source .bashrc