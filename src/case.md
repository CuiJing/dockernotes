# 最佳实践

## MySQL
[Dockerfile][2]
* 拉取镜像，创建mysql数据目录
* 启动容器，挂载数据目录， 指定root密码，指定端口3306映射等
```
docker pull mysql
mkdir -p /home/docker-mysql/ 
docker  run -d --name=my_mysql -e MYSQL_ROOT_PASSWORD=123456 -p 3306:3306 -v /home/docker-mysql:/var/lib/mysql mysql
```

## Docker-Registry
* 拉取镜像，创建镜像目录
* 启动容器，挂载镜像目录，指定搜索引擎，端口映射等
```
docker pull registry
mkdir -p /home/docker-registry-data
docker run -d -e SETTINGS_FLAVOR=local -e SEARCH_BACKEND=sqlalchemy -e LOGLEVEL=DEBUG -p 80:5000 -v /home/docker-registry-data:/tmp/registry  --name=my_registry registry
```


## Dockerfile-from-image

往往获取一个镜像之后，想知道他的Dockerfile是怎么写的，去找github上的代码是一种办法，这里提供一种更简单的方法——直接从镜像中读取  
当然，这种方法只能从镜像的Config中读取包含的命令、端口、环境变量等信息，并不是真正的build时用到的Dockerfile
项目介绍 [github][1]

* 指定docker daemon的sock文件，启动容器，指定镜像
```
docker pull centurylink/dockerfile-from-image
docker run -v /var/run/docker.sock:/var/run/docker.sock centurylink/dockerfile-from-image mysql
```

## DockerUI
通过Docker API对Docker Server管理的一个Web UI
可以连接一个Docker Server（通过UnixSocket或TCP），也可以连接一个[Swarm](case/swarm.md) Manager（TCP）
```
docker run -d -p 9000:9000 --privileged -v /var/run/docker.sock:/var/run/docker.sock --name=dockerui03 100.82.23.8/dockerui/dockerui
docker run -d -p 9000:9000 --privileged --name=dockerui 100.82.23.8/dockerui/dockerui  -e http://10.14.40.112:2376
```




[1]: https://github.com/CenturyLinkLabs/dockerfile-from-image
[2]: https://github.com/docker-library/mysql/blob/master/5.6/Dockerfile
