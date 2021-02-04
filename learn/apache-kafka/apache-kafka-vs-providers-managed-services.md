[Back](/learn/apache-kafka/README.md)

# Apache Kafka VS Providers managed services

A little comparaison between Apache Kafka VS Providers managed services.

-----------------
**Table of contents**
1. [About Apache Kafka](#about-apache-kafka)
2. [About IBM Event Streams](#about-ibm-event-streams)
3. [About Amazon Kinesis](#about-amazon-kinesis)
4. [Key Differences between solutions](#key-differences-between-solutions)
5. [Conclusion](#conclusion)

## About Apache Kafka
Apache Kafka is an open-source distributed pub-sub messaging solution that was initially developed at LinkedIn. Apache Kafka consists of multiple nodes referred to as Brokers(Message Brokers). Brokers are responsible for accepting messages (leaders) and replicating the messages to the rest of the brokers in the cluster (followers). The distributed nature of Apache Kafka allows the system to scale out and provides high availability (HA) in case of node failure. The membership (leaders and followers) of Brokers in a cluster is tracked and administered via Apache Zookeeper, yet another open-source distributed membership framework.

Documentations: https://kafka.apache.org/documentation/

<img src="/learn/apache-kafka/data/about-apache-kafka_001.png" width="30%" />

## About IBM Event Streams
IBM Event Streams is a fully managed event-streaming platform based on the open-source Apache Kafka project, providing a high-throughput, fault-tolerant, publish–subscribe technology for building event-driven applications.

We support all of the Kafka APIs including Kafka Streams, Kafka Connect.

IBM Event Streams uses Strimzi to deploy Apache Kafka in a resilient and manageable way, and provides a range of additional capabilities to extend the core functionality.

Documentations: https://cloud.ibm.com/docs/EventStreams

<img src="/learn/apache-kafka/data/ibm-event-stream_001.png" width="30%" />

## About Amazon Kinesis
Amazon Kinesis, also a pub-sub messaging solution, is hosted by Amazon Web Services (AWS) and provides a similar set of capabilities as Apache Kafka. Amazon Kinesis is a fully managed service hosted within a given AWS region (i.e. us-east-1) and spans over multiple Availability Zones (i.e. us-east-1a). Similar to Apache Kafka, Amazon Kinesis is responsible for accepting end-user’s messages and replicating the messages to multiple-availability zones for high availability and durability. The fully managed aspect of Amazon Kinesis eliminates the need for users to maintain infrastructures or be concerned about the details surrounding features like replication or the other system configurations.

AWS provide an another solution with Amazon MSK is a fully managed service that makes it easy for you to build and run applications that use Apache Kafka to process streaming data. 

Documentations: https://docs.aws.amazon.com/kinesis/index.html

<img src="/learn/apache-kafka/data/amazon-kinesis_001.png" width="30%" />

## Key Differences between solutions

| Item | Apache Kafka | IBM Event Streams | Amazon Kinesis |
| ------ | ------ | ------ | ------ |
| **Developed/Hosted By** | LinkedIn | IBM Cloud | Amazon |
| **Software** | Open-Source | Based on Kafka | Proprietary |
| **SDK Support** | Kafka SDK supports Java | Kafka API, Admin REST API, REST Producer API | AWS SDK supports Android, Java, Go, .NET |
| **Configuration & Features** | More control on configuration and better performance. | Depends on the chosen plan (Lite, Standard or Enterprise). <br />See. [What's supported by the Lite, Standard, Enterprise plans](https://cloud.ibm.com/docs/EventStreams?topic=EventStreams-plan_choose) | Number of days/shards can only be configured. |
| **Data Stored In**| Kafka Partition | Kafka Partition | Kinesis Shard |
| **Reliability** | Replication factor can be configured | Event Streams leverages the availability zone support from the IBM Kubernetes Service to ensure that in the unlikely event of an entire zone being unavailable, your applications will continue to work uninterrupted. | Kinesis writes synchronously to 3 different machines/data-centers |
| **Performance** | Depend of architecture configuration | Depend of architecture configuration | Less efficient than kafka because Kinesis writes each message synchronously to 3 different machines |
| **Configuration Store** | Apache Zookeeper | Apache Zookeeper | Amazon DynamoDB |
| **Setup** | Weeks | Couple of hours | Couple of hours |
| **Data Retention** | Configurable | Depends on the chosen plan (Lite, Standard or Enterprise). <br /> - Standard Plan: 1 GB per partition <br /> - Enterprise Plan: 2 TB - 12 TB of scalable usable storage <br />See. [What's supported by the Lite, Standard, Enterprise plans](https://cloud.ibm.com/docs/EventStreams?topic=EventStreams-plan_choose) | 7 days at max |
| **Log Compaction** | Supported | Supported | Only can store logs for 7 days |
| **Processing Events** | More than 1000s of events/sec | Depends on the chosen plan (Lite, Standard or Enterprise). <br />See. [What's supported by the Lite, Standard, Enterprise plans](https://cloud.ibm.com/docs/EventStreams?topic=EventStreams-plan_choose) | Atmost 1000s of events/sec |
| **Checkpointing** | Offsets stored in special topic | Offsets stored in special topic | DynamoDB |
| **Ordering** | Partion level | Depends on the chosen plan (Lite, Standard or Enterprise). <br />See. [What's supported by the Lite, Standard, Enterprise plans](https://cloud.ibm.com/docs/EventStreams?topic=EventStreams-plan_choose) | Shard level |
| **Human Costs** | Require human support for installing and managing their clusters, and also accounting for requirements such as high availability, durability, and recovery. | IBM Event Streams is just about pay and use. <br /> But we need to include work on Kafka upgrades. | Kinesis is just about pay and use. |
| **Producer Throughput** | Depend of architecture configuration | Depends on the chosen plan (Lite, Standard or Enterprise). <br /> - Standard Plan: 1 MB per second per partition (20 MB per service instance) <br /> - Enterprise Plan: 150 MB/s - 450 MB/s of scalable throughput <br /> See. [What's supported by the Lite, Standard, Enterprise plans](https://cloud.ibm.com/docs/EventStreams?topic=EventStreams-plan_choose) | Kinesis is bit slower than Kafka |
| **Incident Risk/Maintainence** | No support except the community | IBM takes care | Amazon takes care |
| **Ordered sequence of immutable data records** | Kafka Topic | Kafka Topic | Kinesis Stream |
| **Each record has a unique number called** | Offset number | Offset number | Sequence number |
| **Concepts** | Kafka Streams | Kafka Streams (only supported in Standard Plan & Enterprise Plan) | Kinesis Analytics |
| **Compliance** | Depends on the hosting solution | Depends on the chosen plan (Lite, Standard or Enterprise). <br /> See. [What's supported by the Lite, Standard, Enterprise plans](https://cloud.ibm.com/docs/EventStreams?topic=EventStreams-plan_choose) | [AWS Services in Scope by Compliance Program](https://aws.amazon.com/compliance/services-in-scope/?nc1=h_ls) |
| **Monitoring** | Homemade (prometheus & grafana) | Monitoring Event Streams metrics using IBM Cloud Monitoring with Sysdig | Monitoring Kinesis using Amazon Cloudwatch |
| **Limits and quotas** | Depend of architecture configuration | [See. IBM Documentations](https://cloud.ibm.com/docs/EventStreams?topic=EventStreams-kafka_quotas) | [See. AWS Documentations](https://docs.aws.amazon.com/streams/latest/dev/service-sizes-and-limits.html) |

## Conclusion

Apache Kafka and AWS Kinesis Data Streams are good choices for real-time data streaming platforms. If you need to keep messages for more than 7 days with no limitation on message size per blob, Apache Kafka should be your choice. However, Apache Kafka requires extra effort to set up, manage, and support.<br />
If your organization lacks Apache Kafka experts and/or human support, then choosing a fully-managed AWS Kinesis service will let you focus on the development. AWS Kinesis is catching up in terms of overall performance regarding throughput and events processing.

[Back](/learn/apache-kafka/README.md)