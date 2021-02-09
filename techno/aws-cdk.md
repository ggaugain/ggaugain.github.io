[Back](/techno/README.md)

# AWS Cloud Development Kit (AWS CDK)

**Table of contents**
1. [What is AWS CDK?](#what-is-aws-cdk)
2. [Documentation and Resources](#documentation-and-resources)
3. [Alternatives](#alternatives)
4. [Conceptual Diagram](#conceptual-diagram)
5. [Examples](#examples)
6. [Further Reading](#further-reading)

## What is AWS CDK?
AWS Cloud Development Kit (AWS CDK) is a CLI tool and a set of libraries. The CDK libraries let you define your AWS infrastructure by writing code in one of five supported programming languages: Typescript, Javascript, Java, Python and C#. The CDK CLI tool generates then CloudFormation templates from the code you’ve written and provisiones the infrastructure.

AWS presents AWS CDK as the future of IaC developments.
AWS CDK will probably supersede CloudFormation in the next 10-15 years. The tool combines best features of CloudFormation (declarativeness) and scripting (expressive power of modern programming languages).

## Documentation and Resources
* <a href="https://docs.aws.amazon.com/cdk/latest/guide/awscdk.pdf" target="_blank">AWS CDK Developer Guide</a>
* <a href="https://aws.amazon.com/fr/blogs/developer/aws-cdk-developer-preview/" target="_blank">Developer Preview Announcement</a>
* <a href="" target="_blank">API Reference</a>
* <a href="https://github.com/kevinslin/open-cdk" target="_blank">Open CDK Guide</a>
* <a href="https://aws.amazon.com/fr/blogs/developer/" target="_blank">AWS Developer Blogs</a>
* <a href="https://gitter.im/awslabs/aws-cdk" target="_blank">Gitter Channel</a>
* <a href="https://stackoverflow.com/questions/tagged/aws-cdk" target="_blank">Stack Overflow</a>

## Alternatives
We can find different alternatives to AWS CDK with pro/cons but it will mainly depend on whether your cloud provider is supported or not.
* Terraform multi-providers
* Pulumi multi-providers
* Cloudformation only for AWS
* Deployment Manager only for Google Cloud
* IBM Cloud Schematics (Terraform as a Service) usable on IBM Cloud but technically we can use it for other cloud providers
* Puppet, Chef, Ansible, Salt... are multi-providers

## Conceptual Diagram

<img src="/techno/data/aws-cdk/cdk-conceptual-diagram.png" />

## Examples
* <a href="https://cdkworkshop.com/" target="_blank">Create and deploy CDK applications</a>
* <a href="https://docs.aws.amazon.com/code-samples/latest/catalog/welcome.html" target="_blank">AWS Code Sample Catalog</a>
* <a href="https://github.com/aws-samples/aws-cdk-examples" target="_blank">AWS CDK Examples</a>
* <a href="https://github.com/aws/aws-cdk/tree/master/packages/%40aws-cdk" target="_blank">Github aws-cdk</a>
* <a href="https://docs.aws.amazon.com/cloud9/latest/user-guide/sample-cdk.html" target="_blank">AWS CDK Sample for Cloud9</a>

## Further Reading
* AWS Online Tech Talks <a href="https://www.youtube.com/watch?v=ZWCvNFUN-sU" target="_blank">Infrastructure is Code with the AWS CDK</a> | Youtube
* <a href="https://garbe.io/blog/2019/03/26/construct-your-own-cdk-construct-library/" target="_blank">How to Build a CDK Construct Library</a> | by Philipp Garbe
* <a href="https://www.stefreitag.de/wp/2019/03/07/using-aws-cdk-for-code-pipeline-setup/)" target="_blank">Using the CDK for CodePipelines Setup</a> | by Stefan Freitag

[Back](/techno/README.md)

