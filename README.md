PHP 7 (FPM) Docker images
=================

This repository contains the source for building a PHP 7 with NGINX as a reproducible Docker image using [source-to-image](https://github.com/openshift/source-to-image).
Users can choose between RHEL and CentOS based builder images.
The resulting image can be run using [Docker](http://docker.io).

For more information about using these images with OpenShift, please see the
official [OpenShift Documentation](https://docs.openshift.org/latest/using_images/s2i_images/php.html).

Versions
---------------
PHP versions currently supported are:
* php-7.1
* php-7.2

RHEL versions currently supported are:
* RHEL7

CentOS versions currently supported are:
* CentOS7

Installation
---------------
To build a PHP image, choose either the CentOS or RHEL based image:
*  **RHEL based image**

    To build a RHEL based PHP-5.5 image, you need to run the build on a properly
    subscribed RHEL machine.

    ```
    $ git clone https://github.com/openshift/s2i-php.git
    $ cd s2i-php
    $ make build TARGET=rhel7 VERSION=7.1
    ```

*  **CentOS based image**
    ```
    $ git clone https://github.com/UniqKeyp/s2i-nginx-php7-container.git
    $ cd s2i-nginx-php7-container
    $ make build VERSION=7.1
    ```

Alternatively, you can pull the CentOS image from Docker Hub via:

    $ docker pull uniqkey/s2i-nginx-php71

**Notice: By omitting the `VERSION` parameter, the build/test action will be performed
on all the supported versions of PHP.**

Test
---------------------
This repository also provides a [S2I](https://github.com/openshift/source-to-image) test framework,
which launches tests to check functionality of a simple PHP application built on top of the s2i-php image.

Users can choose between testing a PHP test application based on a RHEL or CentOS image.

*  **RHEL based image**

    This image is not available as a trusted build in [Docker Index](https://index.docker.io).

    To test a RHEL7 based PHP-5.5 image, you need to run the test on a properly
    subscribed RHEL machine.

    ```
    $ cd s2i-php
    $ make test TARGET=rhel7 VERSION=7.2
    ```

*  **CentOS based image**

    ```
    $ cd s2i-php
    $ make test VERSION=7.2
    ```

**Notice: By omitting the `VERSION` parameter, the build/test action will be performed
on all the supported versions of PHP. Since we currently only support version `5.5`
you can omit this parameter.**


Repository organization
------------------------
* **`<php-version>`**

    Dockerfile and scripts to build container images from.

* **`hack/`**

    Folder containing scripts which are responsible for the build and test actions performed by the `Makefile`.

Public `s2i` Images
--------------------

* `uniqkey/s2i-nginx-php71`
* `uniqkey/s2i-nginx-php72` 

