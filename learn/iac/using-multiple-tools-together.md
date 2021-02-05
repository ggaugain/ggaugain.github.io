[Back](/learn/iac/README.md)

# Using Multiple Tools Together

Although I've been comparing IAC tools, the reality is that you will likely need to use multiple tools to build your infrastructure.

Here are three common combinations I've seen work well at a number of companies.
1. [Provisioning plus configuration management](#provisioning-plus-configuration-management)
2. [Provisioning plus server templating](#provisioning-plus-server-templating)
3. [Provisioning plus server templating plus orchestration](#provisioning-plus-templating-plus-orchestration)

## Provisioning plus configuration management
Example: Terraform and Ansible. You use Terraform to deploy all underlying infrastructure, including the network topology (like. VPCs, subnets, route tables), data stores (eg. MySQL, Redis), load balancers, and server. You then use Ansible to deploy your apps on top of those servers.
 


## Provisioning plus server templating



## Provisioning plus server templating plus orchestration


[Back](/learn/iac/README.md)