# 常见问题

<!-- toc -->

## device-mapper

在启动docker时报错如下：

```
fatal error: unexpected signal during runtime execution
[signal 0xb code=0x1 addr=0x0 pc=0x0]

runtime stack:
runtime.gothrow(0xd6e670, 0x2a)
        /usr/local/go/src/runtime/panic.go:503 +0x8e
runtime.sigpanic()
        /usr/local/go/src/runtime/sigpanic_unix.go:14 +0x5e
```

使用`yum install  device-mapper`更新到最新版本，推荐使用aliyun镜像

```
## aliyun-mirror
wget -O /etc/yum.repos.d/CentOS-Base-aliyun.repo http://mirrors.aliyun.com/repo/Centos-6.repo
```


## docker0

在启动时创建网桥docker0接口失败，报错日志如下
```
level=fatal msg="Error starting daemon: Error initializing network controller: Error creating default \"bridge\" network: can't find an address range for interface \"docker0\""
```

原因是docker会通过网桥，使宿主机和容器在一个网络中，进行通信.
```
sed '/^192.168.0.0/d' /etc/sysconfig/network-scripts/route-bond0 -i
ip route del 192.168.0.0/16 
```

## docker-kill

   * [docker stop][1]: Stop a running container (send SIGTERM, and then SIGKILL after grace period) [...] The main process inside the container will receive SIGTERM, and after a grace period, SIGKILL. [emphasis mine]
   * [docker kill][2]: Kill a running container (send SIGKILL, or specified signal) [...] The main process inside the container will be sent SIGKILL, or any signal specified with option --signal. [emphasis mine]

[这里][3]有一篇解答

## registry-ssl

通过`docker login 100.82.23.8:5000`连接自建registry的时候，报这个错误：
```
20:53:07[jcr].dockernotes/ $ docker login 100.82.23.8:5000
Username: a
Password:
Email: s
Error response from daemon: invalid registry endpoint https://100.82.23.8:5000/v0/: unable to ping registry endpoint https://100.82.23.8:5000/v0/
v2 ping attempt failed with error: Get https://100.82.23.8:5000/v2/: EOF
 v1 ping attempt failed with error: Get https://100.82.23.8:5000/v1/_ping: EOF. If this private registry supports only HTTP or HTTPS with an unknown CA certificate, please add `--insecure-registry 100.82.23.8:5000` to the daemon's arguments. In the case of HTTPS, if you have access to the registry's CA certificate, no need for the flag; simply place the CA certificate at /etc/docker/certs.d/100.82.23.8:5000/ca.crt
```

需要增加`--insecure-registry 10.0.0.26:5000`到启动项中
```
# Mac
boot2docker ssh "echo $'EXTRA_ARGS=\"--insecure-registry 100.82.23.8:5000\"' | sudo tee -a /var/lib/boot2docker/profile && sudo /etc/init.d/docker restart"

# CentOS6
sudo sed -i "s|other_args=\"|other_args=\"--insecure-registry 100.82.23.8:5000 |g" /etc/sysconfig/docker
sudo sed -i "s|OPTIONS='|OPTIONS='--insecure-registry 100.82.23.8:5000 |g" /etc/sysconfig/docker
sudo service docker restart

```



## registry-mirror
为了提高镜像的下载速度，使用国内DaoCloud提供的[加速器][4]，Powered by UCloud & 七牛云存储 | [配置文档][4]
```
# Mac
boot2docker up
boot2docker ssh "echo $'EXTRA_ARGS=\"--registry-mirror=http://0ec4f9c1.m.daocloud.io\"' | sudo tee -a /var/lib/boot2docker/profile && sudo /etc/init.d/docker restart"

# CentOS 6
sudo sed -i "s|other_args=\"|other_args=\"--registry-mirror=http://0ec4f9c1.m.daocloud.io |g" /etc/sysconfig/docker
sudo sed -i "s|OPTIONS='|OPTIONS='--registry-mirror=http://0ec4f9c1.m.daocloud.io |g" /etc/sysconfig/docker
sudo service docker restart
```



[1]: http://docs.docker.io/reference/commandline/cli/#stop
[2]: http://docs.docker.io/reference/commandline/cli/#kill
[3]: http://superuser.com/questions/756999/whats-the-difference-between-docker-stop-and-docker-kill
[4]: https://dashboard.daocloud.io/mirror
[5]: http://help.daocloud.io/intro/accelerator.html

