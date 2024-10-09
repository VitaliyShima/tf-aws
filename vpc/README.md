# module AWS VPC

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "custom_vpc" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/vpc.git"
  project_name = var.project_name       # Глобальная переменная. Имя проекта котором будем разворачивать
  env_project = var.env_project         # Глобальная переменная Название окружения которое мы будем разворачивать.
  cidr_block = "10.0.0.0/16"
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/vpc.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 

