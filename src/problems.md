# 重点关注问题
<!-- toc -->

## Auto-build Service & Image Private Registry

## Network Configuration

## Container Migration
 1. **Export the container to a tarball**

	`docker export <CONTAINER ID> > /home/export.tar`
 2. **Move your tarball to new machine**

 3. **Import it back**

     `cat /home/export.tar | docker import - some-name:latest`

## Link from Remote Host

## App Configuration

## Data Storage

 * log

 * local storage

