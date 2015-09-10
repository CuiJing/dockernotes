
## 私有Registry仓库

* 为了数据安全和工程效率，我们或许需要一套自己的私有镜像仓库。这时候可能会用到[registry][1]

* 为了镜像的安全和同步，我们或许会把文件保存在OSS上，这时候可以用到 [registry_alioss][2]

这里增加了一个配置项 `OSS_HOST` 便于在启动时指定特定的OSS HOST（比如`oss-cn-hangzhou.aliyuncs.com`)

* 我们可以在不同的区域部署多个registry container，底层用同一个OSS bucket。

```
docker run -ti -e OSS_HOST=oss.aliyuncs.com -e OSS_BUCKET=rds-registry -e STORAGE_PATH=/main/ -e OSS_KEY=xxx -e OSS_SECRET=xxx -p 5000:5000  registry_alioss
```



[1]: prepare/install-docker-registry.md
[2]: https://github.com/chris-jin/docker-registry-alioss


