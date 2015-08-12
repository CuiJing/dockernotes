# CentOS

## CentOS 6.5升级内核


### 安装内核包
```
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-6-6.el6.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel install kernel-lt -y
```


### 修改GRUB引导顺序
[GRUB][1]可以允许计算机在启动时选择希望运行的操作系统。打开文件`/boot/grub/grub.conf` 修改默认kernel序号：**default=0**（一般新安装的排在最前面)
* 参考[Verifying the Boot Loader][1]

```
sed 's/^default.*/default=0/g' /boot/grub/grub.conf -i
```


### 重启机器
检查内核版本
```
[root@iZ28125bfqqZ ~]# uname  -a
Linux iZ28125bfqqZ 3.10.85-1.el6.elrepo.x86_64 #1 SMP Tue Aug 4 13:23:52 EDT 2015 x86_64 x86_64 x86_64 GNU/Linux
```


[1]: https://zh.wikipedia.org/wiki/GNU_GRUB
[2]: https://www.centos.org/docs/5/html/Deployment_Guide-en-US/s1-kernel-boot-loader.html

 

