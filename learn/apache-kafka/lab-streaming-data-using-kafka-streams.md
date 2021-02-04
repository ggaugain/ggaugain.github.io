[Back](/learn/apache-kafka/README.md)

# Lab: Streaming Data Using Kafka Streams to Count Words

**Objectives**

In this hands-on lab, we use the WordCount demo application that comes with the Kafka binaries. This application is already built, so we won't create the application from scratch. We need to create an input topic, an output topic, and then use the WordCount Streaming Application to count the number of words in the input stream using the Kafka console consumer. We do this by passing in the apprpriate properties to the console consumer to format, serialize, and deserialize the data into the correct output for viewing in the console. When we have an output of the count of each word in the console, we've successfully completed this lab.

<img src="/learn/apache-kafka/data/lab-streaming-data-using-kafka-streams.png" width="30%" />

-----------------
**Table of contents**
1. [Lab requirement](#lab-requirement)
2. [Create the Input and Output Topic](#create-the-input-and-output-topic)
3. [Open a Kafka Console Producer](#open-a-kafka-console-producer)
4. [Open a Kafka Console Consumer](#open-a-kafka-console-consumer)
5. [Run the Kafka Streams Application](#run-the-kafka-streams-application)

## Lab requirement
We need to create the Kafka cluster in order to proceed with creating our first topic.

Here are the instructions for starting the Kafka cluster:

1. Use Docker Compose to build the Kafka Cluster.

```
cd content-kafka-deep-dive

docker-compose up -d --build
```

2. Install Java.

```
sudo apt install default-jdk
```

3. Unzip the Kafka binaries tar file located in /home/cloud_user

```
tar -xvf kafka_2.12-2.2.0.tgz
```

4. Change the name of the 'kakfa_2.12-2.2.0' to 'kafka'

```
mv kafka_2.12-2.2.0 kafka
```

Perform all commands in this hands-on lab from within the **~/kafka** directory:

Follow these requirements in order to complete this Hands-on lab:
* Create a topic named _streams-plaintext-input_.
* Create a topic named _streams-wordcount-output_.
* Open the Kafka console producer and write the following messages:
    * kafka streams is great
    * kafka processes messages in real time
    * kafka helps real information streams
* Open a Kafka console consumer to the output topic to read messages from the beginning using the default message formatter with the following properties:
    * print.key=true
    * print.value=true
    * key.deserializer=org.apache.kafka.common.serialization.StringDeserializer
    * value.deserializer=org.apache.kafka.common.serialization.LongDeserializer
* Run the org.apache.kafka.streams.examples.wordcount.WordCountDemo application using the kafka-run-class.sh command.

## Create the Input and Output Topic
Create the input topic named _streams-plaintext-input_.

```
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic streams-plaintext-input
```

Create the output topic named _streams-wordcount-output_.

```
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic streams-wordcount-output
```

## Open a Kafka Console Producer
Open a Kafka console producer.

```
bin/kafka-console-producer.sh --broker-list localhost:9092 --topic streams-plaintext-input
```

Type the three messages from the instructions.

```
>kafka streams is great
>kafka processes messages in real time
>kafka helps real information streams
```

## Open a Kafka Console Consumer 
Open a Kafka console consumer using the default message formatter and the three properties given in the instructions.

```
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 \
--topic streams-wordcount-output \
--from-beginning \
--formatter kafka.tools.DefaultMessageFormatter \
--property print.key=true \
--property print.value=true \
--property key.deserializer=org.apache.kafka.common.serialization.StringDeserializer \
--property value.deserializer=org.apache.kafka.common.serialization.LongDeserializer
```

## Run the Kafka Streams Application
Use the _kafka-run-class.sh_ command to run the _WordCountDemo_ application in a new SSH console

```
bin/kafka-run-class.sh org.apache.kafka.streams.examples.wordcount.WordCountDemo
```

[Back](/learn/apache-kafka/README.md)