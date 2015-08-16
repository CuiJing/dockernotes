# gitbook

这里介绍如何使用Docker运行一个Gitbook的开发环境。

解决的问题是，我想编写一个使用gitbook维护的项目(dockernote)，但自己机器上没有安装gitbook/nodejs，也不像浪费时间安装部署，如何基于Docker快速构建一个这样的环境，供我开发、测试？


## 安装Docker
 * [Linux](../prepare/install-docker.md)
 * [Mac/Windows](../prepare/install-boot2docker.md)


## 获取镜像

```
docker pull tobegit3hub/gitbook-server
```

## 运行gitbook容器

```
#进入项目代码目录
cd dockernote/src

docker run -ti -d -v `pwd`:/gitbook -p 4000:4000 --name mygitbook  tobegit3hub/gitbook-server
```
通过执行上面的命令，gitbook server已经成功启动。可以通过`docker ps`查看运行的容器。

访问gitbook URL，请使用`http://localhost:4000/` （Mac下用的是`boot2docker`启动的VM，请把`localhost`换成`boot2docker ip`)


## Enjoy!
 试试这些命令：
 * **`docker ps`**
 * **`docker stop mygitbook`**
 * **`docker start mygitbook`**
 * **`docker restart mygitbook`**

>> 注意**`restart`**，并不等同于stop and start，因为这个的`restart`只是把容器内的进程重启了，容器还在运行中没有关闭.
代码更新后，需要重启生效的话，可以执行这个`restart`命令


这样，你就可以在自己的电脑目录中编辑你的代码，同时让容器中的gitbook环境帮你test、run、debug


