[Back](/techno/README.md)

# Hashicorp Packer

This page aims to provide general idea of how we can leverage Packer technology.

-----------------
**Table of contents**
1. [What is Packer?](#what-is-packer)
2. [Builders and Provisioners](#builders-and-provisioners)
3. [How do I get started?](#how-do-i-get-started)
4. [What problems does using Packer solve?](#what-problems-does-using-packer-solve)
5. [Packer workflow](#packer-workflow)
6. [Anything else to be aware of?](#anything-else-to-be-aware-of)
8. [Are there any other alternatives?](#are-there-any-other-alternatives)
9. [Conceptual Diagram](#conceptual-diagram)
10. [Example implementations](#example-implementations)
11. [Further Reading](#further-reading)

## What is Packer?
[Packer](https://www.packer.io/) is an automated build system to manage the creation of images for containers and virtual machines developed by [Hashicorp](https://www.hashicorp.com/). It outputs an image that you can then take and run on the platform you require.

Packer is controlled with a declarative configuration in JSON format.

Packer is also one of the first use cases you will find when working with AMIs on AWS.

Packer builds Docker containers without the use of Dockerfiles. By not using Dockerfiles, Packer is able to provision containers with portable scripts or configuration management systems that are not tied to Docker in any way.

You provision containers much the same way you provision a normal virtualized or dedicated server.

## Builders and Provisioners
**Builders**
Builders are the part of packer responsible for creating the image, they interact with their relevant tools (Amazon EC2, VMWare, etc) in order to set up a build environment for the provisioners to interact with and to output the resulting image. A list of builders can be found [here](https://www.packer.io/docs/builders/), builders are plugins so more can be added.

**Provisioners**
Provisioners are responsible for taking the base image and adding whatever configuration you require to that image in order to create your own custom image. They take the form of things like shell scripts, ansible playbooks, files to be copied, etc. A list of provisioners can be found [here](https://www.packer.io/docs/provisioners/).

## How do I get started?
Know that when people talk about creating images with packer, they often refer to it as image "baking".
* The packer website has a good getting started tutorial here: https://learn.hashicorp.com/packer
* The reference documentation is also good: https://www.packer.io/docs

## What problems does using Packer solve?
**Repeatability**
Rather than having a manual process to create OS images packer allows you to have the configuration of your images in code (which can be version controlled, peer reviewed, etc) which makes it much more likely that the image produced will be the same each time the image creation process is carried out.

**Bootstrapping Errors**
When you have automatically scaling infrastructure (such as [autoscaling](https://aws.amazon.com/autoscaling/) groups in AWS) you will likely have some kind of bootstrapping process (user data scripts, cfn init, etc.) that takes a base image and installs packages, starts services, adds configurations files, etc. When this runs there is a chance that an error will be encountered either with the bootstrap logic, something in the environment changing (latest version of package X), or some failure in a dependancy of the bootstrap process (package repositories). If such an error occurs it is likely that new instances will not come up successfully, which will mean you will not be able to scale out and in the worst case that you will end up with no healthy instances.

With packer you can help avoid this, as your bootstrapping occurs when you run packer (ideally as a CI/CD process when you check in your new packer config to version control) you can catch any errors before you deploy the new image to your autoscaling group.

**Provision time**
As stated above, when you create a new instance (either in an autoscaling group or through some other process) there is usually some bootstrapping process that takes place. This takes some time, with Packer you can have all or some of your bootstrapping process done at image creation time, reducing the time taken to provision instances.

## Packer workflow
The Packer build process is shown below

<img src="/techno/data/hashicorp-packer/packer-workflow.png" />

## Anything else to be aware of?
**Permissions**
If you are running packer in your CI/CD tool witin a cloud environment you will need to give it quite expansive permissions ([example with IAM policy AWS](https://www.packer.io/docs/builders/amazon.html#iam-task-or-instance-role)) in order for it to operate successfully.

**Image management**
Use of packer can lead to many images being created which will need some kind of lifecycle to be properly managed (think costs and account limits).

**SSH access**
When packer builds an AMI in AWS it uses SSH to connect to the the instance it uses to build the image. By default it attaches a security group that allows port 22 to be accessed from anywhere (0.0.0.0/0). This can be solved by setting a [security group in the packer configuration](https://www.packer.io/docs/builders/amazon-ebs.html#security_group_id).

## Are there any other alternatives?
* Aminator (https://github.com/Netflix/aminator)
* LinuxKit (https://github.com/linuxkit/linuxkit)

## Conceptual Diagram
From Immutable Server to Immutable Infrastructure

<img src="/techno/data/hashicorp-packer/packer-conceptual-diagram.png" />

## Example implementations

There are many possibilities with Packer, below a very simple example to create AWS AMI

File: build.json
```
{
  "variables": {
     "aws_access_key": "{{env `aws_access_key`}}",
     "aws_secret_key": "{{env `aws_secret_key`}}",
},   
 
"builders": [{
    "type": "amazon-ebs",
    "access_key": "{{user `aws_access_key`}}",
    "secret_key": "{{user `aws_secret_key`}}",
    "region": "eu-west-3",
    "source_ami": "ami-0ebc281c20e89ba4b",
    "instance_type": "t2.micro",
    "ssh_username": "ec2-user",
    "ami_name": "packer-example apache {{timestamp}}"
   }],
 
  "provisioners": [
    {  
      "type": "shell",
      "inline": [
          "sleep 30",
          "sudo apt-get update",
          "sudo apt-get -y upgrade",
          "sudo apt-get install -y apache2 php5 libapache2-mod-php5 php5-curl php5-mysql"
      ]  
    }  
  ]
}
```

To validate the syntax and parameters of our file, on can use the **packer validate build.json** command.

Once the validation is done, we can make our command to create our AMI with **packer build build.json**.

Once our "packer build" has been executed we will find our AMI in EC2:

<img src="/techno/data/hashicorp-packer/packer-ec2.png" width="50%" />

From this image we can then launch one or more instances depending on our architecture, which makes it easy to create an application system image.

## Further Reading
* [github Packer](https://github.com/hashicorp/packer)
* [Infrastructure-As-Code with HashiCorp Packer, VMware and VMware Cloud on AWS](https://cloud.vmware.com/community/2019/11/12/infrastructure-code-hashicorp-packer-vmware-vmware-cloud-aws/)
* [Immutable Infrastructure Using Packer, Ansible, and Terraform](https://itnext.io/immutable-infrastructure-using-packer-ansible-and-terraform-7ca6f79582b8)
* [Virtualize Your Windows Development Environments with Vagrant, Packer, and Chocolatey](https://www.developer.com/net/virtualize-your-windows-development-environments-with-vagrant-packer-and-chocolatey-part-1.html)

[Back](/techno/README.md)