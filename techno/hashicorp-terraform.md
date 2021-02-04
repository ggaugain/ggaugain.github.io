[Back](/techno/README.md)

# HashiCorp Terraform

This page aims to provide general idea of how we can leverage Terraform technology.

-----------------
**Table of contents**
1. [What is Terraform?](#what-is-terraform)
    1. [Terraform concepts](#terraform-concepts)
    2. [Terraform commands](#terraform-commands)
    3. [Terraform workflow](#terraform-workflow)
2. [How do I get started?](#how-do-i-get-started)
3. [Are there any other alternatives?](#are-there-any-other-alternatives)
    1. [Why Terraform and not used cloud providers solutions ?](#why-terraform-and-not-used-cloud-providers-solutions)
5. [Conceptual Diagram](#conceptual-diagram)
6. [Example implementations](#example-implementations)
7. [Further Reading](#further-reading)

## What is Terraform?
[Terraform](https://www.terraform.io/docs/index.html) written in Golang (Go) is an open-source infrastructure as code software tool created by HashiCorp and can be help you to move from ClickOps to DevOps when we want to deploy Cloud services (AWS, Azure, GCP, IBM Cloud, Oracle Cloud, Etc.).

Concretely, this allows you to declare via code what you want for your infrastructure. In structured configuration files we will be able to automatically manage our infrastructure without manual action. Whether it's the initial provisioning, updating or destruction of your infrastructure, it's the code that drives.

The syntax of Terraform configurations is called HashiCorp Configuration Language (HCL). Terraform can also read JSON configurations.
* See. https://www.terraform.io/docs/configuration/index.html

You can used Cloud Development Kit (CDK) for Terraform ; This will allow you to work with languages ​​like Python or TypeScript
* https://www.hashicorp.com/blog/cdk-for-terraform-enabling-python-and-typescript-support

### Terraform concepts
**Modules**
Modules in Terraform are self-contained packages of Terraform configurations that are managed as a group.

<img src="/techno/data/hashicorp-terraform/terraform-modules.png" />

See. https://www.terraform.io/docs/configuration/blocks/modules/index.html

**Variables and Outputs**

The Terraform language includes a few kinds of blocks for requesting or publishing named values.

<img src="/techno/data/hashicorp-terraform/terraform-gcp-example-variables.png" />

<img src="/techno/data/hashicorp-terraform/terraform-gcp-example-output.png" />

See. https://www.terraform.io/docs/configuration/blocks/values/index.html

**States and Backends**

Terraform keeps state of managed infrastructure and configuration in "terraform.tfstate".
* https://www.terraform.io/docs/state
* https://www.terraform.io/docs/backends

<img src="/techno/data/hashicorp-terraform/terraform-backend.png" />

> Backends are completely optional. You can successfully use Terraform without ever having to learn or use backends. However, they do solve pain points that afflict teams at a certain scale. If you're an individual, you can likely get away with never using backends.

**Data sources**
Data sources allow data to be fetched or computed for use elsewhere in Terraform configuration.
* https://www.terraform.io/docs/configuration/data-sources.html

**Providers**
Terraform relies on plugins called "providers" to interact with remote systems.
* https://www.terraform.io/docs/configuration/blocks/providers/index.html
* A full list of providers can be found [here](https://registry.terraform.io/browse/providers).

**Provisioners**
Provisioners can be used to model specific actions on the local machine or on a remote machine in order to prepare servers or other infrastructure objects for service.
* https://www.terraform.io/docs/provisioners/index.html

<img src="/techno/data/hashicorp-terraform/terraform-provisioners.png" />

**Conditional Expressions**
The condition can be any expression that resolves to a boolean value.
* https://www.terraform.io/docs/configuration/expressions/conditionals.html

**Functions**
The Terraform language includes a number of built-in functions that you can call from within expressions to transform and combine values
* https://www.terraform.io/docs/configuration/functions.html

<img src="/techno/data/hashicorp-terraform/terraform-functions.png" />

### Terraform commands
```
Usage: terraform [global options] <subcommand> [args]
 
The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.
 
Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure
 
All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management
 
Global options (use these before the subcommand, if any):
  -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.
```

_source: https://www.terraform.io/docs/commands/index.html_

### Terraform workflow
The Terraform build process is shown below, the others main command are optional.
**Terraform init**
* Initialize a new or existing Terraform environment by creating initial files, loading any remote state, downloading modules, etc.
**Terraform plan**
* Generates an excution plan for Terraform
**Terraform apply**
* Builds or changes infrastructure according to Terraform configuration files

## How do I get started?
The terraform learn website has a good getting started tutorial here: https://learn.hashicorp.com/terraform
The reference documentation is also good: https://www.terraform.io/docs/

## Are there any other alternatives?
We can find different alternatives to Terraform with pro/cons but it will mainly depend on whether your cloud provider is supported or not.
* Pulumi multi-providers
* Cloudformation only for AWS
* Deployment Manager only for Google Cloud
* IBM Cloud Schematics (Terraform as a Service) usable on IBM Cloud but technically we can use it for other cloud providers
* Puppet, Chef, Ansible, Salt... are multi-providers

> A comparison between different solutions is available here: <a href="#learn/iac/iac-tools-comparison" target="blank">IaC Tools comparison</a>

### Why Terraform and not used cloud providers solutions ?
* Terraform supports 250+ providers
* Has easier syntax (HCL)
* Has native support for modules and remote states
* Has teamwork related features,
* Is an open-source project
* Supports 2 levels of transformation (Modernize for Cloud / Migrate to Cloud)
* Separates planning from execution (dry-run)
* Manages anything with an API

## Conceptual Diagram

<img src="/techno/data/hashicorp-terraform/terraform-workflow.png" />

## Example implementations
There are many possibilities with Terraform, below a very simple example to create a storage bucket on Google Cloud with Terraform Cloud

[Terraform Cloud](https://www.terraform.io/docs/cloud/) is an application that helps teams use Terraform together and is available as a hosted service at https://app.terraform.io.

It's verry interresting because you can use free accounts for your tests (no credit card is need!) and we do not need to install terraform on your laptop.

In this example there are four files you can use it for your own tests
* <a href="https://raw.githubusercontent.com/ggaugain/ggaugain.github.io/main/techno/lab/hashicorp-terraform/terraform-intro-main.tf" target="_blank">main.tf</a>: provider and backend declaration
* <a href="https://raw.githubusercontent.com/ggaugain/ggaugain.github.io/main/techno/lab/hashicorp-terraform/terraform-intro-storage-bucket.tf" target="_blank">storage-bucket.tf</a>: declaration of resources for the creation of the bucket
* <a href="https://raw.githubusercontent.com/ggaugain/ggaugain.github.io/main/techno/lab/hashicorp-terraform/terraform-intro-variables.tf" target="_blank">variables.tf</a>: variables parameters for Terraform
* <a href="https://raw.githubusercontent.com/ggaugain/ggaugain.github.io/main/techno/lab/hashicorp-terraform/terraform-intro-outputs.tf" target="_blank">outputs.tf</a>: output values of ressources created (information are stored into tfstate file and terraform console)

## Further Reading
* [Using Terraform with Google Cloud](https://cloud.google.com/docs/terraform)
* [Getting started with IBM Cloud Provider plug-in for Terraform](https://cloud.ibm.com/docs/terraform?topic=terraform-getting-started)
* [Terraform: Beyond the Basics with AWS](https://aws.amazon.com/blogs/apn/terraform-beyond-the-basics-with-aws/)
* [Immutable Infrastructure Using Packer, Ansible, and Terraform](https://itnext.io/immutable-infrastructure-using-packer-ansible-and-terraform-7ca6f79582b8)

[Back](/techno/README.md)