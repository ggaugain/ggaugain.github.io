[Back](/learn/apache-kafka/README.md)

# Lab: Creating a Topic with Custom Configurations in Kafka

**Objectives:**

Broker failure is a common scenario in Kafka Cluster Administration, and it causes data loss. If there aren't enough in-sync replicas, messages may be lost forever. To ensure that this never happens, we've been tasked with enforcing a multiple-replica policy, and ensuring that creating topics without this policy will never be allowed by anyone else in the organization.

<img src="/learn/apache-kafka/data/creating-topic-with-custom-configurations.png" width="50%" />

-----------------
**Table of contents**
1. [Set Up the Cluster](#set-up-the-cluster)
2. [Create a Topic with Three Partitions and a Replication Factor of 3](#create-a-topic-with-three-partitions-and-a-replication-factor-of-3)
3. [Add a Custom Configuration to the Topic](#add-a-custom-configuration-to-the-topic)
4. [Change the Replica Count for the Topic](#change-the-replica-count-for-the-topic)
5. [Run a Producer to get an error message](#run-a-producer-to-get-an-error-message)

## Set Up the Cluster
Use Docker Compose to build the Kafka Cluster:
```
cd content-kafka-deep-dive

docker-compose up -d --build
```

Install Java:
```
sudo apt install default-jdk
```

Unzip and change into the Kafka binaries directory:
```
tar -xvf kafka_2.12-2.2.0.tgz && mv kafka_2.12-2.2.0/ kafka
```

## Create a Topic with Three Partitions and a Replication Factor of 3
Create a topic named **transaction**:
```
bin/kafka-topics.sh --zookeeper localhost:2181 \
--create \
--topic transaction \
--replication-factor 3 \
--partitions 3
```

## Add a Custom Configuration to the Topic
Add the custom configuration **min.insync.replicas=3** to the topic transaction:
```
bin/kafka-configs.sh --zookeeper localhost:2181 \
--alter \
--entity-type topics \
--entity-name transaction \
--add-config min.insync.replicas=3
```

Verify the topic configuration applied:
```
bin/kafka-configs.sh --zookeeper localhost:2181 \
--describe \
--entity-type topics \
--entity-name transaction
```

## Change the Replica Count for the Topic
First off, let's create a json file named **replicacount.json** with these contents:
```
{"partitions":
 [{"topic": "transaction", "partition": 0,
 "replicas": [
 2
 ]
 }
 ],
 "version":1
}
```

Now we can execute the replica count change but using that json file:
```
bin/kafka-reassign-partitions.sh --zookeeper localhost:2181 \
--execute \
--reassignment-json-file replicacount.json
```

Once we get a "Successfully started..." message, let's describe the topic to see the replica change:
```
bin/kafka-topics.sh --zookeeper localhost:2181 \
--topic transaction \
--describe
```

## Run a Producer to get an error message
Open a producer and send some messages to your topic
```
bin/kafka-console-producer.sh --broker-list localhost:9092 \
--topic transaction \
--producer-property acks=all
```

[Back](/learn/apache-kafka/README.md)