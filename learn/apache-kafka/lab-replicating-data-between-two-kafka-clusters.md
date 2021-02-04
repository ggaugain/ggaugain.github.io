[Back](/learn/apache-kafka/README.md)

# Lab: Replicating Data Between Two Kafka Clusters

**Objectives:**

In this hands-on lab, we need to create two localized Kafka clusters. These clusters will contain only one zookeeper and kafka instance each. We differentiate between the two by specifying different port numbers and data directories for each cluster. Once both clusters are up and running, we create a topic and replicate that topic to the secondary cluster. We continue to produce messages to the source cluster and ensure that the messages are successfully mirrored.

Use the confluent Kafka binaries for each task located here: https://packages.confluent.io/archive/5.2/confluent-5.2.1-2.12.tar.gz _(or latest version)_

Use the following requirements to set up your cluster and create your topic:
* Your destination cluster must be reachable from Kafka port 9092 and Zookeeper port 2181.
* Your source cluster must be reachable from Kafka port 9082 and Zookeeper port 2171.
* Your Zookeeper configuration file must be named zookeeper_origin.properties and specify the data directory /tmp/zookeeper_origin.
* Your Kafka configuration file must be named server_origin.properties and specify the data directory /tmp/kafka-logs-origin.
* Create a topic named test-topic on the source cluster with 1 partition and a replication factor of 1.
* Run the replicator tool with Kafka Connect (Standalone Mode) using the quickstart-replicator.properties configuration file.
* Verify the topic was replicated to the destination cluster.
* Open a console producer and produce some messages to the topic test-topic.
* Verify the messages were replicated to the destination cluster by running a console consumer.

<img src="/learn/apache-kafka/data/lab-replicating-data-between-two-kafka-clusters.png" width="50%" />

-----------------
**Table of contents**
1. [Start the Destination Cluster](#start-the-destination-cluster)
2. [Start the Origin Cluster](#start-the-origin-cluster)
3. [Create a Topic in the Source Cluster](#create-a-topic-in-the-source-cluster)
4. [Run the Replicator Tool](#run-the-replicator-tool)
5. [Produce and Verify Replication](#produce-and-verify-replication)

## Start the Destination Cluster
Start Zookeeper.
```
bin/zookeeper-server-start etc/kafka/zookeeper.properties
```

Start Kafka.
```
bin/kafka-server-start etc/kafka/server.properties
```

## Start the Origin Cluster
Make a copy of the configuration files.
```
cp etc/kafka/zookeeper.properties /tmp/zookeeper_origin.properties
cp etc/kafka/server.properties /tmp/server_origin.properties
```

Change the port numbers for the origin cluster.
```
sed -i '' -e "s/2181/2171/g" /tmp/zookeeper_origin.properties
sed -i '' -e "s/9092/9082/g" /tmp/server_origin.properties
sed -i '' -e "s/2181/2171/g" /tmp/server_origin.properties
sed -i '' -e "s/#listen/listen/g" /tmp/server_origin.properties
```

Change the data directory for the origin cluster.
```
sed -i '' -e "s/zookeeper/zookeeper_origin/g" /tmp/zookeeper_origin.properties
sed -i '' -e "s/kafka-logs/kafka-logs-origin/g" /tmp/server_origin.properties
```

Start Zookeeper.
```
bin/zookeeper-server-start /tmp/zookeeper_origin.properties
```

Start Kafka.
```
bin/kafka-server-start /tmp/server_origin.properties
```

## Create a Topic in the Source Cluster
Create a topic named _test-topic_ with 1 partition and a replication factor of 1.
```
bin/kafka-topics --create --topic test-topic --replication-factor 1 --partitions 1 --zookeeper localhost:2171
```

## Run the Replicator Tool
Run Kafka Connect in Standalone Mode and pass in the _quickstart-replicator.properties_ file
```
bin/connect-standalone etc/kafka/connect-standalone.properties etc/kafka-connect-replicator/quickstart-replicator.properties
```

## Produce and Verify Replication
Verify that the topic was replicated to the destination cluster.
```
bin/kafka-topics --describe --topic test-topic.replica --zookeeper localhost:2181
```

Open a Console Producer and write to the topic test-topic in the source cluster.
```
seq 10000 | bin/kafka-console-producer --topic test-topic --broker-list localhost:9082
```

Confirm the messages were replicated by opening a console consumer to the destination cluster.
```
bin/kafka-console-consumer --from-beginning --topic test-topic.replica --bootstrap-server localhost:9092
```

[Back](/learn/apache-kafka/README.md)