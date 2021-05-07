<img src="/techno/data/apache-guacamole/guacamole-logo.png" align="right" width="10%" />

[Back](/techno/README.md)

# Apache Guacamole

**Table of contents**
1. [What is Apache Guacamole?](#what-is-apache-guacamole)
2. [Alternatives](#alternatives)
2. [Conceptual Diagram](#conceptual-diagram)
3. [Example](#example)
4. [Diving Deeper](#diving-deeper)

## What is  Apache Guacamole?
Apache Guacamole is a browser based remote access tool that provides easy access to hosts in your VPC. Both Windows desktops (RDP) and Linux terminals (SSH) are supported. No client software needs to be installed, an HTML5 capable web browser is all you need.

> Docs: https://guacamole.apache.org/

Guacamole can be paired with LDAP/Active Directory for authentication. It is also recommended to activate double factor authentication for more security (SMS for example).

Guacamole also allows you to share a screen. You can share your guacamole screen by sharing a link and then set whether users connected through that link will be able to control the machine or not. This can be very handy for doing product demos, for example.

**Why use Apache Guacamole?**
VNC, RDP, Telnet, and SSH all require client apps on the local system to be able to connect to remote systems. For example, connecting to an SSH server on Linux from a Windows system requires an SSH client such PuTTY or similar app.
Similarly, VNC and RDP require client apps as well. But wait, what if you can't install these client apps on the local system (eg. Work computers or public computers)? Here is where Guacamole comes to save your life, as all it requires is a HTML5 web browser.

* You can access your systems from anywhere with just a web browser
* No configuration needed on the local system. Fire up a browser, go to your Guacamole app URL, login, and you are good to go.

Apache Guacamole can be a good alternative to VPNs or Bastion hosts

## Alternatives
* Microsoft Remote Desktop Gateway
* TeamViewer
* Citrix

## Conceptual Diagram

<img src="/techno/data/apache-guacamole/guacamole-architecture.png" />

## Example

In this example, we will create an environment Apache Guacamole via docker-compose.

```Usage
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > ./init/initdb.sql
docker-compose up -d
```

```docker-compose.yml
### docker-compose file for Apache Guacamole ###
#
# Usage:
# docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > ./init/initdb.sql
# docker-compose up -d
#
# First login to Guacamole:
#     Url: http://localhost:8080/guacamole
#     Username: guacadmin
#     Password: guacadmin

version: '3.4'

networks:
  guacnetwork_compose:

services:
  # guacd
  guacd:
    container_name: guacd_compose
    image: guacamole/guacd
    networks:
      guacnetwork_compose:
    restart: always
    volumes:
    - ./drive:/drive:rw
    - ./record:/record:rw
  # postgres
  postgres:
    container_name: postgres_guacamole_compose
    environment:
      PGDATA: /var/lib/postgresql/data/guacamole
      POSTGRES_DB: guacamole_db
      POSTGRES_PASSWORD: ChangeMeNow
      POSTGRES_USER: guacamole_user
    image: postgres
    networks:
      guacnetwork_compose:
    restart: always
    volumes:
    - ./init:/docker-entrypoint-initdb.d:ro
    - ./data:/var/lib/postgresql/data:rw
  # guacamole
  guacamole:
    container_name: guacamole_compose
    depends_on:
    - guacd
    - postgres
    environment:
      GUACD_HOSTNAME: guacd
      POSTGRES_DATABASE: guacamole_db
      POSTGRES_HOSTNAME: postgres
      POSTGRES_PASSWORD: ChangeMeNow
      POSTGRES_USER: guacamole_user
    image: guacamole/guacamole
    links:
    - guacd
    networks:
      guacnetwork_compose:
    ports:
    - 8080:8080/tcp
    restart: always
```

## Diving Deeper
* [Guacamole HTML5 Easy Setup](https://www.youtube.com/watch?v=Ti6fQQcGy-Y) | Youtube
* [Guacamole Manual](https://guacamole.apache.org/doc/gug/) | Apache Docs
* [Guacamole on Docker](https://hub.docker.com/r/guacamole/guacamole) | Docker Hub

[Back](/techno/README.md)