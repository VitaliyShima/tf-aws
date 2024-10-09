# module AWS ElastiCache Subnet group

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module elasticache_subnet_group {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/elasticache_subnet_group.git"
  name_elasti_subnet = "subnet-redis-${var.env_project}"                              # name subnet group
  subnet_ids = [module.vpc_subnet_privat1.subnet_id]                                  # список ID приватных subnet из которых будет состоять ElastiCache Subnet group
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/elasticache_subnet_group.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
