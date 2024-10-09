# module Autoscaling Group

## Первый шаг 
Перед началом использования модуля, просьба ознакомится с 
https://confluence.cleveroad.com/display/SYS/Module

## Второй шаг 
скопируйте в файл module.tf описаной в статье из ссылки выше

---

``` 
module "ec2_lb_target_group" {
  source = "git@gitlab.cleveroad.com:internal/devops/module/aws/ec2-lb-target-group.git"
  vpc_id = module.vpc_default.vpc_default_id # default value 'no_value'
  protocol = protocol # default value 'HTTPS'
  name_lb_target_group = "name_lb_target_group" # default value 'lb_target_group'
  #port = port # default value '443' 
  #path = path # default value '/healthcheck'
}
```

---

## Использование версий модулей
Версии модулей отмечаются тегами в репозитории (например: v1.0.0).
Для того чтобы использовать последнюю версию модуля надо посмотреть какая сейчас версия, и дописать её в конец адреса, строки source. Вот таким образом:
```
source = "git@gitlab.cleveroad.com:internal/devops/module/aws/ec2-lb-target-group.git?ref=v1.0.0"
```
Это позволит в дальнейшем использовать эту же версию модуля. 