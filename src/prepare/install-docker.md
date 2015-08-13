# 安装文档

> 如果OS内核版本过低，请先[升级内核][4]

## **安装**

```
curl -sSL https://get.daocloud.io/docker | sh
```

## **配置**
 * 配置insecure-registry
 * 配置加速器

```
# CentOS
sudo sed -i "s|other_args=\"|other_args=\"--insecure-registry 100.82.23.8:5000 |g" /etc/sysconfig/docker
sudo sed -i "s|OPTIONS='|OPTIONS='--insecure-registry 100.82.23.8:5000 |g" /etc/sysconfig/docker

sudo sed -i "s|other_args=\"|other_args=\"--registry-mirror=http://0ec4f9c1.m.daocloud.io |g" /etc/sysconfig/docker
sudo sed -i "s|OPTIONS='|OPTIONS='--registry-mirror=http://0ec4f9c1.m.daocloud.io |g" /etc/sysconfig/docker

# Mac 下需要进入boot2docker修改文件/var/lib/boot2docker/profile
```

## **启动**

```
service docker start
service docker status
```
_如果device-mapper 版本过低，请先[升级版本][3]_


* [Docker官方文档][1]
* [DaoCloud提供的安装方法][2]



[1]: https://docs.docker.com/
[2]: http://get.daocloud.io/#install-docker
[3]: ../faq.md#device-mapper
[4]: centeros.md
