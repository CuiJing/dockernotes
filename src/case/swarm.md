# swarm


Swarm是Docker的集群管理系统，目前还只BETA版，不推荐在生产系统中使用。


### Swarm的体系和定位：

* Node
一个Node是指一个Docker Server

* Swarm Manager
一个类Docker Server的Swarm Manager，兼容大部分命令，Docker client直接访问Swarm Manager即可完成对其管辖的Node的操作。


### Swarm内部 
Swarm内部由这几个模块组成：

* Discovery
负责节点发现，维护NodeList；支持多种Discovery方法（有file/zookeeper/mesos/etcd等）；

* Scheduling
负责新建容器在Node间的调度和分配。提供过滤器(filters)和策略(strategies)，可以基于此完成一些较为复杂的调度需求.

* API Server
给Docker client提供接入支持，兼容Docker API接口，并且在原有的基础上扩展了一些新的接口.



