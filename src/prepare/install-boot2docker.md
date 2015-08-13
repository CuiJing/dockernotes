# 安装Boot2Docker

## KeyWords
Boot2Docker是做什么的？在解释前，先弄清楚几个名词

 * **`Docker host`**运行Docker容器的主机

 * **`Docker client`**管理操作Docker的客户端

 * **`Docker daemon`**运行容器的服务端

关于这些概念，[在Mac上安装Docker][1] ,  [Docker架构][2] 有详细的描述。


## Windows/Mac 
在Windows和Mac上，如果想运行Docker，需要通过boot2docker运行的Linux VM去运行Docker daemon。

经典的Linux上的布局是这样的:

![linux_docker_host](linux_docker_host.svg)

Docker host就是这台Linux，而Docker client, Docker daemon都跑在它上面.

但是在Mac上，Docker host指的是Linux VM，Docker daemon运行其中，Docker client运行在Mac OS X中，与Linux VM中的Docker daemon通讯。

![mac_docker_host](mac_docker_host.svg)

## HowToInstall

参考： [在 Windows/Mac 上安装 Docker][3]

[1]: http://docs.docker.com/installation/mac/
[2]: http://blog.daocloud.io/docker-source-code-analysis-part1/
[3]: http://get.daocloud.io/#install-boot2docker
