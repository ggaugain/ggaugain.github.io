<img src="/techno/data/prometheus/prometheus-logo.png" align="right" width="20%" />

[Back](/techno/README.md)

# Prometheus

**Table of contents**
1. [What is Prometheus?](#what-is-prometheus)
2. [Alternatives](#alternatives)
3. [Conceptual Diagram](#conceptual-diagram)
4. [Architectural Diagram](#architectural-diagram)
5. [Example](#example)
6. [Diving Deeper](#diving-deeper)

## What is prometheus?
Prometheus is open source systems monitoring and alerting software created by the SoundCloud music platform.
It logs real-time metrics to a time series database based on entry point content exposed using the HTTP protocol.

> Doc: https://prometheus.io/docs/introduction/overview/

**Feature Checklist**
* Open Source
* Many Integrations - has exporters for PostgreSQL,  AWS, Kubernetes and many more. 
* Powerful Queries
* Alerting - including to Email, Slack, PagerDuty.
* Push or Pull

In 2016, Prometheus was the second project accepted into the <a href="https://www.cncf.io/announcement/2016/05/09/cloud-native-computing-foundation-accepts-prometheus-as-second-hosted-project/">Cloud Native Computing Foundation</a> after Kubernetes, and also to the second <a href="https://www.cncf.io/announcement/2018/08/09/prometheus-graduates/">to graduate</a> in 2018.

The Prometheus monitoring system includes a rich, multidimensional data model, a concise and powerful query language called PromQL, an efficient embedded timeseries database, and over 150 integrations with third-party systems.

**Components**
The Prometheus ecosystem consists of multiple components, many of which are optional:
* the main [Prometheus server](https://github.com/prometheus/prometheus) which scrapes and stores time series data
* [client libraries](https://prometheus.io/docs/instrumenting/clientlibs/) for instrumenting application code
* a [push gateway](https://github.com/prometheus/pushgateway) for supporting short-lived jobs
* special-purpose [exporters](https://prometheus.io/docs/instrumenting/exporters/) for services like HAProxy, StatsD, Graphite, etc.
* an [alertmanager](https://github.com/prometheus/alertmanager) to handle alerts
* various support tools

Most Prometheus components are written in Go, making them easy to build and deploy as static binaries.

**Wait, theres no authentication?!**
Authentication is hard - the Prometheus team know this well, as such they have determined that authentication is outside of the scope of the project and it is onto you to deal with it.

If metric data is deemed sensitive enough to require authentication my personal recommendations:
* Limit access to the exporters HTTP endpoint to only be accessible from the Prometheus Server using firewall rules.
* Limit access to the Prometheus Server to only be from Grafana.
* Basic Auth - if you are running node exporters using docker running a basic auth proxy on top will further limit access.

**But what about colourful graphs?**
Prometheus is essentially a wrapper around a time series database that allows collecting metrics from various exporters. As such there isn't a feature rich user interface to interact with. But worry not, Grafana has native support for Prometheus as a data source.

<img src="/techno/data/prometheus/prometheus-grafana.png" width="40%" />

## Alternatives
* (SaaS) [Dynatrace](https://www.dynatrace.com/)
* (SaaS) [Datadog](https://www.datadoghq.com/)
* (open source) [Zabbix](https://www.zabbix.com/)

### Prometheus vs Zabbix
Prometheus is open source monitoring software created by SoundCloud in July 2016. It is a benchmark application for controlling private cloud (OpenStack, OpenShift) or public cloud (Amazon Web Services, Microsoft Azure, Google Cloud) infrastructures. Developed since 1998, Zabbix is ​​also an open source monitoring system, which has been able to renew itself. Developed in PHP, it is in line with Nagios and MRTG. Given this history, it is considered less suitable for responding to big data issues.

## Conceptual Diagram
This diagram illustrates the architecture of Prometheus and some of its ecosystem components:

<img src="/techno/data/prometheus/prometheus-conceptual-diagram.png" width="40%" />

Prometheus scrapes metrics from instrumented jobs, either directly or via an intermediary push gateway for short-lived jobs. It stores all scraped samples locally and runs rules over this data to either aggregate and record new time series from existing data or generate alerts. [Grafana](https://grafana.com/) or other API consumers can be used to visualize the collected data.

## Architectural Diagram
An simple example of monitoring a server resource usage (RAM, CPU, Disk Usage etc) and an HTTP web app running on it (via a HTTP Healthcheck Endpoint) with Prometheus components and Grafana:

<img src="/techno/data/prometheus/prometheus-architectural-diagram.png" width="40%" />

## Example: Running Prometheus in Docker


## Diving Deeper
* [Monitoring with Prometheus](https://ordina-jworks.github.io/monitoring/2016/09/23/Monitoring-with-Prometheus.html)
* [Monitoring, the Prometheus Way](https://www.youtube.com/watch?v=PDxcEzu62jk) | Youtube ()DockerCon 17)
* [Prometheus Architecture explained](https://www.youtube.com/watch?v=h4Sl21AKiDg) | Youtube
* [Intro to metrics with Grafana: Prometheus, Graphite and beyond](https://grafana.com/go/webinar/intro-to-metrics-with-grafana-prometheus-graphite-and-beyond/?pg=oss-prom&plcmt=hero-txt) | Webinar
* [Introduction to observability with Prometheus](https://grafana.com/go/webinar/intro-to-observability-with-prometheus/?pg=oss-prom&plcmt=hero-txt) | Webinar

[Back](/techno/README.md)