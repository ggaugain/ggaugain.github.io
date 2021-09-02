<img src="/techno/data/zabbix/zabbix-logo.png" align="right" width="20%" />

[Back](/techno/README.md)

# Zabbix

**Table of contents**
1. [What is Zabbix?](#what-is-zabbix)
2. [Alternatives](#alternatives)
3. [Conceptual Diagram](#conceptual-diagram)
4. [Example: Running Zabbix in Docker](#example-running-zabbix-in-docker)
5. [Diving Deeper](#diving-deeper)

## What is Zabbix?
Zabbix is ​​open-source monitoring software for networks and applications. It allows real-time monitoring of thousands of metrics collected from servers, virtual machines, network devices and web applications.

> Doc: http://www.zabbix.com/documentation/

Zabbix uses several options to gather metrics, including agentless monitoring of user services and client-server architecture. To collect server metrics, it uses an agent on the monitored client to gather the data and send it to the Zabbix server. Zabbix supports encrypted communication between the server and connected clients, so your data is protected when it travels over unsecured networks.

**Metric collection methods:**

* [Multi-platform Zabbix agent](https://www.zabbix.com/zabbix_agent)
* [SNMP and IPMI agents](https://www.zabbix.com/snmp_ipmi_agent)
* [Agentless monitoring of user services](https://www.zabbix.com/agentless_monitoring)
* [Custom methods](https://www.zabbix.com/custom_monitoring)
* [Calculation and aggregation](https://www.zabbix.com/calculated_and_aggregate)
* [End user web monitoring](https://www.zabbix.com/web_scenarios)

<img src="/techno/data/zabbix/zabbix-collection.png" width="70%" /> <br />

**Components**

* Zabbix Server
Main component, the Zabbix Server allows remote (and local) monitoring of the proper functioning of various system and network services

* Zabbix Frontend
Second essential component after Zabbix Server, Zabbix Frontend is quite simply the interface for viewing events, but also, and above all, the Zabbix administration and configuration interface.

* Zabbix Proxy
Zabbix Proxy collects information about the performance and availability of data on a host, before transmitting it to the Zabbix Server.
Zabbix Proxy offers the possibility of reducing the load of a Zabbix server.

* Zabbix Agent
Although optional, to do without the Zabbix Agent would be a mistake, because even if the Zabbix server can operate without an agent, the use of the latter allows better monitoring of the hosts, and therefore more supervision.

## Alternatives
* (Software) [Dynatrace](https://www.dynatrace.com/)
* (Software) [Datadog](https://www.datadoghq.com/)
* (Open source) [Nagios](https://www.nagios.org/downloads/)
* (Open source) [Prometheus](https://prometheus.io)

### Zabbix vs Prometheus
Prometheus is open source monitoring software created by SoundCloud in July 2016. It is a benchmark application for controlling private cloud (OpenStack, OpenShift) or public cloud (Amazon Web Services, Microsoft Azure, Google Cloud) infrastructures. Developed since 1998, Zabbix is ​​also an open source monitoring system, which has been able to renew itself. Developed in PHP, it is in line with Nagios and MRTG. Given this history, it is considered less suitable for responding to big data issues. <br />
However Zabbix remains a very complete and efficient solution.

## Conceptual Diagram

<img src="/techno/data/zabbix/zabbix-conceptual-diagram.png" width="90%" />

## Example: Running Zabbix in Docker
Zabbix can be installed using different distributions of Linux, and even has a couple of choices for web servers and databases.<br />
[This repository](https://github.com/zabbix/zabbix-docker) contains Dockerfile of Zabbix for Docker's automated build published to the public Docker Hub Registry.

## Diving Deeper
* [Zabbix Youtube channel](https://www.youtube.com/user/ZabbixSIA)
* [Zabbix Fundamental Tutorial for Beginners](https://www.youtube.com/watch?v=wnObZNfJJSQ) | Youtube

[Back](/techno/README.md)