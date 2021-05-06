<img src="/techno/data/podman/podman-logo.png" align="right" width="20%" />

[Back](/techno/README.md)

# Podman

**Table of contents**
1. [What is Podman?](#what-is-podman)
2. [Alternatives](#alternatives)
2. [Conceptual Diagram](#conceptual-diagram)
3. [Example](#example)
4. [Diving Deeper](#diving-deeper)

## What is Podman?
Podman is a container engine developed by RedHat.

Podman is a daemonless container engine for developing, managing, and running OCI Containers on your Linux System.
Containers can either be run as root or in rootless mode. 

Podman is being developed alongside other projects that focus on other stages of the container lifecycle:
* [Buildah](https://buildah.io/): specialized in the construction of images
* [Skopeo](https://github.com/containers/skopeo): specialized in image and registry management

Red Hat recommends the use of [podman](https://podman.io/) as well as the container tools [buildah](https://buildah.io/), [skopeo](https://github.com/containers/skopeo), [conmon](https://github.com/containers/conmon), [runc](https://github.com/opencontainers/runc) + ... for a development environment.

Podman brings with it the Pod system introduced by Kubernetes.

> More details: https://podman.io/whatis.html

**Why choose Podman**
* Podman + libpod: no need to start a daemon anymore
* Each container is executed without root privilege
* Podman accepts the creation and execution of Pods from (YAML manifests) Kubernetes
* It allows the storage spaces of the different users of the system to be isolated with all the advantages (safety, insulation, etc.) but also all the disadvantages (possible duplication of images and other data) that this involves.

Podman allows a simple transition from the local development environment to the Kubernetes production environment.

**Podman Command**
> Doc: http://docs.podman.io/en/latest/Commands.html

## Alternatives
Podman can be a good alternative to [Docker](https://www.docker.com/)

The adoption of Podman as the default container engine under RHEL 8 is a strong signal to consider this solution as mature and credible, to finally do without Docker. Indeed, Red Hat doesn't lightly make technological choices when it comes to providing 10 years support for the solution.

<img src="/techno/data/podman/docker-vs-podman.png" align="center" width="50%" />

## Conceptual Diagram

<img src="/techno/data/podman/podman-conceptual-diagram.png" align="center" width="40%" />

## Example
* Start by installing Podman: [Podman Installation Instructions](https://podman.io/getting-started/installation.html)

**Check podman version**
```
podman version
```
<img src="/techno/data/podman/test-podman-version.png" align="left" />

Note: You can display information pertaining to the host, current storage stats, and build of podman.
```
podman info
```

**Test Podman installation (pull image)**
Pull Alpine docker image.
```
podman pull alpine
```

<img src="/techno/data/podman/test-podman-setup.png" align="left" />

**Podman simple test**
In this example we're going to create a pod and deploy an ngnix that doesn't do much.
But above all, it is about showing the approach with Podman.

```
# Create the Pod myfirstpod which will be available on port 80.
podman pod create --name firstpod -p 8080:80

# Deployed nginx
podman run -dt --name nginx \
--pod firstpod \
--restart on-failure \
docker.io/nginx

# Test deployment
curl localhost:8080
```

<img src="/techno/data/podman/podman-test-ngnix.png" align="left" />


## Diving Deeper
* [Transitioning from Docker to Podman](https://developers.redhat.com/blog/2020/11/19/transitioning-from-docker-to-podman/) | Red Hat Blog
* [Podman and Buildah for Docker users](https://developers.redhat.com/blog/2019/02/21/podman-and-buildah-for-docker-users/) | Red Hat Blog
* [Podman - The next generation of Linux container tools](https://developers.redhat.com/articles/podman-next-generation-linux-container-tools) | Red Hat Blog

[Back](/techno/README.md)