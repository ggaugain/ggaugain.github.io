[Back](/learn/README.md)

# Apache Kafka

[Apache Kafka](https://kafka.apache.org/) is an open-source stream-processing software platform developed by LinkedIn and donated to the Apache Software Foundation, written in Scala and Java.

Kafka is a publish/subscribe messaging system. It may also be labeled a distributed streaming platform.

Kafka is a hub that all components of an application can plug into to handle many different types of messages. How Kafka handles those message depends on the delivery semantics chosen. Also, in order to help simplify the format of data, Kafka offers schemas to help keep it uniform over time.

<img src="/learn/apache-kafka/data/kafka-intro.png" width="80%" />

-----------------
**Table of contents**
1. [From Zero to Hero!](#from-zero-to-hero)
2. [Kafka Concepts](#kafka-concepts)
3. [Documentation and Resources](#documentation-and-resources)
4. [Examples](#examples)
5. [Blog Posts and Talks](#blog-posts-and-talks)
6. [Video tutorials](#video-tutorials)
7. [Architecture and Advanced Concepts](#architecture-and-advanced-concepts)


## From Zero to Hero!
<table>
   <thead>
       <tr>
           <th style="text-align: center; vertical-align: middle;">Stage 1 / Concepts <br /><img src="/learn/data/learning-path-icon-stage1.png" /></th>
           <th style="text-align: center; vertical-align: middle;">Stage 2 / Foundations <br /><img src="/learn/data/learning-path-icon-stage2.png" /></th>
           <th style="text-align: center; vertical-align: middle;">Stage 3 / Core <br /><img src="/learn/data/learning-path-icon-stage3.png" /></th>
           <th style="text-align: center; vertical-align: middle;">Stage 4 / Deep Dives <br /><img src="/learn/data/learning-path-icon-stage4.png" /></th>
       </tr>
   </thead>

   <tbody>
       <tr>
           <td><a href="#/learn/apache-kafka/README?id=kafka-concepts">Kafka Concepts</a></td>
           <td><a href="https://interactive.linuxacademy.com/diagrams/ApacheKafkaDD.html" target="_blank">Apache Kafka Deep Dive (linux academy)</a></td>
           <td><a href="#/learn/apache-kafka/lab-installing-apache-kafka-and-zookeeper">Lab: Installing Apache Kafka and Zookeeper</a></td>
           <td><a href="https://www.youtube.com/watch?v=XXLe0KNEbR4" target="_blank">Which Metrics to Monitor in Kafka? (youtube)</a></td>
       </tr>
       <tr>
           <td><a href="https://kafka.apache.org/intro" target="_blank">Introduction (apache.org)</a></td>
           <td><a href="https://engineering.linkedin.com/kafka/benchmarking-apache-kafka-2-million-writes-second-three-cheap-machines" target="_blank">Benchmarking Apache Kafka: 2 Million Writes Per Second (linkedin)</a></td>
           <td><a href="#/learn/apache-kafka/lab-using-kafka-connect-to-capture-data-from-a-relational-database">Lab: Using Kafka Connect to Capture Data from a Relational Database</a></td>
           <td><a href="https://kafka.apache.org/documentation/#security" target="_blank">Kafka Security (apache.org)</a></td>
       </tr>
       <tr>
           <td><a href="https://kafka.apache.org/uses" target="_blank">Use cases (apache.org)</a></td>
           <td><a href="#/learn/apache-kafka/command-examples">Command-examples</a></td>
           <td><a href="#/learn/apache-kafka/lab-creating-topic-with-custom-configurations">Lab: Creating a Topic with Custom Configurations in Kafka</a></td>
           <td><a href="#/learn/apache-kafka/apache-kafka-vs-providers-managed-services">Apache Kafka VS Providers managed services</a></td>
       </tr>
       <tr>
           <td> </td>
           <td><img src="/learn/data/flag_fr.png" /> <a href="https://www.youtube.com/watch?v=KWAELycyxTc&feature=youtu.be" target="_blank">Apache Kafka, de haut en bas by Devoxx FR (youtube)</a></td>
           <td><a href="#/learn/apache-kafka/lab-backup-message-to-s3">lab: Back up Messages to an S3 Bucket in Kafka</a></td>
           <td><a href="#/learn/apache-kafka/kafka-monitoring">Kafka Monitoring</a></td>
       </tr>
       <tr>
           <td> </td>
           <td> </td>
           <td><a href="#/learn/apache-kafka/lab-streaming-data-using-kafka-streams">Lab: Streaming Data Using Kafka Streams to Count Words</a></td>
           <td> </td>
       </tr>
       <tr>
           <td> </td>
           <td> </td>
           <td><a href="#/learn/apache-kafka/lab-replicating-data-between-two-kafka-clusters">Lab: Replicating Data Between Two Kafka Clusters</a></td>
           <td> </td>
       </tr>                            
   </tbody>
</table>

## Kafka Concepts
* **Brokers**: Brokers are entry point to the ecosystem. They allow producers to write data to Queue in a partition of a topic and allow consumers to read data at a particular offset in a partition of a topic.
* **Topic**: Topic is a logical identifier in Kafka storage. It is analogous to table name in a database. Producers and Consumers must specify the topic name to write or read to the Kafka storage respectively.
* **Partitions**: Partitions are the building blocks of fault tolerance and throughput in Kafka distributed system.
* **Producer**: A producer is any client that has made connection to the broker using [Producers API](https://kafka.apache.org/documentation.html#producerapi). It has to mention a topic name to write data to the Kafka. If the topic is not yet created, new topic will be created automatically(the configuration to create new topic automatically can be turned off from properties)
* **Consumer**: A consumer is any client that has made connection the broker using [Consumers API](https://kafka.apache.org/documentation.html#consumerapi). It has to mention a topic name to read data from the Kafka.

## Documentation and Resources
* [Global documentation (apache.org)](https://kafka.apache.org/documentation/) - apache.org
* [Apache Kafka Deep Dive (Linux Academy Interactive Diagram)](https://interactive.linuxacademy.com/diagrams/ApacheKafkaDD.html)
* [Apache Kafka Ecosystem (apache.org)](https://cwiki.apache.org/confluence/display/KAFKA/Ecosystem)
* [Apache Kafka VS Providers managed services](./apache-kafka-vs-providers-managed-services.md)
* [Replace ZooKeeper with a Self-Managed Metadata Quorum (apache.org)](https://cwiki.apache.org/confluence/display/KAFKA/KIP-500%3A+Replace+ZooKeeper+with+a+Self-Managed+Metadata+Quorum)

## Examples
* [Lab: Installing Apache Kafka and Zookeeper](./lab-installing-apache-kafka-and-zookeeper.md)
* [Lab: Using Kafka Connect to Capture Data from a Relational Database](./lab-using-kafka-connect-to-capture-data-from-a-relational-database.md)
* [Lab: Creating a Topic with Custom Configurations in Kafka](./lab-creating-topic-with-custom-configurations.md)
* [lab: Back up Messages to an S3 Bucket in Kafka](./lab-backup-message-to-s3.md)
* [Lab: Streaming Data Using Kafka Streams to Count Words](./lab-streaming-data-using-kafka-streams.md)
* [Lab: Replicating Data Between Two Kafka Clusters](./lab-replicating-data-between-two-kafka-clusters.md)
* [Command-examples](./command-examples.md)
* [Kafka Tutorials (Confluent.io)](https://kafka-tutorials.confluent.io/)

## Blog Posts and Talks
* [How Heroku Operates its Multi-Tenant Apache Kafka Services](https://blog.heroku.com/how-heroku-operates-its-multi-tenant-apache-kafka-services)
* [Confluent.io online talks](https://www.confluent.io/online-talks)
* <img src="/learn/data/flag_fr.png" /> [Apache Kafka, de haut en bas by Devoxx FR (youtube)](https://www.youtube.com/watch?v=KWAELycyxTc&feature=youtu.be)

## Video tutorials
* Kafka schema registry and rest-proxy - https://youtu.be/5fjw62LGYNg
* Avro: schema evolution - By Stephane Maarek - https://youtu.be/SZX9DM_gyOE
* Avro producer - By Stephane Maarek https://youtu.be/_6HTHH1NCK0
* Kafka Connect Architecture - By Stephane Maarek https://youtu.be/YOGN7qr2nSE
* Kafka Connect Concepts - By Stephane Maarek https://youtu.be/BUv1IgWm-gQ
* Kafka Connect Distributed architecture - By Stephane Maarek https://youtu.be/52HXoxthRs0
* Kafka-connect https://www.youtube.com/playlist?list=PLt1SIbA8guutTlfh0J7bGboW_Iplm6O_B
* KSQL https://www.youtube.com/watch?v=ExEWJVjj-RA&list=PLa7VYi0yPIH2eX8q3mPpZAn3qCS1eDX8W
* kafka-streams explained by Neha https://www.youtube.com/watch?v=A9KQufewd-s&feature=youtu.be
* kafka-streams https://www.youtube.com/watch?v=Z3JKCLG3VP4&list=PLa7VYi0yPIH1vDclVOB49xUruBAWkOCZD
* kafka-streams https://youtu.be/Z3JKCLG3VP4
* kafka-streams https://youtu.be/LxxeXI1mPKo
* kafka-streams https://youtu.be/-y2ALVkU5Bc
* kafka-streams - By Stephane Maarek https://youtu.be/wPw3tb_dl70
* kafka-streams - By Tim berglund https://youtu.be/7JYEEx7SBuE
* kafka-streams - By Tim berglund https://youtu.be/3kJgYIkAeHs

## Architecture and Advanced Concepts
* Exactly once semantics: https://www.confluent.io/blog/exactly-once-semantics-are-possible-heres-how-apache-kafka-does-it/
* Kafka partition: https://medium.com/@anyili0928/what-i-have-learned-from-kafka-partition-assignment-strategy-799fdf15d3ab
* kafka stateful DSL: https://kafka.apache.org/20/documentation/streams/developer-guide/dsl-api.html#stateful-transformations

[Back](/learn/README.md)