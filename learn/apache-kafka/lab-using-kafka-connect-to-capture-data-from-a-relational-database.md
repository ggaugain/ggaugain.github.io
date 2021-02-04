[Back](/learn/apache-kafka/README.md)

# Lab: Using Kafka Connect to Capture Data from a Relational Database

**Objectives**

Kafka Connect can be used for a variety of databases, given it has a multitude of built-in connectors. In this hands-on lab, we set up Kafka Connect in a way allowing us to continuously stream data from a SQLite database directly into Kafka. This lab demonstrates how easy it is to use.<br />
Kafka Connect to get data into Kafka for further analysis.

-----------------
**Table of contents**
1. [Start the Docker Container and Open a New Shell Inside](#start-the-docker-container-and-open-a-new-shell-inside)
2. [Start Kafka](#start-kafka)
3. [Install SQLite3 and Create a New Database Table](#install-sqlite3-and-create-a-new-database-table)
4. [Start Kafka Connect in Standalone Mode](#start-kafka-connect-in-standalone-mode)
5. [Verify the Connectors and Topic Have Been Created](#verify-the-connectors-and-topic-have-been-created)
6. [Start a Kafka Consumer and Write New Data to the Database](#start-a-kafka-consumer-and-write-new-data-to-the-database)

## Start the Docker Container and Open a New Shell Inside
Run the following command to start the container and connect to it.

```
docker run -ti --rm --name sqlite-demo --network host confluentinc/docker-demo-base:3.3.0
```

## Start Kafka
Start Kafka with the following command.

```
cd /tmp
confluent start
```

## Install SQLite3 and Create a New Database Table
Install SQLite3 with the following command.

```
apt-get install sqlite3
```

Create a new database and table with the following command.

```
sqlite3 test.db
 
CREATE TABLE accounts (
id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
name VARCHAR(255));
```

Insert the sample datas into your database table using the following command.

```
INSERT INTO accounts(name) VALUES('chad');
INSERT INTO accounts(name) VALUES('terry');
.quit
```

## Start Kafka Connect in Standalone Mode
Use the following command to stop Kafka Connect from running in distributed mode.

```
confluent stop connect
```

Use the following commnand to start Kafka Connect in standalone mode.

```
connect-standalone -daemon /etc/schema-registry/connect-avro-standalone.properties /etc/kafka-connect-jdbc/source-quickstart-sqlite.properties
```

## Verify the Connectors and Topic Have Been Created
Check the logs to see that the connector is finished creating.

```
cat /logs/connectStandalone.out | grep -i "finished"

```

List the connectors.

```
curl -s localhost:8083/connectors

```

Describe the topic created by the connector.

```
kafka-topics --list --zookeeper localhost:2181 | grep test-sqlite-jdbc

```

## Start a Kafka Consumer and Write New Data to the Database
Start a new Console Consumer:

```
kafka-avro-console-consumer --new-consumer --bootstrap-server localhost:9092 --topic test-sqlite-jdbc-accounts --from-beginning
```

In a new terminal, write some new values to the database table.

```
sudo docker exec -it sqlite-demo //bin//bash

cd /tmp
sqlite3 test.db
INSERT INTO accounts(name) VALUES('william');
.quit
```

[Back](/learn/apache-kafka/README.md)