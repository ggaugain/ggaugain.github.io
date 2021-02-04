[Back](/techno/README.md)

# Introduction to Pulumi

This page aims to provide general idea of how we can leverage Pulumi technology.

-----------------
**Table of contents**
1. [What is Pulumi?](#what-is-pulumi)
2. [Pulumi concepts](#pulumi-concepts)
3. [Pulumi commands](#pulumi-commands)
4. [How do I get started?](#how-do-i-get-started)
5. [Are there any other alternatives?](#are-there-any-other-alternatives)
6. [Conceptual Diagram](#conceptual-diagram)
7. [Example implementations](#example-implementations)
8. [Further Reading](#further-reading)

## What is Pulumi?
[Pulumi](https://www.pulumi.com/) is open source infrastructure as code SDK enables you to create, deploy, and manage infrastructure on any supported [Pulumi cloud providers](https://www.pulumi.com/docs/intro/cloud-providers/).

Pulumi is used to create traditional infrastructure elements such as virtual machines, networks, and databases. The tool is also used for designing modern cloud components, including containers, clusters, and serverless functions.

The significant feature that differentiates Pulumi from something like Terraform is that it allows you to write your Infrastructure as Code in real programming languages. With something like Terraform or ARM Templates your writing you templates using a domain-specific language (DSL) explicitly created for that tool, HCL for Terraform or the JSON based language for ARM. These DSL’s provide a limited set of language features. It should be noted that Terraform included mid-2020 a [Cloud Development Kit (cdktf)](https://www.hashicorp.com/blog/cdk-for-terraform-enabling-python-and-typescript-support) with more languages supports.

Pulumi does not have a DSL; instead, it allows you to use an existing program language that you are already familiar with.

Currently, Pulumi supports:
* Node.js - including JavaScript, TypeScript or any other Node.js compatible language
* Python
* .NET Core, including C# and Visual Basic
* Go

## Pulumi concepts
_doc: https://www.pulumi.com/docs/intro/concepts/_

* Projects: Pulumi's way of organizing your infrastructure as code projects.
* Stacks: a stack is an isolated, independently configurable instance of a Pulumi program.
* State: is stored in the Pulumi Service Backend
* Service Backend options
    * app.pulumi.com
    * Self-managed backend
    * on-premise app.pulumi.com (Enterprise version only)
* Pulumi is language agnostic to support multiple programming languages at the same time
    * example with Typescript:

<img src="/techno/data/pulumi/pulumi_concept_001.png" width="40%" /> <img src="/techno/data/pulumi/pulumi_concept_002.png" width="40%" />

## Pulumi commands
```
The most common commands in the CLI that you’ll be using are as follows:
 
    pulumi new: creates a new project using a template
    pulumi stack: manage your stacks (at least one is required to perform an update)
    pulumi config: configure variables such as keys, regions, and so on
    pulumi up: preview and deploy changes to your program and/or infrastructure
    pulumi preview: preview your changes explicitly before deploying
    pulumi destroy: destroy your program and its infrastructure when you’re done
```
_source: https://www.pulumi.com/docs/reference/cli/#common-commands_

## How do I get started?
The Pulumi website has a good getting started tutorial here: https://www.pulumi.com/docs/get-started/

## Are there any other alternatives?
We can find different alternatives to Pulumi with pro/cons but it will mainly depend on whether your cloud provider is supported or not.
* Terraform or Terraform Cloud are Cloud multi-providers
* Cloudformation only for AWS
* Deployment Manager only for Google Cloud
* IBM Cloud Schematics (Terraform as a Service) usable on IBM Cloud but technically we can use it for other cloud providers
* Puppet, Chef, Ansible, Salt... are multi-providers

A comparison between different solutions is available here: <a href="#learn/iac/iac-tools-comparison" target="blank">IaC Tools comparison</a>

## Conceptual Diagram

<img src="/techno/data/pulumi/pulumi-conceptual-diagram.png" />

## Example implementations
There are many possibilities with Pulumi, 160+ Examples of Infrastructure, Containers, Serverless, and Kubernetes
* https://github.com/pulumi/examples

## Further Reading
* [Steering Kubernetes on DigitalOcean With Pulumi](https://www.digitalocean.com/community/tech_talks/steering-kubernetes-on-digitalocean-with-pulumi)
* [Deploying your first micro-service in AWS using Pulumi](https://medium.com/globant/deploying-your-first-micro-service-in-aws-using-pulumi-4fbbf68150e6)
* <img src="/techno/data/flag_fr.png" /> [Pulumi - Stocker l'état de votre infrastructure dans un Azure Storage](https://woivre.fr/blog/2020/02/pulumi-stocker-letat-de-votre-infrastructure-dans-un-azure-storage)

[Back](/techno/README.md)