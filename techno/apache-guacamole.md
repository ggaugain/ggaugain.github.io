<img src="/techno/data/apache-guacamole/guacamole-logo.png" align="right" width="20%" />

[Back](/techno/README.md)

# Apache Guacamole

**Table of contents**
1. [What is Apache Guacamole?](#what-is-apache-guacamole)
2. [Alternatives](#alternatives)
2. [Conceptual Diagram](#conceptual-diagram)
3. [Build from scratch](#build-from-scratch)
4. [Diving Deeper](#diving-deeper)

## What is  Apache Guacamole?**
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

## Build from scratch
Lab install Apache Guacamole on RHEL step by step

```
# Enable the EPEL Repository on RHEL 8 Linux
sudo yum install epel-release -y
sudo yum update -y

# Install "Development Tools"
sudo yum group install "Development Tools" -y

# Install Git
sudo yum install git -y

# Installing Apache Tomcat
sudo yum -y install tomcat
sudo yum -y install tomcat-webapps tomcat-admin-webapps 
sudo systemctl enable tomcat
sudo systemctl start tomcat

# Installing Apache Guacamole & dependencies 
## required-dependencies
sudo yum install cairo-devel -y
sudo yum install libjpeg-turbo-devel -y
sudo yum install libjpeg-devel -y
sudo yum install libpng-devel -y
sudo yum install uuid -y

## Optional dependencies
sudo yum install freerdp -y
sudo yum install pango-devel -y
sudo yum install libssh2 -y
sudo yum install libvncserver -y
sudo yum install pulseaudio-libs-devel -y
sudo yum install openssl-devel -y
sudo yum install libvorbis -y
sudo yum install libwebp-devel -y

## Build: guacamole-server
cd ~
git clone https://github.com/apache/guacamole-server.git
cd guacamole-server/
autoreconf -fi
./configure --with-init-dir=/etc/init.d
sudo make
sudo make install

# Deploying Guacamole
cd cd ~
git clone http://github.com/apache/guacamole-client.git
cd guacamole-client
mvn package
sudo cp ~/guacamole-client/guacamole/target/guacamole-1.1.0.war /var/lib/tomcat/webapps/guacamole.war
sudo systemctl restart tomcat

# Starting guacd
sudo /etc/init.d/guacd start
```

## Diving Deeper
* [Guacamole HTML5 Easy Setup](https://www.youtube.com/watch?v=Ti6fQQcGy-Y) | Youtube
* [Guacamole Manual](https://guacamole.apache.org/doc/gug/) | Apache Docs
* [Guacamole on Docker](https://hub.docker.com/r/guacamole/guacamole) | Docker Hub

[Back](/techno/README.md)