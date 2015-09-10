# compose

## Q1 Compose Linked-ContainerIP Changed
在compose中使用link，如果依赖的应用更新了（重新部署），会导致ContainerIP变化，依赖它的其他Container中的/etc/hosts中不会自动更新，这个问题怎么解决？
