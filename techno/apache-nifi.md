# Apache NiFi

**Table of contents**
1. [What is Apache NiFi?](#what-is)
2. [Apache NiFi basics: FlowFile, Processor, Connector](#basics)
3. [When to use it or not to use it?](#when-to-used)
4. [Apache NiFi: rest API](#rest-api)
5. [Apache NiFi: Template](#template)
6. [Alternatives](#alternatives)
7. [Conceptual Diagram](#conceptual-diagram)
    1. [Functional architecture](#functional-architecture)
    2. [Technical architecture](#technical-architecture)
8. [Build from scratch](#build-from-scratch)
9. [Further Reading](#further-reading)

## What is Apache NiFi? <a name="what-is"></a>
Apache NiFi is an open source data ingestion platform.

It was developed by the NSA and is now maintained by the Apache Foundation.
* 2014- It was donated to the Apache Software Foundation
* 2015 - NiFi became an official part of the Apache suite of projects
* Since then, every 6-8 weeks, Apache NiFi releases a new update

## Apache NiFi basics: FlowFile, Processor, Connector <a name="basics"></a>
The three key concepts of Apache NiFi are: **FlowFile** | **Processor** | **Connector**

* FlowFile: it's the data
* Processor: Applies a set of transformations and rules to FlowFiles to generate new FlowFiles
    * Data Transformation: ReplaceText, …
    * Routing and Mediation: RouteOnAttribute, RouteOnContent, ControlRate…
    * Database Access: ExecuteSQL, ConvertJSONToSQL, PutSQL...
    * Attribute Extraction: EvaluateJsonPath, ExtractText, UpdateAttribute…
    * System Interaction: ExecuteProcess …
    * Data Ingestion: GetFile, GetFTP, GetHTTP, GetHDFS, ListenUDP, GetKafka…
    * Sending Data: PutFile, PutFTP, PutKafka, PutEmail…
    * Splitting and Aggregation: SplitText, SplitJson, SplitXml, MergeContent…
    * HTTP: GetHTTP, ListenHTTP, PostHTTP…
    * AWS: FetchS3Object, PutS3Object, PutSNS, GetSQS
* Connector: This is basically a queue of all FlowFiles that have not yet been processed by the Processor. It also allows you to define the priority rules of FlowFiles (which ones first, which ones not at all)

The link between the components can be represented as follows:
<img src="/techno/data/apache-nifi/apache-nifi-link-between-components.png" />

## When to use it or not to use it? <a name="when-to-used"></a>
The most common use case of Apache NiFi is for automating the flow of data between systems.
* ex: JSON → Database, FTP → Hadoop, Kafka → ElasticSearch, etc.

Apache NiFi is really useful for building data pipelines using "drag and drop" with little to no programming, all of which is determined by configuration.

The table below shows some cases of Apache NiFi use or in which context to avoid using it

| Good usage | Bad usage |
| ------ | ------ |
| Data transfer and secure between systems. | Distributed workload for calculations (processes performed in different locations). <br /> Hadoop or Spark are better suited for this type of operation. |
| Delivery of data to analytical platforms. | Processing of complex events |
| Data enrichment and preparation <br /> - Conversion between different formats <br /> - Extraction / analysis <br /> - Data routing     |  Processing of complex events |

## Apache NiFi: rest API <a name="rest-api"></a>
Apache NiFi restAPI offers a set of endpoints allowing, among other things, to start and stop processors, monitor waiting files, query source data, etc.

Each endpoint including their description are available here: https://nifi.apache.org/docs/nifi-docs/rest-api/index.html

## Apache NiFi: Template <a name="template"></a>
Apache NiFi allows you to export or import part of a data stream (or the entire data stream).
This model in XML format can then be shared allowing these building blocks to be shared in another NiFi instance.

Some templates are available here:
* [Example Dataflow Templates](https://cwiki.apache.org/confluence/display/NIFI/Example+Dataflow+Templates)
* [Hotonworks Gallery](https://github.com/hortonworks-gallery/nifi-templates/tree/master/templates)

## Alternatives <a name="alternatives"></a>

We can find different alternatives to Apache NiFi which may require more or less development depending on the needs in terms of data flow.
* [StreamSets](https://github.com/streamsets)
* [Apache Spark](https://spark.apache.org/)
* AWS - services: [AWS Lambda](https://aws.amazon.com/lambda/) | [AWS Kinesis](https://aws.amazon.com/kinesis/streams/) | [AWS Glue](https://aws.amazon.com/glue/) | etc.
* Azure - services: [Azure Functions](https://azure.microsoft.com/en-in/services/functions/) | [Azure Event Hub](https://azure.microsoft.com/en-us/services/event-hubs/) | [Azure Data Factory](https://azure.microsoft.com/en-in/services/data-factory/) | etc.
* GCP - services: [Cloud Function](https://cloud.google.com/functions/) | [Cloud Dataflow](https://cloud.google.com/dataflow/) | [Cloud DataPrep](https://cloud.google.com/dataprep/) | etc.
* IBM Cloud - services: [Cloud Functions](https://www.ibm.com/cloud/functions) | [Event Streams](https://cloud.ibm.com/catalog/services/event-streams) | [DataStage ](https://www.ibm.com/products/infosphere-datastage)| etc.


## Conceptual Diagram <a name="conceptual-diagram"></a>
### Functional architecture <a name="functional-architecture"></a>
The diagram below shows a functional view of an Apache NiFi architecture with a representation of two flows (API & UI). <br />
The notion of “repository” represents the data storage space which can be internal or external to the worker. <br />
It should be noted that the FlowFile will be stored locally in the worker during its processing phase. <br />

<img src="/techno/data/apache-nifi/apache-nifi-functional-architecture.png" />

### Technical architecture <a name="technical-architecture"></a>
Apache NiFi can be deployed in 2 ways, on a single host or in a cluster on an instance or in a container. <br />
The choice will be made according to storage needs, power over treatments and the desired availability. Please note that Apache Nifi and its components may be containerized. <br />

The diagram below is an example of hosting an Apache NiFi container on AWS <br />

<img src="/techno/data/apache-nifi/apache-nifi-technical-architecture.png" />

## Build from scratch <a name="build-from-scratch"></a>
Install Apache NiFi on debian step by step

```
# - Install OpenJDK - #
apt-get update && apt-get install openjdk-11-jdk
 
# - Create the variable for JAVA_HOME - #
nano /etc/profile.d/java.sh
 
# - Add these lines below - #
#/bin/bash
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
 
# - Download the Apache Nifi package - #
mkdir ~/downloads/apache-nifi -p
cd ~/downloads/apache-nifi
wget https://downloads.apache.org/nifi/1.12.1/nifi-1.12.1-bin.tar.gz
 
# - Install the Apache Nifi server - #
tar -zxvf nifi-1.12.1-bin.tar.gz
mv nifi-1.12.1 /opt/
ln -s /opt/nifi-1.12.1/ /opt/nifi
cd /opt/nifi
bin/nifi.sh install
 
# - Start the Apache Nifi service - #
/etc/init.d/nifi start
 
# - Enjoy! You can access to Apache NiFi with your browser - #
http://<@IP>:8080/nifi
```

## Further Reading <a name="further-reading"></a>
* [Apache NiFi User Guide](https://nifi.apache.org/docs/nifi-docs/html/user-guide.html)
* [Apache NiFi Expression Language Guide](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html)
