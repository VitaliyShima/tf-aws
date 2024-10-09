# module AWS VPC-ngw "AWS nat gateway"

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module nat_gateway {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/vpc-ngw.git"
  eip_id = "" # for eip id
  status_connectivaty = "private"                 # private and public
  subnet_id = module.vpc_subnet_privat1.subnet_id # Subnet id приватной сети
  name_object = "custom_for_${var.project_name}"  # Уникальное имя для AWS nat gateway
  env_project = var.env_project                   # Глобальная переменная Название окружения которое мы будем разворачивать.
}

```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/vpc-ngw.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 