# module Autoscaling Group

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "asg" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/asg.git"
  project_name = var.project_name                           # Глобальная переменная
  env_project = var.env_project                             # Глобальная переменная
  region = var.region                                       # Глобальная переменная
  instance_type = "t2.micro"                                # Тип EC2 инстанса развернутого ASG
  alb_target_group_arn = module.elb.elb_arn                 # результат работы модуля elb (arn)
  image_id = module.ami.ami_id                              # результат работы модуля ami (id)
  security_groups = module.security_groups_ec2.sg_name      # результат работы модуля ec2 (SG name)
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/asg.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 
