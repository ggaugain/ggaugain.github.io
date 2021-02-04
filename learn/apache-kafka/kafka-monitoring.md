[Back](/learn/apache-kafka/README.md)

# Kafka Monitoring

This page resume what it is interesting to follow on a Kafka infrastructure.
* More information see. https://kafka.apache.org/documentation/#monitoring

-----------------
**Table of contents**
1. [Cluster and Broker Monitoring](#cluster-and-broker--monitoring)
2. [Broker Metrics](#broker-metrics)
3. [Java Monitoring](#java-monitoring)

## Cluster and Broker Monitoring
Metrics for the application can be obtained from the JMX. Kafka also uses Yammer Metrics for metrics reporting.

Get the JMX port:
```
bin/zookeeper-shell.sh zookeeper1:2181/kafka
 
get /brokers/ids/3
```

Preferred replica election:
```
bin/kafka-preferred-replica-election.sh --bootstrap-server kafka1:9092 --path-to-json-file topicPartitionList.json
```

Describe under-replicated partitions:
```
bin/kafka-topics.sh --zookeeper zookeeper1:2181/kafka --describe --under-replicated-partitions
```

Reassign partitions:
```
bin/kafka-reassign-partitions.sh --zookeeper zookeeper1:2181/kafka --execute \
--reassignment-json-file replicacount.json
```

Broker metrics for monitoring:
* https://kafka.apache.org/documentation/#monitoring

Tools from the SRE team at LinkedIn
* https://github.com/linkedin/kafka-tools

## Broker Metrics
The broker Metrics to Follow:
* ACTIVE CONTROLLER COUNT → is the broker the controller?
* REQUEST HANDLER IDLE RATIO → how much load is the broker under?
* ALL TOPICS BYTES IN → do I need to scale up the number of brokers?
* ALL TOPICS BYTES OUT → how high is consumer traffic?
* ALL TOPICS MESSAGES IN → how many messages per second?
* PARTITION COUNT → how many partitions are assigned to a broker?
* LEADER COUNT → how many partitions is this broker a leader for?
* OFFLINE PARTITIONS → how many brokers have no leader?
* REQUEST METRICS → how many requests are going to the broker?

## Java Monitoring
As producers and consumers will most likely be a Java-based application, it is important to monitor the JVM.

[Back](/learn/apache-kafka/README.md)