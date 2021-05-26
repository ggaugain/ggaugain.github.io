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

<img src="/techno/data/apache-airflow/airflow-dag-concept.png" width="20%" />

### Tasks
Each node of a DAG represents a task. It is a visual representation of the jobs in progress, at each stage of the workflow. <br />
The jobs represented are defined by the operators.

### Operators
Operators are what actually execute scripts, commands, and other operations when a Task is run.
There a number of operators that ship with Airflow, as well as countless custom ones created by the Airflow community.<br />
Below are some of the most common operators:
* BashOperator
* PythonOperator
* SimpleHttpOperator
* EmailOperator
* MySqlOperator, PostgresOperator, and other database specific operators for executing SQL commands

### Database
Airflow requires a database to store all the metadata related to the execution history of each task and DAG and more.<br />
By default, Airflow uses a SQLite database but you can point it to a MySQL or PostgreSQL.

### Scheduler
The Scheduler is constantly monitoring DAGs and tasks and running any that have have been scheduled to run or have had their dependencies met.

### Executers
Executors are what Airflow uses to run tasks that the Scheduler determines are ready to run.<br />
By default, Airflow uses the SequentialExecutor, but it is possible to used the [CeleryExecutor](https://airflow.apache.org/docs/apache-airflow/stable/executor/celery.html), [DaskExecutor](https://airflow.apache.org/docs/apache-airflow/stable/executor/dask.html), or [KubernetesExecutor](https://airflow.apache.org/docs/apache-airflow/stable/executor/kubernetes.html) to run tasks in parallel or distributed on several workers.<br />
The kubernetes executor is introduced in Apache Airflow 1.10.0. The Kubernetes executor will create a new pod for every task instance.<br />
When a DAG submits a task, the KubernetesExecutor requests a worker pod from the Kubernetes API. The worker pod then runs the task, reports the result, and terminates.

<img src="/techno/data/apache-airflow/airflow-k8s-worker.png" />

In contrast to the CeleryExecutor, the KubernetesExecutor does not require additional components such as Redis, but does require the Kubernetes infrastructure.

### Workers
These are the processes that actually execute the logic of tasks, and are determined by the Executor being used.

### Web Server
The Airflow UI makes it easy to monitor and troubleshoot data pipelines with some of the features and visualizations availables.<br />
Below are some screenshots taken from the [Apache Airflow](https://airflow.apache.org/docs/apache-airflow/stable/ui.html) documentation.

<img src="/techno/data/apache-airflow/airflow-web-server.png" />

### Command Line Interface
In addition to the Scheduler and Web UI, Airflow has a very rich command line interface that allows for many types of operation on a DAG, starting services, and supporting development and testing.<br />

For more information on CLI commands, see [Command Line Interface and Environment Variables Reference](https://airflow.apache.org/docs/apache-airflow/stable/cli-and-env-variables-ref.html)

## Alternatives

We can find different alternatives to Apache Airflow which may require more or less development depending on the needs in terms of workflow.
* [Apache NiFi](/techno/apache-nifi.md)
* AWS - services: [AWS Lambda](https://aws.amazon.com/lambda/) | [AWS Kinesis](https://aws.amazon.com/kinesis/streams/) | [AWS Glue](https://aws.amazon.com/glue/) | etc.
* Azure - services: [Azure Functions](https://azure.microsoft.com/en-in/services/functions/) | [Azure Event Hub](https://azure.microsoft.com/en-us/services/event-hubs/) | [Azure Data Factory](https://azure.microsoft.com/en-in/services/data-factory/) | etc.
* GCP - services: [Cloud Function](https://cloud.google.com/functions/) | [Cloud Dataflow](https://cloud.google.com/dataflow/) | [Cloud DataPrep](https://cloud.google.com/dataprep/) | etc.
* IBM Cloud - services: [Cloud Functions](https://www.ibm.com/cloud/functions) | [Event Streams](https://cloud.ibm.com/catalog/services/event-streams) | [DataStage ](https://www.ibm.com/products/infosphere-datastage)| etc.

## Conceptual Diagram
Airflow’s operation is built atop a Metadata Database which stores the state of tasks and workflows (i.e. DAGs).<br /> 
The Scheduler and Executor send tasks to a queue for Worker processes to perform. <br/>
The Webserver runs (often-times running on the same machine as the Scheduler) and communicates with the database to render task state and Task Execution Logs in the Web UI. <br />
Each colored box indicates that each component can exist in isolation from the other components, depending on the type of deployment configuration.

<img src="/techno/data/apache-airflow/airflow-architecture.png" />

## Example
### Step 1: running Airflow in Docker

Apache Airflow required some components and setup information are available to website. You can used docker-compose for your tests.
* https://airflow.apache.org/docs/apache-airflow/stable/start/docker.html

At the end of the deployment you should have a bunch of containers up on your system:

<img src="/techno/data/apache-airflow/airflow-docker-example-01.png" />

### Step 2: Airflow access via a browser
The webserver available at: http://localhost:8080 <br /> 
The default account has the login airflow and the password airflow.<br /> <br /> 
Once logged in you should see examples of DAGs which are proposed during deployment in the docker-compose.yaml file (var: AIRFLOW__CORE__LOAD_EXAMPLES)

<img src="/techno/data/apache-airflow/airflow-docker-example-02.png" />

## Diving Deeper
* [Airflow in Practice Stop Worrying Start Loving DAGs](https://www.youtube.com/watch?v=XD7euLOzKbs) | Youtube
* [How to write your first DAG in Apache Airflow - Airflow tutorials](https://www.youtube.com/watch?v=2nhdhIYueIE) | Youtube 

[Back](/techno/README.md)