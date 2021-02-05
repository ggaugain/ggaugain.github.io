[Back](/techno/README.md)

# HashiCorp Vault

**Table of contents**
1. [Introduction](#introduction)
    1. [What is HashiCorp Vault?](#what-is-hashicorp-vault)
    2. [Secret management](#secret-management)
    3. [Identity based access](#identity-based-access)
    4. [Data encryption](#data-encryption)
2. [Conceptual Diagram](#conceptual-diagram)
3. [Example implementations](#example-implementations)
    1. [Kubernetes and static secrets](#kubernetes-and-static-secrets)
    2. [Kubernetes and Dynamic Secrets](#kubernetes-and-dynamic-secrets)
4. [Further Reading](#further-reading)

## Introduction
### What is HashiCorp Vault?
HashiCorp Vault is designed to help organizations manage access to secrets and transmit them safely within an organization.

Secrets could be in the form of passwords, API keys, SSH keys, RSA tokens, or OTP.

HashiCorp Vault can be used in different ways:
* Secret management
* Identity-based access
* Data encryption

### Secret management
HashiCorp Vault can be used to store any type of secrets, including sensitive environment variables, database credentials, API keys, and more, giving users control over who has access and who does not. Using Vault allows you to take full control of any sensitive credentials with the ability to rotate and revoke access at any time. <br />
The diagram below presents several levels of maturity regarding the storage or management of a secret.
The "Roof TOP" approach is strongly recommended.<br />

<img src="/techno/data/hashicorp-vault/vault-secret-management.png" />

### Identity based access
HashiCorp Vault uses identity-based access to broker access to systems and secrets. When it comes to authenticating via identity, there are two major actors: humans and machines.
<br />
Managing access for humans is done through role-based access control (RBAC), granting permission and restricting access to either create and manage secrets or manage other users’ access based on the secret value they are logged in with.
<br />
Managing access for machines on the other hand involves providing access to different servers or secrets. With the dynamic nature of HashiCorp Vault, you can create secrets that work temporarily and revoke access in the event of a breach. You can generate secrets on-demand for a particular system like AWS, or Consul and generate a key pair with valid permission. After usage, the dynamic secrets generated will be automatically revoked.

### Data encryption
Vault provides “encryption as a service,” encrypting data in transit (with TLS) and at rest (using AES 256-bit CBC encryption). This protects sensitive data from unauthorized access in two major ways: as it travels across your network as well as in storage in your cloud and datacenters.
<br />
With centralized key management, it’s straightforward to update and roll out new keys across distributed infrastructure.

## Conceptual Diagram

<img src="/techno/data/hashicorp-vault/vault-conceptual-diagram.png" />

_source: [hashicorp.com](https://hashicorp.com/)_

## Example implementations
### Kubernetes and static secrets
<img src="/techno/data/hashicorp-vault/vault-kubernetes-and-static-secrets.png" />

_Documentation support: <img src="/data/flag_fr.png" /> https://blog.octo.com/deployer-ses-application-dans-kubernetes-avec-des-secrets-vault/_

### Kubernetes and Dynamic Secrets
A dynamic secret is generated on demand and is unique to a client, instead of a static secret,

<img src="/techno/data/hashicorp-vault/vault-kubernetes-and-dynamic-secrets.png" />

## Further Reading
* [Vault: setting up Kubernetes auth and database secrets engine](https://medium.com/@jackalus/vault-kubernetes-auth-and-database-secrets-engine-6551d686a12)
* [Identity-based Security and Low-trust Networks](https://www.hashicorp.com/identity-based-security-and-low-trust-networks)
* [Dynamic Database Credentials with Vault and Kubernetes](https://www.hashicorp.com/blog/dynamic-database-credentials-with-vault-and-kubernetes)

[Back](/techno/README.md)