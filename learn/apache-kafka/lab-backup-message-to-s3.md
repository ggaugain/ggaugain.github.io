[Back](/learn/apache-kafka/README.md)

# Back up Messages to an S3 Bucket in Kafka

**Objectives:**

In this hands-on lab, we will be sending topic messages to Amazon S3 using Kafka Connect. First, we'll create an S3 bucket, using some provided commands. Then we'll produce to a new topic, then use the connect plugin to verify that the data got copied to the newly created S3 bucket.

No previous Amazon Web Services knowledge is required. The purpose of this exercise is to learn how to use Kafka commands for sending data to an outside data repository. We will meet the following requirements:

<img src="/learn/apache-kafka/data/lab-backup-message-to-s3.png" width="30%" />

-----------------
**Table of contents**
1. [Connect and Start the Kafka Cluster](#connect-and-start-the-kafka-cluster)
2. [Create a New S3 Bucket](#create-a-new-s3-bucket)
3. [Start a Producer to a New Topic Named s3_topic and Write at Least 9 Messages](#start-a-producer-to-a-new-topic-named-s3_topic-and-write-at-least-9-messages)
4. [Start the Connector and Verify the Messages Are in the S3 Bucket](#start-the-connector-and-verify-the-messages-are-in-the-s3-bucket)

## Connect and Start the Kafka Cluster
Start kafka in a container and open a shell to that container:
```
docker run -ti --rm --name kafka-cluster --network host confluentinc/docker-demo-base:3.3.0
```

Get into the **/tmp** directory
```
cd /tmp
```

Now we can start up the Kafka cluster:
```
confluent start
```

## Create a New S3 Bucket
Install the awscli tool (once we've updated our system):
```
apt update
apt install -y awscli
```

Configure access to AWS by creating a key. Note that our cloud_user Access and Super Access keys are sitting back on the hands-on lab page:
```
aws configure

AWS Access Key ID: [ACCESS_KEY]
AWS Secret Access Key: [SECRET_ACCESS_KEY]
Default region name: us-east-1
Default output format: [None]
```

Create a new bucket in the us-east-1 region. Make sure our name is unique (all lowercase and NO underscores):
```
aws s3api create-bucket --region us-east-1 --bucket [UNIQUE_BUCKET_NAME]
```

Add the new bucket name to the configuration file for the S3 connector:
```
apt install -y vim
```

Then exit the properties file:
```
vim /etc/kafka-connect-s3/quickstart-s3.properties
```

Change the region and bucket.name lines to this:
```
s3.region=us-east-1
s3.bucket.name=[$globally_unique_bucket_name]
```

## Start a Producer to a New Topic Named s3_topic and Write at Least 9 Messages
Now let's open an Avro console producer to the topic, and include a schema:
```
kafka-avro-console-producer --broker-list localhost:9092 --topic s3_topic --property value.schema='{"type":"record","name":"myrecord","fields":[{"name":"f1","type":"string"}]}'
```

Type the 9 messages following the defined schema
```
{"f1": "value1"}
{"f1": "value2"}
{"f1": "value3"}
{"f1": "value4"}
{"f1": "value5"}
{"f1": "value6"}
{"f1": "value7"}
{"f1": "value8"}
{"f1": "value9"}
```

Press **Ctrl + C** to exit the session.

## Start the Connector and Verify the Messages Are in the S3 Bucket
We can start the connector and load the configuration:
```
confluent load s3-sink
```

We'll get some JSON output, with our bucket name in there somewhere. Copy that name, and use it in the command to list its objects:
```
aws s3api list-objects --bucket [OUR_BUCKET_NAME]
```

[Back](/learn/apache-kafka/README.md)