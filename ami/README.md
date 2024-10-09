# module AMI

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "ami" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/ami.git"
  project_name = var.project_name                   # Глобальная переменная
  env_project = var.env_project                     # Глобальная переменная
  # name_ami = "ami_template_from_ec2"              # default
  source_instance_id = module.ec2.ec2_id            # результат работы модуля ec2 (id)
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/ami.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
