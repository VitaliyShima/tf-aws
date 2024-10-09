# module AWS RDS subnet

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "rds_subnet_group" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/rds-subnet.git"
  name_subnet       = var.project_name
  subnet_ids = [module.vpc_subnet_privat1.subnet_id, module.vpc_subnet_privat2.subnet_id]
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/rds-subnet.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
