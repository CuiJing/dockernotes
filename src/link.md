# Link

* 启动一个mysql容器，名字叫[my_mysql][1]
* 启动一个新容器my_app，并且加一个到mysql的link，这样就可以在新容器中访问mysql了

为了便于演示，同样使用mysql镜像启动新容器，只不过运行命令是`/bin/bash`:
**`docker  run -ti --rm --name=my_app --link=my_mysql mysql /bin/bash`**

 * 在my_app中， my_mysql容器的ENV信息已经配置在了容器my_app的环境变量中

```
[root@7 /root]
#docker  run -ti --rm --name=my_app --link=my_mysql mysql /bin/bash
root@2ec09fab7e77:/# env
HOSTNAME=2ec09fab7e77
TERM=xterm
MYSQL_VERSION=5.6.26
MY_MYSQL_NAME=/romantic_sammet/my_mysql
MY_MYSQL_ENV_MYSQL_MAJOR=5.6
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
MY_MYSQL_PORT=tcp://192.168.42.16:3306
PWD=/
MY_MYSQL_PORT_3306_TCP_PORT=3306
MY_MYSQL_PORT_3306_TCP_ADDR=192.168.42.16
MY_MYSQL_PORT_3306_TCP=tcp://192.168.42.16:3306
MY_MYSQL_PORT_3306_TCP_PROTO=tcp
HOME=/root
SHLVL=1
MY_MYSQL_ENV_MYSQL_VERSION=5.6.26
MYSQL_MAJOR=5.6
MY_MYSQL_ENV_MYSQL_ROOT_PASSWORD=123456
_=/usr/bin/env
root@2ec09fab7e77:/#
```

 * my_mysql的IP也已经加入到/etc/hosts文件中

```
root@2ec09fab7e77:/# cat /etc/hosts
192.168.42.40	2ec09fab7e77
127.0.0.1	localhost
::1	localhost ip6-localhost ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
192.168.42.16	my_mysql a3504af7e69e
```

 * 在my_app中可以直接使用`ping my_mysql`检查连通性,也可以通过mysql客户端连接**`mysql -hmy_mysql -uroot -p123456`**

```
root@2ec09fab7e77:/# ping my_mysql
PING my_mysql (192.168.42.16): 48 data bytes
56 bytes from 192.168.42.16: icmp_seq=0 ttl=64 time=0.157 ms
56 bytes from 192.168.42.16: icmp_seq=1 ttl=64 time=0.060 ms
^C--- my_mysql ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max/stddev = 0.060/0.108/0.157/0.049 ms
root@2ec09fab7e77:/# mysql -hmy_mysql -uroot -p123456
Warning: Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 1
Server version: 5.6.26 MySQL Community Server (GPL)

Copyright (c) 2000, 2015, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| t                  |
+--------------------+
4 rows in set (0.01 sec)

mysql> ^DBye
root@2ec09fab7e77:/#
```



[1]: case.md#mysql

