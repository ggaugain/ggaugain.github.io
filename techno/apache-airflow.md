<img src="/techno/data/apache-airflow/airflow-logo.png" align="right" width="20%" />

[Back](/techno/README.md)

# Apache Airflow

**Table of contents**
1. [What is Apache Airflow?](#what-is-apache-airflow)
2. [Apache Airflow basics](#apache-airflow-components-and-concepts)
3. [Alternatives](#alternatives)
4. [Conceptual Diagram](#conceptual-diagram)
5. [Example](#example)
6. [Diving Deeper](#diving-deeper)

## What is Apache Airflow?
Airflow is an open-source workflow management platform. It started at Airbnb in October 2014 as a solution to manage the company's increasingly complex workflows. <br />
In April 2016, the project joined the official incubator of the Apache Foundation.

> Doc: https://airflow.apache.org

Airflow’s biggest perk is that it relies on code to define its workflows. <br />
Airflow DAGs are defined in a Python script, where the DAGs’ structure and task dependencies are written in Python code. <br />
Nonetheless, Airflow also offers UI. That makes tracking jobs, rerunning them, and configuring the platform simpler. <br />

### What is Airflow used for?
Airflow can be used for any batch data pipeline, so its use cases are as many as they are diverse.<br />
As an example, Airflow can be used to aggregate daily updates from sales teams from Salesforce to send a daily report to company executives.<br />
Several other use cases are presented in the [Apache Airflow documentation](https://airflow.apache.org/use-cases/)

## Apache Airflow components and concepts
The Airflow architecture is based on several elements. Here are the main ones.

### DAGs
A DAG (Directed Acyclic Graph) is a data pipeline defined in Python code.<br />
Each DAG represents a sequence of tasks to be performed, organized to indicate the relationships between the tasks on the Airflow user interface.<br />

Each of the three words in the acronym DAG corresponds to a property of these tasks:
* **Directed** - tasks must have at least one upstream task and one downstream task
* **Acyclic** - tasks are not allowed to create self-referenced data in order to avoid creating endless loops
* **Graph** - the tasks are presented in a clear structure indicating their relationships.

<img src="/techno/data/apache-airflow/airflow-dag-concept.png" width="50%" />

### Tasks
Each node of a DAG represents a task. It is a visual representation of the jobs in progress, at each stage of the workflow. <br />
The jobs represented are defined by the operators.


## Alternatives

We can find different alternatives to Apache Airflow which may require more or less development depending on the needs in terms of workflow.
* [Apache NiFi](/techno/apache-nifi.md)
* AWS - services: [AWS Lambda](https://aws.amazon.com/lambda/) | [AWS Kinesis](https://aws.amazon.com/kinesis/streams/) | [AWS Glue](https://aws.amazon.com/glue/) | etc.
* Azure - services: [Azure Functions](https://azure.microsoft.com/en-in/services/functions/) | [Azure Event Hub](https://azure.microsoft.com/en-us/services/event-hubs/) | [Azure Data Factory](https://azure.microsoft.com/en-in/services/data-factory/) | etc.
* GCP - services: [Cloud Function](https://cloud.google.com/functions/) | [Cloud Dataflow](https://cloud.google.com/dataflow/) | [Cloud DataPrep](https://cloud.google.com/dataprep/) | etc.
* IBM Cloud - services: [Cloud Functions](https://www.ibm.com/cloud/functions) | [Event Streams](https://cloud.ibm.com/catalog/services/event-streams) | [DataStage ](https://www.ibm.com/products/infosphere-datastage)| etc.

## Conceptual Diagram

## Example

## Diving Deeper
* [Airflow in Practice Stop Worrying Start Loving DAGs](https://www.youtube.com/watch?v=XD7euLOzKbs) | Youtube

[Back](/techno/README.md)