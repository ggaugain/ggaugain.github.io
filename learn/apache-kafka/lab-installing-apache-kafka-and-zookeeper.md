[Back](/learn/apache-kafka/README.md)

# Lab: Installing Apache Kafka and Zookeeper

**Objectives**
This is an example to deployed Apache Kafka and Zookeeper for a demo or lab platforms.
* Kafka Architecture: Topics, Producers and Consumers.
* Kafka uses ZooKeeper to manage the cluster.
* ZooKeeper is used to coordinate the brokers/cluster topology.

<table>
   <tr>
       <th>Kafka in a Container</th>
       <td>Steps:<br />- Install Docker and Docker-compose <br /> - Run the setup script (docker-compose.yml) <br /> - Create a demo topic</td>
   </tr>
   <tr>
       <th>Installing Kafka using Binaries</th>
       <td>Steps: <br /> - Download the Binaries <br /> - Configure Zookeeper and Kafka <br /> - Create a demo topic <br /> - Demo cluster resilience</td>
   </tr>
</table>

-----------------
**Table of contents**
1. [Installing Kafka and Zookeeper using Containers](#installing-kafka-and-zookeeper-using-containers)
    1. [Step 1: Install Docker and Docker-compose](#step-1-install-docker-and-docker-compose)
    2. [Step 2: Build zookeeper and kafka on docker-compose](#step-2-build-zookeeper-and-kafka-on-docker-compose)
    3. [Step 3: Create a demo topic](#step-3-create-a-demo-topic)
2. [Installing Kafka and Zookeeper using Binaries](#installing-kafka-and-zookeeper-using-binaries)
    1. [Requirements](#requirements)
    2. [Step 1: Install Zookeeper and Kafka as a service](#step-1-install-zookeeper-and-kafka-as-a-service)
    3. [Step 2: Configure kafka and zookeeper](#step-2-configure-kafka-and-zookeeper)
    4. [Step 3: Create demo Topic in New Kafka Cluster](#step-3-create-demo-topic-in-new-kafka-cluster)
    5. [Step 4: Demo cluster resilience](#step-4-demo-cluster-resilience)

## Installing Kafka and Zookeeper using Containers
Kafka can be installed using a container, which provides an easy way to get up and running with Kafka, without having to install packages and prerequisites. <br /> We will run one command and the Kafka cluster will be up and running quickly.

<img src="/learn/apache-kafka/data/kafka-lab-container_001.png" width="20%" />

### Step 1: Install Docker and Docker-compose
**Install Docker**
_Distribution used for lab: Ubuntu 16.04 Xenial LTS_

```
# Add Docker to Your Package Repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \ 
    $(lsb_release -cs) \ 
    stable"
 
# Update Packages and Install Docker 
sudo apt update
 
sudo apt install -y docker-ce=18.06.1~ce~3-0~ubuntu
 
sudo docker version
 
# Add Your User to the Docker Group
sudo usermod -a -G docker <user name>
 
logout
```

_Result: after new logon_ <br />
<img src="/learn/apache-kafka/data/kafka-lab-container_002.png" width="30%" />


**Install Docker Compose**
_Distribution used for lab: Ubuntu 16.04 Xenial LTS_

```
sudo -i
 
curl -L https://github.com/docker/compose/releases/download/124.0/docker-compose-`uname -m`-o /usr/local/bin/docker-compose
 
chmod +x /usr/local/bin/docker-compose
 
exit
```

_Result:_ <br />
<img src="/learn/apache-kafka/data/kafka-lab-container_003.png" width="30%" />

### Step 2: Build zookeeper and kafka on docker-compose
Copy this <a href="https://raw.githubusercontent.com/ggaugain/ggaugain.github.io/main/learn/apache-kafka/lab/lab1-docker-compose.yml" target="_blank">docker-compose.yml</a> example.

_Deployment result:_ <br />
<img src="/learn/apache-kafka/data/kafka-lab-container_004.png" width="80%" />

### Step 3: Create a demo topic
**Install Java**
```
sudo apt install -y default-jdk
```

**Get the Kafka Binaries**
```
wget http://mirror.cogentco.com/pub/apache/kafka/2.2.0/kafka_2.12-2.2.0.tgz
 
tar -xvf kafka_2.12-2.2.0.tgz
```

**Create Demo Topic**
```
./bin/kafka-topics.sh --zookeeper localhost:2181 --create --topic demo --partitions 3 --replication-factor 1
```

**Describe the Topic**
```
./bin/kafka-topics.sh --zookeeper localhost:2181 --topic demo --describe
```

_Demo result:_ <br />
<img src="/learn/apache-kafka/data/kafka-lab-container_005.png" />

## Installing Kafka and Zookeeper using Binaries
An alternative to installing Kafka and Zookeeper in containers is installing the binaries on each individual server. This process takes a lot longer to configure, but is a more robust and decoupled version of Kafka. <br />
Kafka and Zookeeper are independent of each other. They can operate on different VMs, but on this example, we'll be installing them together using their binaries, installing them on three different cloud servers.
This will allow for high-availability and fault-tolerance.

<img src="/learn/apache-kafka/data/kafka-lab-instance_001.png" width="30%" />

### Requirements
Deployed three identical cloud instance.

In your example we will used the distribution Ubuntu 16.04 Xenial LTS.

### Step 1: Install Zookeeper and Kafka as a service
```
# Download the Binaries, and Change the Name of the Directory
wget http://mirror.cogentco.com/pub/apache/kafka/2.2.0/kafka_2.12-2.2.0.tgz
 
tar -xvf kafka_2.12-2.2.0.tgzmv kafka_2.12-2.2.0 kafkacd kafka
 
# Install Java
sudo apt install -y default-jdk
 
java -version
 
# Disable RAM Swap
swapoff -a
 
sudo sed -i '/ swap / s/^/#/' /etc/fstab
 
# Create the Zookeeper Service File
sudo nano /etc/init.d/zookeeper
 
# Insert the Following contents of the /etc/init.d/zookeeper File
# Modify <PATH> value by your application PATH (ex: ~/kafka)
 
# Change the File's Permissions and Start the Service
sudo chmod +x /etc/init.d/zookeeper
sudo chown root:root /etc/init.d/zookeeper
 
sudo update-rc.d zookeeper default
 
ssudo service zookeeper start
sudo service zookeeper status
 
# Create the Kafka Service File
sudo nano /etc/init.d/kafka
 
# Insert the Following contents of the /etc/init.d/kafka File
# Modify <PATH> value by your application PATH (ex: ~/kafka)
 
# Change the Properties of the File and Start the Service
sudo chmod +x /etc/init.d/kafka
 
sudo chown root:root /etc/init.d/kafka
 
sudo update-rc.d kafka defaults
 
sudo service kafka start
sudo service kafka status
```

_Result for zookeeper service:_ <br />
<img src="/learn/apache-kafka/data/kafka-lab-instance_002.png" width="80%" />

_Result for kafka service:_ <br />
<img src="/learn/apache-kafka/data/kafka-lab-instance_003.png" width="80%" />

**Contents files zookeeper & kafka**
_Update Path/home/cloud_user if needed_
* Contents of the <a href="https://raw.githubusercontent.com/ggaugain/ggaugain.github.io/main/learn/apache-kafka/lab/lab2-zookeeper" target="_blank">/etc/init.d/zookeeper</a> file
* Contents of the <a href="https://raw.githubusercontent.com/ggaugain/ggaugain.github.io/main/learn/apache-kafka/lab/lab2-kafka" target="_blank">/etc/init.d/kafka</a> file

### Step 2: Configure kafka and zookeeper
_Update Path/home/cloud_user if needed_

```
# Stop the kafka and zookeeper Services on Each Server
sudo service zookeeper stop
sudo service kafka stop
 
# Create the logs Directory for the Kafka Service
sudo mkdir -p /data/kafka
 
sudo chown -R cloud_user:cloud_user /data/kafka
 
# Create the server.properties File
cd /home/cloud_user/kafka/
rm config/server.properties
 
nano config/server.properties
# Add the Following Contents to the server.properties File
 
sudo nano /etc/hosts
# Add the Following to /etc/hosts
# replace [serverY_private_ip] by the @IP of instances
[server1_private_ip]  kafka1
[server1_private_ip]  zookeeper1
[server2_private_ip]  kafka2
[server2_private_ip]  zookeeper2
[server3_private_ip]  kafka3
[server3_private_ip]  zookeeper3
 
# Create the logs Directory and myid File for the Zookeeper Service on each servers
sudo mkdir -p /data/zookeeper
sudo chown -R cloud_user:cloud_user /data/zookeeper
# only in Server 1
echo "1" > /data/zookeeper/myid
# only in Server 2
echo "2" > /data/zookeeper/myid
# only in Server 3
echo "3" > /data/zookeeper/myid
 
# Create the zookeeper.properties File
rm /home/cloud_user/kafka/config/zookeeper.properties
nano /home/cloud_user/kafka/config/zookeeper.properties
# Add the Following Contents to the zookeeper.propertie File
 
# Start the Zookeeper and Kafka Services on Each Server and check status
sudo service zookeeper start
sudo service kafka start
sudo service zookeeper status
sudo service kafka status
 
# Reboot 3 servers
sudo reboot
```

**Contents files server & zookeeper**
_Modify [broker_number] and [hostname] by your configuration_

* Contents of the <a href="https://raw.githubusercontent.com/ggaugain/ggaugain.github.io/main/learn/apache-kafka/lab/lab2-server.properties" target="_blank">server.properties</a> file
* Contents of the <a href="https://raw.githubusercontent.com/ggaugain/ggaugain.github.io/main/learn/apache-kafka/lab/lab2-zookeeper.properties" target="_blank">zookeeper.properties</a> file

### Step 3: Create demo Topic in New Kafka Cluster
```
./bin/kafka-topics.sh --zookeeper zookeeper3:2181/kafka --create --topic demo1 --partitions 3 --replication-factor 1
 
./bin/kafka-topics.sh --zookeeper zookeeper3:2181/kafka --topic demo1 --describe
```

_Demo result:_ <br />
<img src="/learn/apache-kafka/data/kafka-lab-instance_004.png" width="80%" />

### Step 4: Demo cluster resilience
The objective of this demo is to send messages in the #producer and then recover them in the #consumer.

Stopping Kafka services on the servers will show that with a 3 node cluster we have a fault tolerance of 1 server for #producer and 2 nodes for #consumer.

<img src="/learn/apache-kafka/data/kafka-lab-instance_005.png" width="80%" />

```
# create random data file
cd ~/kafka
 
base64 /dev/urandom | head -c 10000 | egrep -ao "\w" | tr -d '\n' > randomdatafile.txt
 
# ingest data in the #producer
./bin/kafka-producer-perf-test.sh --topic demo1 --num-records 10000 --throughput 10 --payload-file randomdatafile.txt --producer-props acks=1 bootstrap.servers=kafka1:9092,kafka2:9092,kafka3:9092 --payload-delimiter A
 
# consume message in the #consumer
./bin/kafka-console-consumer.sh --bootstrap-server kafka1:9092 --topic demo1
 
# Stop the kafka service on each broker and watch the result on the #producer and #consumer
sudo service kafka stop
```

[Back](/learn/apache-kafka/README.md)