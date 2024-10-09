# module AWS VPC-igw "aws internet gateway"

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "vpc_igw" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/vpc-igw.git"
  env_project = var.env_project       # Глобальная переменная Название окружения которое мы будем разворачивать.
  name_object = "igw"                 # Уникальное имя для aws internet gateway
  vpc_id = module.custom_vpc.vpc_id   # ID vpc в которой мы поднымаем internet gateway
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/vpc-igw.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
