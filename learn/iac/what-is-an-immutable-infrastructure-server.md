[Back](/learn/iac/README.md)

**Table of contents**
1. [What is an Immutable Infrastructure?](#what-is-an-immutable-infrastructure)
2. [What is an Immutable Server?](#what-is-an-immutable-server)

-----------------

# What is an Immutable Infrastructure?

In a traditional mutable server infrastructure, servers are continually updated and modified in place.

Engineers and administrators working with this kind of infrastructure can SSH into their servers, upgrade or downgrade packages manually, tweak configuration files on a server-by-server basis, and deploy new code directly onto existing servers.


An immutable infrastructure is another infrastructure paradigm in which servers are never modified after they’re deployed. If something needs to be updated, fixed, or modified in any way, new servers built from a common image with the appropriate changes are provisioned to replace the old ones. After they’re validated, they’re put into use and the old ones are decommissioned.

More information here:
* [What is Mutable vs. Immutable Infrastructure?](https://www.hashicorp.com/resources/what-is-mutable-vs-immutable-infrastructure) | from: Hashicorp
* [Immutable infrastructure vs. mutable infrastructure](https://www.ibm.com/cloud/learn/infrastructure-as-code#toc-immutable--RxgHAJ5m) | from: IBM

<img src="/learn/iac/data/immutable-infrastructure-vs-mutable-infrastructure.png" />


# What is an Immutable Server?

An immutable server doesn’t accept any change once it is launched and provisioned. Which means you can’t update your code or deploy new files to rollout an update for your application. To rollout an update, new servers group with the updated code will be created while destroying the old ones. This way, it becomes easier to auto scale your application with one true source (an AWS AMI) to launch new instances to meet your workload.

No patching! No manual changes! Always Rebuild!

<img src="/learn/iac/data/immutable-server.png" />

[Back](/learn/iac/README.md)