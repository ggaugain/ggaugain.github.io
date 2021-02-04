# IaC Tools comparison

The different solutions allowing to do IaC on a Cloud providers hold a lot of similarities, but they differ in a few key ways.

This page helps provide a rundown of the differences.

## Key Differences between solutions

| Item | Terraform | Pulumi | Ansible |
| ------ | ------ | ------ | ------ |
| **Publisher / Developer** | HashiCorp | Pulumi | Red Hat |
| **Released** | 2014 | 2019 | 2012 |
| **Type** | Provisioning | Provisioning | Configuration Management |
| **Infrastructure** | Immutable | Immutable | Mutable |
| **Approach** | Declarative | Declarative | Procedural |
| **Cloud Providers supports** | A full list of providers can be found [here](https://registry.terraform.io/browse/providers). | A full list of providers can be found [here](https://www.pulumi.com/docs/intro/cloud-providers/). | Ansible’s library of cloud can be found [here](https://www.ansible.com/integrations/cloud). |
| **Source** | Open | Open | Open |
| **Agent** | No | No | No |
| **Supported Language** | HCL, [cdktf](https://learn.hashicorp.com/tutorials/terraform/cdktf) | - Node.js - including JavaScript, TypeScript or any other Node.js compatible language <br /> - Python <br /> - .NET Core, including C# and Visual Basic <br /> - Go | - Python <br /> - PowerShell <br /> - Shell <br /> - Ruby |
| **Main advantage** | Pure declarative IaC tool, works with all major cloud providers, lets you create infrastructure building blocks | Code in a familiar programming language, great out-of-the-box GUI | Ansible can seamlessly provision cloud platforms, servers, hosts, and hypervisors. It is considered to be the best tool for processing pipelines. <br /> After executing bootstrapping, Ansible enables teams to connect nodes either to a load balancer, storage, operational tasks, or security. Moreover, Ansible provisioning helps users employ the universal automation language consistently across orchestration, application deployment, and configuration management. |
| **Main disadvantage** | HCL limits coding freedom and needs to be mastered to use advanced features except if you work with [cdktf](https://learn.hashicorp.com/tutorials/terraform/cdktf) | Documentation lacking in places | Not native IaC tool; With Ansible, uou need to dictate each step to achieve the end result. |
| **State files management** | State files are by default stored on a local hard drive. | State files are stored via SaaS Apps | The are no state files; Ansible maintains all components in working condition and repairs an issue instead of replacing the entire infrastructure. |
| **Community** | Large | Mid-size | Huge |
| **Documentation** | Excellent official documentation | Limited, with best resources found on Pulumi Slack and GitHub | Excellent official documentation |
| **Testing** | Must be performed via third-party tools or if you used [cdktf](https://learn.hashicorp.com/tutorials/terraform/cdktf) you can test with any framework that supports the used programming language. | Test with any framework that supports the used programming language. | Must be performed via third-party tools |
| **More information** | [Terraform doc](https://www.terraform.io/docs/) | [Pulumi doc](https://www.pulumi.com/docs/) | [Ansible doc](https://docs.ansible.com/) |
