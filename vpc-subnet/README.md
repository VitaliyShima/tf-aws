# module AWS VPC subnet

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "vpc_subnet_privat1" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/vpc-subnet.git"
  vpc_id = module.custom_vpc.vpc_id                         # ID vpc в которой мы поднымаем internet gateway
  name_object = "privat1"                                   # Уникальное имя для aws vpc subnet
  env_project = var.env_project                             # Глобальная переменная Название окружения которое мы будем разворачивать.
  availability_zone = "${var.region}a"                      # переменная доступной зоны в которой мы подымаем
  cidr_block = "10.0.144.0/20"                              # privat "10.0.144.0/20" , "10.0.128.0/20"; public "10.0.0.0/20"
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/vpc-subnet.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 