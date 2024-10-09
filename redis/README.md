# module AWS ElasticCache Redis

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "redis" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/redis.git"
  project_name = var.project_name
  env_project = var.env_project
  security_groups_id = [module.security_groups_redis.sg_id]
  subnet_group_name = module.elasticache_subnet_group.elasticache_subnet_group_name
  name_redis_instance = "${var.env_project}-redis"
  redis_version = "6.2"
  node_type = "cache.t2.micro" #cache.t2.micro
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/redis.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
