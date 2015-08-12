# Registry

这里有一篇[文章][2]详细记录了整个过程，简单总结如下：


1 [安装docker](prepare/install-docker.md) 
1 [安装加速器][1]
1 下载registry镜像
```docker pull registry```
1 尝试运行registry容器
```
# run & test
[root@ /home]
#docker run -p 5000:5000 -d --name=basic_registry registry
efd8b763f02f63bb64cf5e2a41bf714017db801777eed0238cc39959bddf30a0

[root@ /home]
#curl 127.0.0.1:5000
"\"docker-registry server\""

#  stop & drop
[root@8 /home]
#docker  stop efd8b763f02f63bb64cf5e2a41bf714017db801777eed0238cc39959bddf30a0
dockefd8b763f02f63bb64cf5e2a41bf714017db801777eed0238cc39959bddf30a0

[root@8 /home]
#docker rm efd8b763f02f63bb64cf5e2a41bf714017db801777eed0238cc39959bddf30a0
efd8b763f02f63bb64cf5e2a41bf714017db801777eed0238cc39959bddf30a0
```

1 修改配置文件，编写Dockerfile，生成新的镜像`docker build -t my_registry .`
1 启动Redis
```
docker pull redis
docker run -d --name registry-redis redis
```
1 启动Registry
```
# 映射本地路径
mkdir -p /home/docker-registry-data

# For a non-Redis cache registry
docker run -d -p 5000:5000 -v /home/docker-registry-data:/data --name=private_reg my_registry

# For a Redis cached registry (Must have followed Redis Caching section above)
docker run -d -p 5000:5000 -v /home/docker-registry-data:/data --name=private_reg --link registry-redis:redis my_registry
```


## 客户端使用

* 查看镜像
```
21:11:47[jcr].dockernotes/ $ docker images
REPOSITORY                   TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
jcr/dockernotes              latest              7a919a84cad4        34 hours ago        748.9 MB
<none>                       <none>              fb99cae5ec71        2 days ago          215.5 MB
ubuntu                       latest              8251da35e7a7        4 days ago          188.4 MB
hello-world                  latest              af340544ed62        5 days ago          960 B
node                         latest              9e20baae42c8        5 days ago          641.6 MB
tobegit3hub/gitbook-server   latest              fef658521110        8 days ago          862.1 MB
nginx                        latest              6886fb5a9b8d        3 weeks ago         132.9 MB
ubuntu                       14.10               dce38fb57986        4 weeks ago         194.5 MB
```

* 推送image到registry
```
21:11:51[jcr].dockernotes/ $ docker tag jcr/dockernotes 1.2.3.4:5000/dockernodes
21:12:37[jcr].dockernotes/ $ docker push 1.2.3.4:5000/dockernodes
The push refers to a repository [1.2.3.4:5000/dockernodes] (len: 1)
Sending image list
Pushing repository 1.2.3.4:5000/dockernodes (1 tags)
902b87aaaec9: Image successfully pushed
9a61b6b1315e: Image successfully pushed
1ff9f26f09fb: Image successfully pushed
607e965985c1: Image successfully pushed
9213e81cb0f2: Image successfully pushed
6ad0799af6bd: Image successfully pushed
e0919a8b95a8: Image successfully pushed
3383909e8f95: Image successfully pushed
8b74d7a75802: Image successfully pushed
9e20baae42c8: Image successfully pushed
1b3f134bba26: Image successfully pushed
dacdf22d91db: Image successfully pushed
e5db2f92004b: Image successfully pushed
14f391f0328a: Image successfully pushed
17d5584b7640: Image successfully pushed
5fc64973886a: Image successfully pushed
e017b808efeb: Image successfully pushed
7a919a84cad4: Image successfully pushed
Pushing tag for rev [7a919a84cad4] on {http://1.2.3.4:5000/v1/repositories/dockernodes/tags/latest}
```

* registry服务器的数据
```
[root@8 /home/docker-registry-data]
#tree
.
├── images
│   ├── 1ff9f26f09fb1bc7b5955c269b1042429e86d7891c653f52f3e48f1e0365d7df
│   │   ├── ancestry
│   │   ├── _checksum
│   │   ├── json
│   │   └── layer
│   ├── 607e965985c11e6a23270feec487908aeaa9af763d24a2986866a41537770c8c
│   │   ├── ancestry
│   │   ├── _inprogress
│   │   ├── json
│   │   └── layer
│   ├── 902b87aaaec929e80541486828959f14fa061f529ad7f37ab300d4ef9f3a0dbf
│   │   ├── ancestry
│   │   ├── _checksum
│   │   ├── json
│   │   └── layer
│   └── 9a61b6b1315e6b457c31a03346ab94486a2f5397f4a82219bee01eead1c34c2e
│       ├── ancestry
│       ├── _checksum
│       ├── json
│       └── layer
└── repositories
    └── library
        └── dockernodes
            └── _index_images

8 directories, 17 files
```

>> 注意：
* 客户端连接的时候会出现SSL证书问题，[解决办法][1]
 


[1]: faq.md#registry-ssl
