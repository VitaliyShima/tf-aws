# module AWS VPC route table association

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "vpc_rta_public1" {  #vpc_route_table_association
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/vpc-route-table-association.git"
  subnet_id      = module.vpc_subnet_public1.subnet_id               # id subnet которую мы ассоциируем с route table
  route_table_id = module.vpc_route_table_public1.route_table_id     # id route table к которумы мы ассоциируем subnet
}

```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/vpc-route-table-association.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
