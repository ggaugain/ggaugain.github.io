[Back](/learn/README.md)

# Infrastructure as Code (IaC)

_wikipedia definition_
>Infrastructure as code (IaC) is the process of managing and provisioning computer [data centers](https://en.wikipedia.org/wiki/Data_center) through machine-readable definition files, rather than physical hardware configuration or interactive configuration tools[[1]](https://en.wikipedia.org/wiki/Infrastructure_as_code#cite_note-AWS_in_Action,_IaC-1). The [IT infrastructure](https://en.wikipedia.org/wiki/IT_infrastructure) managed by this process comprises both physical equipment, such as [bare-metal servers](https://en.wikipedia.org/wiki/Bare-metal_server), as well as [virtual machines](https://en.wikipedia.org/wiki/Virtual_machine), and associated configuration resources. The definitions may be in a [version control system](https://en.wikipedia.org/wiki/Version_control_system). It can use either scripts or declarative definitions, rather than manual processes, but the term is more often used to promote [declarative](https://en.wikipedia.org/wiki/Declarative_programming) approaches.

-----------------
**Table of contents**
1. [From Zero to Hero!](#from-zero-to-hero)
2. [IaC Concepts](#iac-concepts)
3. [Documentation and Resources](#documentation-and-resources)
4. [Examples](#examples)
5. [Blog Posts and Talks](#blog-posts-and-talks)
6. [Video tutorials](#video-tutorials)
7. [Architecture and Advanced Concepts](#architecture-and-advanced-concepts)

## From Zero to Hero!

<table>
   <thead>
       <tr>
           <th style="text-align: center; vertical-align: middle;">Stage 1 / Concepts <br /><img src="/learn/data/learning-path-icon-stage1.png" /></th>
           <th style="text-align: center; vertical-align: middle;">Stage 2 / Foundations <br /><img src="/learn/data/learning-path-icon-stage2.png" /></th>
           <th style="text-align: center; vertical-align: middle;">Stage 3 / Core <br /><img src="/learn/data/learning-path-icon-stage3.png" /></th>
           <th style="text-align: center; vertical-align: middle;">Stage 4 / Deep Dives <br /><img src="/learn/data/learning-path-icon-stage4.png" /></th>
       </tr>
   </thead>

   <tbody>
       <tr>
           <td><a href="#/learn/iac/what-is-an-immutable-infrastructure-server">What is an Immutable Infrastructure or Server?</a></td>
           <td><a href="#/techno/hashicorp-terraform" target="_blank">Introduction to Terraform</a></td>
           <td><a href="#/learn/iac/using-multiple-tools-together">Using Multiple Tools Together</a></td>
           <td></td>
       </tr>
       <tr>
           <td><a href="https://blog.gruntwork.io/why-we-use-terraform-and-not-chef-puppet-ansible-saltstack-or-cloudformation-7989dad2865c?gi=cfad03e3531b" target="_blank">Provisioning vs Configuration Management tools (Blog Gruntwork.io)</a></td>
           <td><a href="#/techno/pulumi" target="_blank">Introduction to Pulumi</a></td>
           <td></td>
           <td></td>
       </tr>
       <tr>
           <td><a href="#/learn/iac/iac-key-benefits">IaC key benefits</a></td>
           <td><a href="#/techno/ansible" target="_blank">Introduction to Ansible</a></td>
           <td></td>
           <td></td>
       </tr>
       <tr>
           <td><a href="#/learn/iac/procedural-vs-declarative">Procedural vs Declarative</a></td>
           <td><a href="#/learn/iac/iac-tools-comparison">IaC Tools comparison</a></td>
           <td></td>
           <td></td>
       </tr>         
       <tr>
           <td></td>
           <td><a href="#/learn/iac/introduction-to-packer">Introduction to Packer</a></td>
           <td></td>
           <td></td>
       </tr>      
   </tbody>
</table>

## IaC Concepts
IT administration teams have historically consisted of a handful of individuals tasked with managing a large footprint of physical and virtual machines.

In the last few years, the term DevOps has emerged out of the convergence of development and operational teams adopting shared tooling. This new engineering specialization brings with it a mindset founded in the security and configuration management needs of the IT administrator while enhancing it with version control and module abstraction common in the software development space.

Often DevOps is linked to **C.A.L.M.S** principles: **C**ulture, **A**utomation, **L**earn, **M**easurement, **S**haring.

Infrastructure as Code (IaC) concepts will allow for exploration and development agility while including the proper management review, thoughtful allocation of resources, and cost control initiatives.

IaC Key benefices [See. dzone.com article](/learn/iac/iac-key-benefits.md):
* on demand infrastructure
* repeatable provisioning
* fully auditable and secure

IaC refers to the tools and processes used to track and manage infrastructure resources as code. This code is commonly stored in a version control system.

<img src="/learn/iac/data/iac-concept.png" width="30%" />

## Documentation and Resources
* <a href="https://cloud.google.com/solutions/infrastructure-as-code#cards" target="_blank">Infrastructure as code (GCP)</a>
* <a href="https://containersonaws.com/introduction/infrastructure-as-code/" target="_blank">Why use infrastructure as code? (AWS)</a>

## Examples
* <a href="#/techno/hashicorp-terraform.md">Introduction to Terraform</a>
* <a href="#/techno/pulumi.md">Introduction to Pulumi</a>
* <a href="#/techno/ansible.md">Introduction to Ansible</a>

## Blog Posts and Talks
* [What GitOps actually is and what it is not](https://medium.com/flant-com/gitops-2a67a5b82884) | by Flant staff

## Video tutorials

## Architecture and Advanced Concepts

[Back](/learn/README.md)