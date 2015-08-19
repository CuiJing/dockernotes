# 配置加速器
您的免费加速器:
使用加速器将会提升您在国内获取Docker官方镜像的速度

http://jingstory.m.alauda.cn

如何使用:

### 安装/升级 Docker

Docker相关手册： [Mac][1]    [Ubuntu][2]    [Debian][3]    [CentOS][4]    [Windows][5]

### 配置加速器

将您的加速器加入到docker配置文件中，不同系统会有区别

Windows

```
启动Boot2docker Start Shell
sudo "sh -c \"echo EXTRA_ARGS=\'--registry-mirror=http://jingstory.m.alauda.cn\' >> /var/lib/boot2docker/profile\""
重新启动Boot2Docker
```

Ubuntu | Debian | CentOS

```
echo "DOCKER_OPTS=\"\$DOCKER_OPTS --registry-mirror=http://jingstory.m.alauda.cn\"" | sudo tee -a /etc/default/docker
sudo service docker restart
```

Mac

```
boot2docker ssh sudo "sh -c \"echo EXTRA_ARGS=\'--registry-mirror=http://jingstory.m.alauda.cn\' >> /var/lib/boot2docker/profile\""
boot2docker restart
```

### 使用

docker pull <image_name> 


[1]: http://docs.docker.com/installation/mac/
[2]: http://docs.docker.com/installation/ubuntulinux/
[3]: http://docs.docker.com/installation/debian/
[4]: http://docs.docker.com/installation/centos/
[5]: http://docs.docker.com/installation/windows/
