# module AWS VPC route table "aws route table"

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "vpc_route_table_public1" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/vpc-route-table.git"
  env_project = var.env_project                     # Глобальная переменная Название окружения которое мы будем разворачивать.   
  name_object = "vrt_public1"                       # Уникальное имя для aws vpc route table
  vpc_id = module.custom_vpc.vpc_id                 # ID vpc в которой мы поднымаем route table
  cidr_block = "0.0.0.0/0"
  gateway_id = module.vpc_igw.igw_id                # ID vpc internet gateway (для публичной таблицы), ID vpc nat gateway (для приватной таблицы) 
}

```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/vpc-route-table.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 