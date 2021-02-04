[Back](/learn/apache-kafka/README.md)

# Command examples

**Detail for the topics command**
```
bin/kafka-topics.sh
```

**Creating a topic will all the required arguments**
```
bin/kafka-topics.sh --zookeeper zookeeper1:2181/kafka --topic test1 --create --partitions 3 --replication-factor 3
```

**Creating a topic including all of the zookeeper servers (not required)**
```
bin/kafka-topics.sh --zookeeper zookeeper1:2181,zookeeper2:2181,zookeeper3:2181/kafka --topic test1 --create --partitions 3 --replication-factor 3
```

**List all topics**
```
bin/kafka-topics.sh --zookeeper zookeeper1:2181/kafka --list
```

**Describing a topic**
```
bin/kafka-topics.sh --zookeeper zookeeper1:2181/kafka --topic test2 --describe
```

**Delete a topic**
```
bin/kafka-topics.sh --zookeeper zookeeper1:2181/kafka --topic test2 --delete
```

**Detail for the producer command**
```
bin/kafka-console-producer.sh
```

**Detail for the consumer command**
```
bin/kafka-console-consumer.sh
```

**Detail for the consumer groups command**
```
bin/kafka-consumer-groups.sh
```

**Start a console producer to topic _'test'_**
```
bin/kafka-console-producer.sh --broker-list kafka1:9092 --topic test
```

**Add the acks=all flag to your producer**
```
bin/kafka-console-producer.sh --broker-list kafka1:9092 --topic test --producer-property acks=all
```

**Create a topic with the console producer (not recommended)**
```
bin/kafka-console-producer.sh --broker-list kafka1:9092 --topic test4
```

**List the newly created topic**
```
bin/kafka-topics.sh --zookeeper zookeeper1:2181/kafka --list
```

**View the partitions for a topic**
```
bin/kafka-topics.sh --zookeeper zookeeper1:2181/kafka --topic test5 --describe
```

**Start a console consumer to a topic**
```
bin/kafka-console-consumer.sh --bootstrap-server kafka3:9092 --topic test
```

**Consuming messages from the beginning**
```
bin/kafka-console-consumer.sh --bootstrap-server kafka3:9092 --topic test --from-beginning
```

**Start a consumer group for a topic**
```
bin/kafka-console-consumer.sh --bootstrap-server kafka3:9092 --topic test --group application1
```

**Start producing new messages to a topic**
```
bin/kafka-console-producer.sh --broker-list kafka1:9092 --topic test
```

**Start a consumer group and read messages from the beginning**
```
bin/kafka-console-consumer.sh --bootstrap-server kafka3:9092 --topic test --group application1 --from-beginning
```

**List the consumer groups**
```
bin/kafka-consumer-groups.sh --bootstrap-server kafka3:9092 --list
```

**Describe a consumer group**
```
bin/kafka-consumer-groups.sh --bootstrap-server kafka3:9092 --describe --group application1
```

**Zookeeper shell commands**
```
bin/zookeeper-shell.sh zookeeper:2181/kafka

ls /
```

**Output the data from the partition log**
```
./bin/kafka-run-class.sh kafka.tools.DumpLogSegments --print-data-log --files /data/kafka/test5-6/00000000000000000000.log
```

**Rotate the logs**
```
./bin/kafka-configs.sh --zookeeper zookeeper1:2181/kafka --alter --entity-type topics --entity-name test --add-config segment.ms=60000
```

**Open a producer to send messages**
```
./bin/kafka-console-producer.sh --broker-list kafka1:9092 --topic test
```

**Remove the log rotation setting**
```
./bin/kafka-configs.sh --zookeeper zookeeper1:2181/kafka --alter --entity-type topics --entity-name test --delete-config segment.ms
```

**Create the json file to reassign partitions**
```
{"topics":
 [{"topic": "test"}],
 "version":1
}
```

**Run the command through a dry-run**
```
./bin/kafka-reassign-partitions.sh --zookeeper zookeeper1:2181/kafka --generate \
--topics-to-move-json-file topics.json \
--broker-list 3,2,1
```

**Execute the reassignment**
```
./bin/kafka-reassign-partitions.sh --zookeeper zookeeper1:2181/kafka --execute \
--reassignment-json-file plan.json 
```

**Verify the reassignment completed**
```
./bin/kafka-reassign-partitions.sh --zookeeper zookeeper1:2181/kafka --verify \
--reassignment-json-file plan.json
```

**Change the replication factor**
```
{"partitions":
 [{"topic": "test", "partition": 0,
 "replicas": [
 2,
 1
 ]
 }
 ],
 "version":1
}
```

**Execute the replication factor change**
```
./bin/kafka-reassign-partitions.sh --zookeeper zookeeper1:2181/kafka --execute \
--reassignment-json-file replicacount.json
```

**Describe the topic and see the change**
```
./bin/kafka-topics.sh --zookeeper zookeeper1:2181/kafka --topic test --describe
```

**Re-assign the leader replica**
```
./bin/kafka-preferred-replica-election.sh --zookeeper zookeeper1:2181/kafka 
```

[Back](/learn/apache-kafka/README.md)